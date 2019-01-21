#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <getopt.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <string.h>
#include <signal.h>
//#include "Set_Uart.c"
#include <linux/i2c.h>
#include <linux/i2c-dev.h>

//GSUI2C_SCL W20 LVCMOS33
//SUI2C_SDA Y18
#define DEV_I2C "/dev/i2c-0"//


#define REG_0x00 0x00//（只读）	板卡类型读取
#define REG_0x01 0x01//（只读）	背板检测
#define REG_0x02 0x02//（只读）	工程版本号
#define REG_0x03 0x03//（只写）	总线切换
#define REG_0x04 0x04//（读写）	总线测试

#define REG_0x10 0x10//（读写）	第0路采样频率
#define REG_0x11 0x11//（读写）	第1路采样频率
#define REG_0x12 0x12//（读写）	第2路采样频率
#define REG_0x13 0x13//（读写）	第3路采样频率
#define REG_0x14 0x14//（读写）	第4路采样频率
#define REG_0x15 0x15//（读写）	第5路采样频率
#define REG_0x16 0x16//（读写）	第6路采样频率
#define REG_0x17 0x17//（读写）	第7路采样频率

#define REG_0x20 0x20//（读写）	各通道工作状态灯
#define REG_0x21 0x21//（读写）	各通道偏移自校准（对AD芯片内部进行校准）
#define REG_0x22 0x22//（读写）	各通道继电器控制（传感器类型选择）


#define EEPROM_IS 0//当前交付硬件无EEPROM

int eeprom_id;//记录当前的eeprom所属的槽位号，未切换到EEPROM时为0xff

#define max_eeprom 32768//eeprom存储最大字节数
char eeprom_data[max_eeprom];//存放EEPROM数据
char eeprom_data_ack[max_eeprom];//存放EEPROM数据
char IIC_ADD[10]={0x01,0x02,0x03,0x04,0x05,0x06,0x09,0x0a,0x0d,0x0e};//10个插槽对应的IIC设备地址，顺序为面向屏幕从右到左为0-9
struct IIC_de {
	int is;//是否插入从板，0未插入通讯不正常，1插入IIC通讯正常
	int board_type;//两种类型：类型2和类型3     2：类型2    3：类型3
	int version;//号码表示固件版本
	int eeprom_is;//0：寄存器通信 1：EEPROM通信   默认为0（10个板卡中同一时间只有一个板卡能与EEPROM通信）
	int Status;//0为未进行状态查询，1为振动信号接口板；2为接口板对接错误；3为其他错误
	int test_data;//0：真实采样数据    1：测试数据    默认为0
	unsigned char freq[8];//存储当前所有的采样频率，
									//类型2板：（0:100KHz 1:50KHz 2:25KHz 3:5KHz 默认为0）
									//类型3板：(0:500Hz 1:250Hz 2:100Hz 3:50Hz 默认为0)
	unsigned char led;//8个通道工作状态灯 当前颜色 0：绿灯 1：红灯
	unsigned char sensor_type;//每一bit控制一个通道   1:选择B类传感器  0:选择A类传感器 默认为A类传感器(类型3无此数据)
}IIC_dev[10];//iic从板设数据结构体0-9

/*
fd:IIC设备
buff数据空间
addr寄存器地址
count读取数量
*/
int iic_read(int fd, char buff[], int addr, int count)
{
    int res;
    char sendbuffer1[2];
    sendbuffer1[0]=addr;
   // sendbuffer1[1]=addr;
    write(fd,sendbuffer1,1);
        res=read(fd,buff,count);
      //  printf("read %d byte at 0x%x\n", res, addr);
        return res;
}
//在写之前，在数据前加两个byte的参数，根据需要解析
/*
fd:II设备
buff数据空间
addr寄存器地址
count写入数量
*/
int iic_write(int fd, char buff[], int addr, int count)
{
        int res;
        int i,n;
        static char sendbuffer[10];
        memcpy(sendbuffer+1, buff, count);
        sendbuffer[0]=addr;
   // sendbuffer[1]=addr;
        res=write(fd,sendbuffer,count+1);
       // printf("write %d byte at 0x%x\n", res, addr);
        return res;
}

