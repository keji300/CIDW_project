#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <unistd.h> 
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>

#if 0//test map regisiter
#define BASE_REG  (0x2000)
#define BASE_DDR  (0x3000)
#define DDR_SIZE 0x08 
#endif
#if 1 //real regisiter
#define BASE_REG  (0x43c00000)
#define BASE_DDR  (0x3c000000)
#define DDR_SIZE (0xFFFFFF)
#define LENGTH (10031)
//#define LENGTH (100)
#define SPACE_20M (20971520) //4 seconds
#define SPACE_5M (5242880)  // 80 channel

#endif
static int dev_fd;
int i=0;

int  print_regisiter_value(unsigned int *reg_start)
{
    printf("reg0 :0x%08x-----\n", *(volatile unsigned int *)(reg_start)); 
    printf("reg1 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+1));
    printf("reg2 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+2));
    printf("reg3 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+3));
    printf("reg4 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+4));
    printf("reg5 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+5));
    printf("reg6 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+6));
    printf("reg7 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+7));
    printf("reg8 :0x%08x------\n",*(volatile unsigned int *)(reg_start+8));
    printf("reg9 :0x%08x------\n",*(volatile unsigned int *)(reg_start+9));
    printf("reg10 :0x%08x------\n",*(volatile unsigned int *)(reg_start+10));
    printf("reg11 :0x%08x------\n",*(volatile unsigned int *)(reg_start+11));
    printf("reg12 :0x%08x------\n",*(volatile unsigned int *)(reg_start+12));
    // for (i = 12; i<64 ; i ++ )
	// {
	// 	printf("reg %d 0x%08x-----", i,*(volatile unsigned int *)(reg_start+i));
	// }


	

    return 0;
}

 
int main(int argc,char *argv[])
{


    int k = 0;
    int board_num = atoi(argv[1]);
    int channel_num = atoi(argv[2]);
    int data_id = board_num * 8 + channel_num;
    int Board_shift = ((SPACE_5M/80)*data_id)/4;
    printf("******  Board_shift:%08x\t data_id : %d\t board: %d\t channel: %d  phy_addr:%08x\t ********\n",Board_shift,data_id,board_num,channel_num,BASE_DDR+Board_shift+16*4);
    int buff[LENGTH];
    memset(buff,0,LENGTH);
    dev_fd = open("/dev/mem",O_RDWR | O_SYNC);
    if(dev_fd < 0)
    {
        printf("open (/dev/mem) failed");
        return 0;
    }
    //mmap
    unsigned int *reg_base = (unsigned int *)mmap(NULL,0xff,PROT_READ | PROT_WRITE, MAP_SHARED, dev_fd, BASE_REG);
    if(reg_base < 0)
    {
        printf("reg_mmap failed.");
        return -1;
    }
    printf("--------reg map ok----->addr is %p-----\n",reg_base);


    unsigned int *ddr_start = (unsigned int *)mmap(NULL, DDR_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, dev_fd, BASE_DDR);
    if(ddr_start < 0)
    {
        printf("ddr_mmap failed.");
        return -1;
    }
    printf("--------ddr map ok-->addr is %p--------\n",ddr_start);



    print_regisiter_value(reg_base);

#if 1
    *(volatile unsigned int *)(reg_base+2) = 0x1; //enable upload
    sleep(1);
    //int Data_size = (volatile float)*(ddr_start+6);
    printf("--------after set reg------------------------------\n");
    print_regisiter_value(reg_base);
    //start to read ddr_data
    //printf("-------start to read data------------------------------>\n");
    sleep(2); 
    while(1)
    {
        
COM:
       // if( *(volatile unsigned int *)(reg_base + 4) == 0x1) // 如果该寄存器为1，表示PL数据传输完成 
        if(1) // 如果该寄存器为1，表示PL数据传输完成 
        {
            //int time_slice = 32768;
            
            //开始接收数据
             printf("-------------start to read to buff--------------\n");
            for(i=0;i<LENGTH;i=i+1)
            {
                //printf("ddr_data:%d==>:0x%08fx---->%p\n",i,*(ddr_start+i),ddr_start+i);
                //开始接收数据
                // buff[i] = (volatile unsigned int)*(ddr_start+data_id+i*80);
                buff[i] = (volatile unsigned int)*(ddr_start+Board_shift+16+i);

            }
            
            for(int j=0;j<LENGTH;j++)
            {
                // printf("%x\t --%d\n",buff[j],j);
                 printf("%x\n",buff[j]);
            }
            printf("OK\n");
            *(volatile unsigned int *)(reg_base + 5)=1;//接收数据完成
            *(volatile unsigned int *)(reg_base + 5)=0;//接收数据完成



#if 0
            // printf("%08x\n",(volatile unsigned int)*(ddr_start+i)); 
            printf("Time_value:%08x\t %08x\n",(volatile unsigned int)*(ddr_start),(volatile unsigned int)*(ddr_start+1));
            printf("Min_value:%f\n",(volatile float)*(ddr_start+2));
            printf("Max_value:%f\n",(volatile float)*(ddr_start+3));
            printf("Pk/Pp_value:%f\n",(volatile float)*(ddr_start+4));
            printf("Pk/Pp_Protect_value:%f\n",(volatile float)*(ddr_start+5));
            printf("Data_size_value:%f\n",(volatile float)*(ddr_start+6));
            // printf("reserve_value:%f\n",(volatile float)*(ddr_start+7));
            for(int j=0;j<1000;j++)
            {
                printf("Origin_value:%f\n",(volatile float)*(ddr_start+16+j));
            }
            //转速
            for(int k=0;k<32767;k++)
            {
                printf("Rotating speed:%f\n",(volatile float)*(ddr_start+10048+k));
            }
            
            *(volatile unsigned int *)(reg_base + 5) = 1; //数据接收完，set 1 该寄存器
            

                //...
            
#endif        
        }
        else
        {
            printf("reg 4 is not ok\n");
            goto COM;
        }


        
        
        
        
        munmap(reg_base, 0xff); 
        munmap(ddr_start, DDR_SIZE); 
        close(dev_fd);   //close mem文件
        return 0;
        

    }
    

    


    
#endif

} 
