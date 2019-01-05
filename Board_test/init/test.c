#include <stdio.h>   
#include <unistd.h>   
#include <sys/types.h>   
#include <sys/stat.h>   
#include <fcntl.h>   
#include <syslog.h>   
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#define DIR_OUT_FILE "/home/keji300/work/Board_test/init/2.txt"   

int match(char *src,char *dst,int len)  
{  
    int i = 0;  
    int j = 0;  
    int size_dst = 0;  

    //获得目标字符串的长度   
    size_dst = strlen(dst);  
    //如果目标字符串的长度大于len，返回失败   
    if (size_dst > len)  
    {  
        return 0;  
    }     
    //开始比较   
    for (i = 0;i < len;i++)  
    {  
        for (j = 0;j < size_dst;j++)  
        {  
            if (src[i + j] != dst[j])  
            {  
                break;  
            }  
        }  
        if (j == size_dst)  
        {  
            return 1;  
        }  
    }  

    return 0;  
} 
int main(int argc,char **argv)
{
    int fd;
    int ret;
    char buf[1024];

    while(1)
    {
        ret = system("touch /home/keji300/work/Board_test/init/2.txt");
        if(ret != 0)
        {
            perror("touch failed\n");
            exit(1);
        }
        else
        {
            printf("%d\n",ret);
        }

        system("ps -el|grep Cidw >> 2.txt ");  

        fd = open(DIR_OUT_FILE,O_CREAT|O_RDONLY,0777);
        if(fd<0)
        {
            perror("open failed\n");
            exit(1);
        }
        else
        {
            printf("open file success\n");
        }

        memset(buf,0,1024);
        read(fd,buf,1024);
        if(match(buf,"Cidw",1024))
        {
            printf("the Cidw is running\n");
        }
        else
        {
            printf("start to run CIDW\n");
            system("./Cidw_mips");
        }

        sleep(5);  
        //删除输出文件   
        system("rm "DIR_OUT_FILE);  
        
        //休眠   
        sleep(5);


    }
        return 0;
}