/*
功能:板卡类型读取
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
返回：0:错误,2：类型2，3：类型3，
*/
int Board_type(int f_iic,char b)
{
	int ret;
	char r;
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom \n");return 0;}
	ret = ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);
	if(iic_read(f_iic,&r,0x00,1)<0)
	{printf("IIC总线读取失败 \n"); return 0; }
	else
		{return r;}
}

/*
功能:背板状态检测
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
返回：0:错误，1为振动信号接口板；2为接口板对接错误；3为其他错误； 若错误则不进行采集程序；
*/
int Status_ack(int f_iic,char b)
{
	int ret;
	char r;
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom \n");return 0;}
	ret = ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址[6:0]
	if(iic_read(f_iic,&r,0x01,1)<0)
	{printf("IIC总线读取失败\n"); return 0; }
	else return r;
}
/*
功能:工程版本号
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
返回：0:错误，其他：版本号码，0x0a对应V1.0
*/
int Project_version(int f_iic,char b)
{
	int ret;
	char r;
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom \n");return 0;}
	ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址[6:0]
	if(iic_read(f_iic,&r,0x02,1)<0)
	{printf("IIC总线读取失败\n");return 0;}
	else return r;
}
/*
功能:总线切换
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:n:1：切换到eeprom,2:切换到寄存器通讯
返回：0:IIC总线错误，1：切换成功
*/
int eeprom_is_switch(int f_iic,char b,int n)
{
	char d;
	d=n;

    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if((IIC_dev[b].eeprom_is==1)&&(d==1))
	{printf("当前总线已经为eeprom \n");return 1;}
	else
	{
		ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址[6:0]
		if(iic_write(f_iic,&d,0x03,1)<0)
		{printf("IIC总线写失败eeprom_is_switch\n");return 0;}
		else
		{ return 1;}
	}
}

/*
功能:总线测试
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
返回：0不通畅,1通畅,
*/
int bus_test(int f_iic,char b)
{
	int ret;
	char r;
	char d[2]={0xa5};
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom \n");return 0;}

	 ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址[6:0]
	iic_write(f_iic,d,0x04,1);
	if(iic_read(f_iic,&d[1],0x04,1)<0)
	{/*printf("地址0x%x的板卡测试失败\n",b);*/return 0;}
	else
	{
		if(d[0]==d[1])
		{
			return 1;
		}
	}

}

