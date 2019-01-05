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
#include <sys/mman.h>//mmap head file
#include <sys/time.h>
//#include <fcntl.h>
//#include <signal.h>
//#include <pthread.h>
#include <linux/input.h>

#define DATA_OUT   "/root/data_out.txt"
#define    INPUT_EVENT    "/dev/input/event0"

#define XPAR_M02_AXI_0_BASEADDR 0x43C00000//PL域自定义寄存器基地址

#define REG_0x00	0// 切换测试数据	0：采样数据  1：测试数据
#define REG_0x01	1//看门使能，寄存器映射引脚电平
#define REG_0x02	2//0：不进行数据上传  1：进行数据上传（数据上传到DDR里面，起始地址0x3e000000，每次增加0x140,共10个数据段）
#define REG_0x03	3//版本号
#define REG_0x04	4//0：无数据 1：有数据
#define REG_0x05	5//数据接收完成时要写1，

#define REG_0x06	6//写数据的起始地址	地址范围：0x3c00_0000到0x3fef_ffff
#define REG_0x07	7//写的数据量(单位：字节)	起始地址+数据量不能超过DDR的地址范围。除4为计数值

#define REG_0x08	8//PS端写好的数据起始地址	//地址范围：0x3fff0_0000到0x3fff_ffff(先于0x0a寄存器给出)	写	
#define REG_0x09	9//PS端写好的数据量	//起始地址+数据量不能超过DDR的地址范围(先于0x0a寄存器给出)	写	"单位：B     单次数据量传输最大为32KB   数据量大于32KB，需多次操作  每次写入的数据从0开始计数（32bit
#define REG_0x0a	10//PS端写数据完成	//1:PS端数据准备完成（PS端需自清零）	写	此寄存器可以在下次写入前清零，也可以在PL端数据接收完成后清零
#define REG_0x0b	11//PL端数据接收完成	//1：PL端数据接收完成（PL端自清零）	读	
#define REG_0x0c	12//PL端错误校验计数	//在PL端数据接受完成时，PS可以获取错误数据量	读	


#define PL_DDR_ADD  0x3c000000 //数据的DDR的起始地址（0x3c000000-0x3fef_ffff）
#define DDR_s 0x3f00000 //数据的字节数 63M字节

#define PL_DDR_ADD1 0x3ff00000 //数据的DDR的起始地址（0x3ff0_0000-0x3fff_ffff）
#define  DDR_s1 0x100000 //数据的字节数 1M字节

int Start=0;//板号0-9
int t=0;//板号0-7
unsigned int  j=0,s=0,a=0,i=0;
int main (int argc, const char *argv[])
{
   int fd,outdata_fd;
   int *start_reg;
   int *start_data;
   int *start_data1;
   int ret;
	int buf[1024];
	char buf1[10];
	Start=abs(atoi(argv[1]));
	t=abs(atoi(argv[2]));
	printf("板号:%d\n",Start);
	if(Start>9)
	{
		printf("\n板号0-9，参数输入错误\n");
		return -1;
	}
	printf("t:%d\n",t);
	if(t>7)
	{
		printf("\nt号0-7，参数输入错误\n");
		return -1;
	}

   outdata_fd = open(DATA_OUT, O_RDWR|O_CREAT);
   if (outdata_fd < 0) {
       perror("Error opening input file");

   }

   //打开寄存器映射文件
   fd = open ("/dev/mem", O_RDWR);
   if (fd < 0) {printf("cannot open /dev/mem.\n");return -1;}

	//映射控制寄存器
   start_reg = (int *)mmap(0, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, XPAR_M02_AXI_0_BASEADDR);
   if(start_reg < 0) {printf("mmap failed.\n"); return -1;}


	//映射数据区域1M
   start_data1 = (int *)mmap(0, DDR_s1, PROT_READ | PROT_WRITE, MAP_SHARED, fd, PL_DDR_ADD1);
	
	/*测试1M数据区域*/
	for(j=0;j<32;j++)
	{
		for(i=0;i<8000;i++)//32KB
		{
		*(start_data1+i+j*8000)=i;
			
		}
		//*(start_data1+j*8000)=5;
		
		*(start_reg+REG_0x08)=(PL_DDR_ADD1+j*8000*4);//数据起始地址
		*(start_reg+REG_0x09)=(8000*4);
		*(start_reg+REG_0x0a)=1;
		while(*(start_reg+REG_0x0b)==0);
		*(start_reg+REG_0x0a)=0;
		
		printf("向PL发送数据起始地址:0x%08x ,数据量:%d字节,数据错误量:%d\n",*(start_reg+REG_0x08),*(start_reg+REG_0x09),*(start_reg+REG_0x0c));
	}
	munmap(start_data1, DDR_s1); //destroy map memory
	
	
	//映射数据区域63M
   start_data = (int *)mmap(0, DDR_s, PROT_READ | PROT_WRITE, MAP_SHARED, fd, PL_DDR_ADD);

	
	*(start_reg+REG_0x00)=0;//切换到真实数据
	/*测试63M数据区域*/
	printf("开启数据传输,打印每个槽位的第0通道的数据\n");
	*(start_reg+REG_0x02)=0;//开启数据传输
	usleep(200);

	*(start_reg+REG_0x02)=1;//开启数据传输
	while(1)
	{
	//printf("ADD");
	 if(*(start_reg+REG_0x04)==1)//判断是否有新的数据 ?
		{  
		 	*(start_reg+REG_0x05)=1;//开始接收数据
		 	a=(*(start_reg+REG_0x06)-PL_DDR_ADD)/4;
		 	s=*(start_reg+REG_0x07);

			for(i=0;i<1000;i++)
			{
				buf[i] = (*(start_data+(i*80)+t+(Start*8)+a)&0xffffff);
				// printf("%08x\n",(*(start_data+(i*80)+t+(Start*8)+a)&0xffffff));
				

			// sprintf(buf,"%08x\n",(*(start_data+(i*80)+t+(Start*8)+a)&0xffffff));
			//sprintf(buf,"%03d\n",(char)(*(start_data+(i*80)+t+(Start*8)+a)&0xff));
			//printf(buf);
			//sprintf(buf1,"%s\n",buf);
			// ret=write(outdata_fd,buf,9);
			}
			for(int j=0;j<1000;j++)
			{
				printf("%08x\n",buf[j]);
			}
			
/*			

			printf("Data: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
								   *(start_data+0+(Start*8)+a),
								   *(start_data+1+(Start*8)+a),
								   *(start_data+2+(Start*8)+a),
								   *(start_data+3+(Start*8)+a),
								   *(start_data+4+(Start*8)+a),
								   *(start_data+5+(Start*8)+a),
								   *(start_data+6+(Start*8)+a),
								   *(start_data+7+(Start*8)+a));
*/
		 	 *(start_reg+REG_0x05)=0;//接收数据完成
			usleep(10);
		 
			  
				j++;
				if(j>=300)
				{
				printf("OK\n");
				close(outdata_fd);   //close 文件
				munmap(start_data, DDR_s); //destroy map memory
				munmap(start_reg, 0x10000); //关控制寄存器映射
				close(fd);   //close mem文件
   				return 0;
				}
	 	}
	}

   return 0;
}
