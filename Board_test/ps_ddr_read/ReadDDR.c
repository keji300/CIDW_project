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
#define DDR_SIZE 0xFFFFFF
#endif
static int dev_fd;
int i=0;

int  print_regisiter_value(unsigned int *reg_start)
{
    printf("reg1 is :0x%08x-----\n", *(volatile unsigned int *)(reg_start)); 
    printf("reg2 is :0x%08x-----\n", *(volatile unsigned int *)(reg_start+1));
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
    unsigned int *reg_base = (unsigned int *)mmap(NULL,8,PROT_READ | PROT_WRITE, MAP_SHARED, dev_fd, BASE_REG);
    if(reg_base < 0)
    {
        printf("reg_mmap failed.");
        return -1;
    }
    printf("--------reg map ok----->addr is %p-----\n",reg_base);


    int *ddr_start = ( int *)mmap(NULL, DDR_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, dev_fd, BASE_DDR);
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
   *(volatile unsigned int *)(reg_base) &= ~(0x00000001); 

    //enable Upload
    *(volatile unsigned int *)(reg_base) |= (0x00010000);

    printf("==========after set reg==================\n");
    print_regisiter_value(reg_base);

    //start to read ddr_data
    printf("-------start to read data------------------------------>\n");
    while((*(volatile unsigned int *)(reg_base + 1) & (0x00000001))) // 如果该寄存器为1，表示PL数据传输完成，ps端可以接收ddr数据,接收完pl端会把这个寄存器清0 
    {
        *(volatile unsigned int *)(reg_base + 1) |= (0x00000100); //该寄存器写1表示开始接收数据
        for(i=0;i<DDR_SIZE-1;i++)
        {
            //printf("ddr_data:%d==>:0x%08fx---->%p\n",i,*(ddr_start+i),ddr_start+i);
			//开始接收数据

            printf("%f\n",(float)*(ddr_start+i));
        }

        	//...
		
    
    }
    *(volatile unsigned int *)(reg_base + 1) &= ~(0x00000100); //数据接收完，清0该寄存器

    


    
#endif
    return 0;
} 