/*
功能:数据切换
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:n:1：切换到测试数据,0:切换到真实数据
返回：0切换不成功,1切换成功
*/
int data_is(int f_iic,char b,char n)
{
	int ret;
	char r;
	char d[2]={0xa5,0x5a};
	d[0]=n;
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom \n");return 0;}

	if(IIC_dev[b].test_data==n)return 1;
		
	 ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址[6:0]
	iic_write(f_iic,d,0x05,1);
	if(iic_read(f_iic,&d[1],0x05,1)<0)
	{/*printf("地址0x%x的板卡测试失败\n",b);*/return 0;}
	else
	{
		if(d[0]==d[1])
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
}


/*
功能:设置第n路采样频率
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:n:第n路（0-7）,类型3此参数必须为0
参数:f:频率0:100KHz 1:50KHz 2:25KHz 3:5KHz 默认为0
返回：-1:错误，其他:当前频率
*/
int frequency(int f_iic,char b,char n,char f)
{
	char f1;
    if(b<0||b>9){printf("槽位号错误\n");return -1;}

    if(n<0||n>7){printf("路序号设置错误\n");return -1;}

    if(f<0||f>3){printf("频率设置错误\n");return -1;}

	if((IIC_dev[b].board_type==3)&&(n>0))
	{printf("参数错误，类型3设置的路数必须为0\n",b);return -1;}

	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom \n");return -1;}

	if(IIC_dev[b].freq[n]==f)
	{printf("当前采样率以为设置值\n",b);return f;}

	 ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址[6:0]
	if(iic_write(f_iic,&f,n+0x10,1)<0)
	{printf("IIC总线读取失败frequency\n");return -1;}
	if(iic_read(f_iic,&f1,n+0x10,1)<0)
	{printf("IIC总线读取失败frequency\n");return -1;}

	if(f==f1)return f;
}
/*
功能:设置各通道工作状态灯
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:n:每一bit控制一个灯     0：绿灯 1：红灯
返回：0:错误，1：成功
*/
int set_led(int f_iic,char b,char n)
{
	char n1;

    if(b<0||b>9){printf("槽位号错误\n");return -1;}
	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom \n");return 0;}

	 ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址
	if(iic_write(f_iic,&n,0x20,1)<0)
	{printf("IIC总线写失败\n");return 0;}
	if(iic_read(f_iic,&n1,0x20,1)<0)
	{printf("IIC总线读失败\n");return 0;}
	else if(n==n1) return 1;

}
/*
功能:各通道偏移自校准（对AD芯片内部进行校准）
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
返回：0失败，1成功
*/
//Self_calibration
int Self_calibration(int f_iic,char b)
{
	char a=0xff,c=0x00;

    if(b<0||b>9){printf("槽位号错误\n");return -1;}
	if(IIC_dev[b].board_type==3)
	{printf("类型3无校准功能\n",b);return 0;}

	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom\n");return 0;}

	ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址
	if(iic_write(f_iic,&a,0x21,1)<0)
	{printf("IIC总线写失败\n");return 0;}
	if(iic_write(f_iic,&c,0x21,1)<0)
	{printf("IIC总线写失败\n");return 0;}

	return 1;
}
/*
功能:各通道继电器控制（传感器类型选择）
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:n:每一bit控制一个  1:选择B类传感器  0:选择A类传感器 默认为A类传感器
返回：0:错误，1：成功
*/
int Relay_control(int f_iic,char b,char n)
{
	char a=0x0,c=0xff;

    if(b<0||b>9){printf("槽位号错误\n");return -1;}
	if(IIC_dev[b].board_type==3)
	{printf("类型3无继电器控制功能\n",b);return 0;}

	if(IIC_dev[b].eeprom_is==1)
	{printf("无法操作,当前总线为eeprom\n");return 0;}

	 ioctl(f_iic,I2C_SLAVE,IIC_ADD[b]);    //设置I2C从设备地址
	if(iic_write(f_iic,&a,0x22,1)<0)
	{printf("IIC总线写失败\n");return 0;}
	if(iic_read(f_iic,&c,0x22,1)<0)
	{printf("IIC总线读失败\n");return 0;}
	return 1;
}

/*
功能:读eeprom数据,页方式
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:data:读取的数据存放的指针
参数:a:数据的起始页位置(0-511)
参数:n:数据的页的量（0-512）
返回：0:错误，1：成功
*/
int eeprom_page_read(int f_iic,int b,char *data,int a,int n)
{

    char sendbuffer1[2];
    int i;
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(a>511){printf("读数据起始页错误\n");return 0;}
	if(n>512){printf("读页量错误\n");return 0;}
	if((a+n)>512){printf("读页区间错误\n");return 0;}
	 if(eeprom_is_switch(f_iic,b,1)==1)
	 {IIC_dev[b].eeprom_is=1;}
	 else
	 {printf("\t切换到eeprom失败\n");return 0;}

	 ioctl(f_iic,I2C_SLAVE,0x50);    //设置I2C从设备地址

	for(i=0;i<n;i++)
	{
		sendbuffer1[0]=(char)((((a+i)*64)>>8)&0xff);
		sendbuffer1[1]=(char)(((a+i)*64)&0xff);
		if(write(f_iic,sendbuffer1,2)<0){printf("IIC总线写失败__3__\n");return 0;}
		if(read(f_iic,(data+i*64),64)<0){printf("IIC总线读失败__4__\n");return 0;}
	}
	 if(eeprom_is_switch(f_iic,b,2)==1)
	 {IIC_dev[b].eeprom_is=2;}
	 else
	 {printf("\t切换到寄存器失败\n");return 0;}
	return 1;
}

/*
功能:写eeprom数据,页方式
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:data:要写入的数据指针
参数:a:数据的起始页位置(0-511)
参数:n:数据的页的量（0-512）
返回：0:错误，1：成功
*/
int eeprom_page_write(int f_iic,int b,char *data,int a,int n)
{
    char sendbuffer1[70];
    int i,t;

    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(a>511){printf("写数据起始页错误\n");return 0;}
	if(n>512){printf("写数页数量错误\n");return 0;}
	if((a+n)>512){printf("写页区间错误\n");return 0;}
	 if(eeprom_is_switch(f_iic,b,1)==1)
	 {IIC_dev[b].eeprom_is=1;}
	 else
	 {printf("\t切换到eeprom失败\n");return 0;}

	 ioctl(f_iic,I2C_SLAVE,0x50);    //设置I2C从设备地址
	for(i=0;i<n;i++)
	{
		sendbuffer1[0]=(char)((((a+i)*64)>>8)&0xff);
		sendbuffer1[1]=(char)(((a+i)*64)&0xff);
	    memcpy((sendbuffer1+2),(data+i*64),64);
	    t=write(f_iic,sendbuffer1,66);
		if(t<0){printf("IIC总线写失败eeprom_page_write:%d\n",t);return 0;}
		usleep(5000);
	}
	 if(eeprom_is_switch(f_iic,b,2)==1)
	 {IIC_dev[b].eeprom_is=2;}
	 else
	 {printf("\t切换到寄存器失败\n");return 0;}

	return 1;
}



/*
功能:读eeprom数据，字节方式
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:data:指向数据存储的地址(char *)
参数:a:数据的起位置(0-32737)
返回：0:错误，1：成功
*/
int eeprom_byte_read(int f_iic,int b,char *data,int a)
{

    char sendbuffer1[2];
    int i;
	char data1[3];
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(a>32737){printf("读数据地址错误\n");return 0;}
	 if(eeprom_is_switch(f_iic,b,1)==1)
	 {IIC_dev[b].eeprom_is=1;}
	 else
	 {printf("\t切换到eeprom失败\n");return 0;}

	 ioctl(f_iic,I2C_SLAVE,0x50);    //设置I2C从设备地址


		sendbuffer1[0]=(char)((a>>8)&0xff);
		sendbuffer1[1]=(char)(a&0xff);
		if(write(f_iic,sendbuffer1,2)<0){printf("IIC总线写失败__3__\n");return 0;}
		if(read(f_iic,data1,1)<0){printf("IIC总线读失败__4__\n");return 0;}
	
	//printf("data1[0]=%d\n",data1[0]);
	*data=data1[0];
	 if(eeprom_is_switch(f_iic,b,2)==1)
	 {IIC_dev[b].eeprom_is=2;}
	 else
	 {printf("\t切换到寄存器失败\n");return 0;}
	return 1;
}

/*
功能:写eeprom数据，字节方式
参数:f_iic:设备文件号
参数:b:槽位号(0-9)
参数:data:要写入的值
参数:a:数据的起位置(0-32737)
返回：0:错误，1：成功
*/
int eeprom_byte_write(int f_iic,int b,char data,int a)
{
    char sendbuffer1[4];
int t=0;
    if(b<0||b>9){printf("槽位号错误\n");return 0;}
	if(a>32737){printf("写数据地址错误\n");return 0;}

	 if(eeprom_is_switch(f_iic,b,1)==1)
	 {IIC_dev[b].eeprom_is=1;}
	 else
	 {printf("\t切换到eeprom失败\n");return 0;}

	 ioctl(f_iic,I2C_SLAVE,0x50);    //设置I2C从设备地址

		sendbuffer1[0]=(char)((a>>8)&0xff);
		sendbuffer1[1]=(char)(a&0xff);
		sendbuffer1[2]=data;
	    t=write(f_iic,sendbuffer1,3);
		if(t<0){printf("IIC总线写失败eeprom_page_write:%d\n",t);return 0;}
		usleep(5000);
	 if(eeprom_is_switch(f_iic,b,2)==1)
	 {IIC_dev[b].eeprom_is=2;}
	 else
	 {printf("\t切换到寄存器失败\n");return 0;}

	return 1;
}


int main(void)
{
	int i,j,t,f_iic;
    int ret,res;
	char data[2]={0x55,0};
    unsigned char buf_iic[255];
    f_iic = open(DEV_I2C, O_RDWR);// DEV_I2C /dev/i2c-0
    if(f_iic < 0){printf("####i2c test device open failed####\n");return (-1);}
	ret = ioctl(f_iic,I2C_TENBIT,0);   //not 10bit

	for(i=0;i<512;i++)//填充EEPROM测试数据
	{
		for(j=0;j<64;j++)
		{
			eeprom_data[j+i*64]=j;
		}
	}
	for(i=0;i<10;i++)//检测插入的槽位，IIC_ADD[10]={0x01,0x02,0x03,0x04,0x05,0x06,0x09,0x0a,0x0d,0x0e};
	{

		 if(bus_test(f_iic,i))
		 {
			 IIC_dev[i].is=1;
			 printf("槽位%d检测到板卡\n",i);
		 }
		// else printf("槽位%d检测失败，请检测板卡是否插入\n",i);
	}

	

		for(i=0;i<10;i++)//测试以插入板卡
		{
			if(IIC_dev[i].is==0){continue;}
			else
			{
			 printf("\n槽位%d的板卡信息：\n",i);

			 IIC_dev[i].board_type= Board_type(f_iic,i);
			 printf("\t板卡类型:%d\n",IIC_dev[i].board_type);

			 IIC_dev[i].version= Project_version(f_iic,i);
			 printf("\t板卡版本号:%d\n",IIC_dev[i].version);

			 IIC_dev[i].Status= Status_ack(f_iic,i);
			 if(IIC_dev[i].Status==1){ printf("\t背板检测：振动信号接口板\n");}
			 else if(IIC_dev[i].Status==1){printf("\t背板检测：接口板对接错误\n");}
			 else if(IIC_dev[i].Status==1){printf("\t背板检测：其他错误\n");}

			 if(set_led(f_iic,i,0x55)){IIC_dev[i].led=0x55;printf("\t状态灯切换成功\n");}

			 if(Self_calibration(f_iic,i)){printf("\t执行一次偏移自校准成功\n");}

			 if(Relay_control(f_iic,i,0xaa)){IIC_dev[i].sensor_type=0x55;printf("\t传感器类型切换成功\n");}

			 if(frequency(f_iic,i,0,3)>0){IIC_dev[i].freq[0]=2;printf("\t第0路采样频率切换成功\n");}
			 if(frequency(f_iic,i,1,2)>0){IIC_dev[i].freq[1]=3;printf("\t第1路采样频率切换成功\n");}
				
			if(data_is(f_iic,i,0)>0){IIC_dev[i].test_data=0;printf("\t切换到真实数据成功\n");}
			if(data_is(f_iic,i,1)>0){IIC_dev[i].test_data=1;printf("\t切换到测试数据成功\n");}
			if(data_is(f_iic,i,0)>0){IIC_dev[i].test_data=0;printf("\t切换到真实数据成功\n");}

			#if EEPROM_IS
			if(eeprom_byte_write(f_iic,i,data[0],6)==1){printf("\tEEPROM写字节成功\n");}
			 memset(eeprom_data_ack,0,max_eeprom);
			 if(eeprom_byte_read(f_iic,i,&data[1],6)==1){printf("\tEEPROM读字节成功，校验中\n");}
				if(data[0]!=data[1])
				{
					printf("\tEEPROM读写字节校验错误w=%d r=%d\n",data[0],data[1]);
				}
				else
				{
					printf("\tEEPROM字节方式校验完成，无错误\n");
				}
				data[1]=0;
			
			 if(eeprom_page_write(f_iic,i,eeprom_data,0,512)==1){printf("\tEEPROM页写成功\n");}
			 memset(eeprom_data_ack,0,max_eeprom);
			 if(eeprom_page_read(f_iic,i,eeprom_data_ack,0,512)==1){printf("\tEEPROM页读成功，校验中\n");}

				for(t=0;t<512;t++)//校验EEPROM测试数据
				{
					for(j=0;j<64;j++)
					{
						if(eeprom_data[j+t*64]!=eeprom_data_ack[j+t*64])
						{
							printf("\n\teeprom数据校验错误槽位号:%d 数据地址:%d 校验值:%d 实际数据:%d\n",i,t*64+j,j,eeprom_data_ack[j+t*64]);
							return 0;
						}
					}
				}
				printf("\tEEPROM页方式校验完成，无错误\n");
			#endif
				
		}
	}
	

    return 0;
}
