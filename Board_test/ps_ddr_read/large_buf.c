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
#define DDR_SIZE (0xFFFFFFF)
#define LENGTH (200000)
#endif
static int dev_fd;
int i=0;

int  print_regisiter_value(unsigned int *reg_start)
{
    printf("Samp_reg is :0x%08x-----\n", *(volatile unsigned int *)(reg_start)); 
    printf("Enable_watch_reg is :0x%08x-----\n", *(volatile unsigned int *)(reg_start+1));
    printf("Enable_dataUp_reg is :0x%08x-----\n", *(volatile unsigned int *)(reg_start+2));
    printf("Version is :0x%08x-----\n", *(volatile unsigned int *)(reg_start+3));
    printf("PL finish_reg(1 represent finish) :0x%08x-----\n", *(volatile unsigned int *)(reg_start+4));
    printf("PS_state :0x%08x-----\n", *(volatile unsigned int *)(reg_start+5));
    printf("Start_address :0x%08x-----\n", *(volatile unsigned int *)(reg_start+6));
    printf("Data size :0x%08x-----\n", *(volatile unsigned int *)(reg_start+7));
    return 0;
}


int main(int argc,char *argv[])
{

    //int board_num = 3;
    //int channel_num = 7;
    int k = 0;
    int board_num = atoi(argv[1]);
    int channel_num = atoi(argv[2]);
    int data_id = board_num * 8 + channel_num;
    printf("******   data_id : %d\t board: %d\t channel: %d   ********\n",data_id,board_num,channel_num);
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
    //Samping Mode
   // *(volatile unsigned int *)(reg_base) |= (0x00000001);
   *(volatile unsigned int *)(reg_base) = (0x0); 
   //*(volatile unsigned int *)(reg_base) |= (0x00000001);
    //enable Upload
    *(volatile unsigned int *)(reg_base + 2) = (0x1);
  
    printf("==========after set reg==================\n");

    print_regisiter_value(reg_base);


        //start to read ddr_data
    printf("-------start to read data------------------------------>\n");
        
        sleep(5);   

    while(1)
    {

        while( *(volatile unsigned int *)(reg_base + 4) == 0x1) // 如果该寄存器为1，表示PL数据传输完成，ps端可以接收ddr数据,接收完pl端会把这个寄存器清0 
        {
            *(volatile unsigned int *)(reg_base + 5) = (0x1); //该寄存器写1表示开始接收数据
            for(i=0;i<LENGTH;i=i+1)
            {
                //printf("ddr_data:%d==>:0x%08fx---->%p\n",i,*(ddr_start+i),ddr_start+i);
                //开始接收数据
                buff[i] = (volatile unsigned int)*(ddr_start+data_id+i*80);
                //printf("%08x\n",(volatile unsigned int)*(ddr_start+i)); 
                //  if((*(volatile unsigned int *)(reg_base + 4) == (0x0)))
                //      *(volatile unsigned int *)(reg_base + 5) = 0; //数据接收完，清0该寄存器
            }

            break;
        }

        for(int j=0;j<LENGTH;j++)
        {
            printf("%x\n",buff[j]);
        }
#if 1
        *(volatile unsigned int *)(reg_base + 5)=0;//接收数据完成
        
        
        k++;
        if(k>=300)
        {
            printf("OK\n");
            munmap(reg_base, 0xff); 
            munmap(ddr_start, DDR_SIZE); 
            close(dev_fd);   //close mem文件
            return 0;
        }
#endif

    }


    
#endif
    munmap(reg_base, 0xff);
    munmap(ddr_start, DDR_SIZE);
    return 0;
} 