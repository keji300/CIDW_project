#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <unistd.h> 
#include <sys/mman.h>
#include <unistd.h>

#if 0//test map regisiter
#define BASE_REG  (0x2000)
#define BASE_DDR  (0x3000)
#define DDR_SIZE 0x08 
#endif
#if 1 //real regisiter
#define BASE_REG  (0x43c00000)
#define BASE_DDR  (0x3c000000)
#define DDR_SIZE (0xFFFFFF)
#endif
static int dev_fd;
int i=0;

int  print_regisiter_value(unsigned int *reg_start)
{
    printf("reg0 is :0x%08x-----\n", *(volatile unsigned int *)(reg_start)); 
    printf("reg1 is :0x%08x-----\n", *(volatile unsigned int *)(reg_start+1));
    printf("reg2 is :0x%08x-----\n", *(volatile unsigned int *)(reg_start+2));
    printf("reg3 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+3));
    printf("reg4 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+4));
    printf("reg5 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+5));
    printf("reg6 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+6));
    printf("reg7 :0x%08x-----\n", *(volatile unsigned int *)(reg_start+7));
    return 0;
}

 
int main(int argc,char *argv[])
{

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

    int Data_size = (volatile float)*(ddr_start+6);

    //start to read ddr_data
    printf("-------start to read data------------------------------>\n");
    while(1)
    {
        
        sleep(5);   

        while( *(volatile unsigned int *)(reg_base) == 0x1) // 如果该寄存器为1，表示PL数据传输完成 
        {
            int time_slice = 32768;
            
            //开始接收数据
            // printf("%08x\n",(volatile unsigned int)*(ddr_start+i)); 
            printf("Time_value:%08x\t %08x\n",(volatile unsigned int)*(ddr_start),(volatile unsigned int)*(ddr_start+1));
            printf("Min_value:%f\n",(volatile float)*(ddr_start+2));
            printf("Max_value:%f\n",(volatile float)*(ddr_start+3));
            printf("Pk/Pp_value:%f\n",(volatile float)*(ddr_start+4));
            printf("Pk/Pp_Protect_value:%f\n",(volatile float)*(ddr_start+5));
            printf("Data_size_value:%f\n",(volatile float)*(ddr_start+6));
            // printf("reserve_value:%f\n",(volatile float)*(ddr_start+7));
            for(int j=0;j<Data_size;j++)
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
            
        
        }
    }
    

    


    
#endif
    munmap(reg_base, 0xff);
    munmap(ddr_start, DDR_SIZE);
    return 0;
} 