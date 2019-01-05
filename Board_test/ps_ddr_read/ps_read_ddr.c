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

int  print_regisiter_value(char *reg_start)
{
    printf("switch_reg value is :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start),reg_start); //0 represent test_data;1 represent samping_data
    printf("Gatekeeper_enable_reg value is :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start+1),(reg_start + 1));
    printf("enable_dataUpload_reg value is :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start+2),(reg_start + 2)); //0 disable;1 enable
    printf("Version is :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start+3),(reg_start + 3));
    printf("PL_send_DDr_stat_reg value is :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start+4),(reg_start + 4)); // 1 represent data send success
    printf("PS_recv_DDr_stat_reg value is :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start+5),(reg_start + 5)); // 1 represent data recv success
    printf("write_data_addr is  :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start+6),(reg_start + 6)); 
    printf("data_size is  :%d----->addr:%p\n", *(volatile unsigned int *)(reg_start+7),(reg_start + 7)); 
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
    unsigned char *reg_base = (unsigned char *)mmap(NULL,8,PROT_READ | PROT_WRITE, MAP_SHARED, dev_fd, BASE_REG);
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

    //configure reg
    *(volatile unsigned int *)(reg_base) = 0; //samping data mode 
    *(volatile unsigned int *)(reg_base + 0x02) = 1; // enable Upload to DDR 
    print_regisiter_value(reg_base);

//test ddr
    #if 1
        *(volatile unsigned int *)(reg_base + 0x05) = 1; //该寄存器写1表示开始接收数据
        for(i=0;i<20;i++)
        {
            printf("ddr data is 0x%x,and the address is %p\n",*(ddr_start+i),ddr_start+i);
			//开始接收数据
			//...
		}
    #endif
        sleep(1);
    #if 1
    //start to read ddr_data
    printf("-------start to read data------------------------------>\n");
    while(*(volatile unsigned int *)(reg_base + 0x04) == 1) // 如果该寄存器为1，表示PL数据传输完成，ps端可以接收ddr数据,接收完pl端会把这个寄存器清0 
    {
        *(volatile unsigned int *)(reg_base + 0x05) = 1; //该寄存器写1表示开始接收数据
        for(i=0;i<DDR_SIZE;i++)
        {
            printf("ddr data is 0x%x,and the address is %p\n",*(ddr_start+i),ddr_start+i);
			//开始接收数据
			//...
		}
    
    }

    *(volatile unsigned int *)(reg_base + 0x05) = 0; //数据接收完，清0该寄存器
    #endif
    

    return 0;
} 