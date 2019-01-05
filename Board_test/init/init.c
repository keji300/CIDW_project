#include <stdio.h>   
#include <unistd.h>   
#include <sys/types.h>   
#include <sys/stat.h>   
#include <fcntl.h>   
#include <syslog.h>   
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
//程序名字   
#define NAME "Cidw-mips"   
//查找进程中程序名字   
#define NAME_FIND "Cidw-mips"   
//输出目录   
#define DIR_OUT_FILE "/home/keji300/work/Board_test/init/2.txt"   
//要运行的程序   
#define RUN_NAME "Cidw-mips &"   



int daemon(int nochdir,int noclose)  
{  
    pid_t pid;  

    //让init进程成为新产生进程的父进程   
    pid = fork();  
    //如果创建进程失败   
    if (pid < 0)  
    {  
        perror("fork");  
        return -1;  
    }  
    //父进程退出运行   
    if (pid != 0)  
    {  
        exit(0);  
    }  
    //创建新的会话   
    pid = setsid();  
    if (pid < -1)  
    {  
        perror("set sid");  
        return -1;  
    }  
    //更改当前工作目录,将工作目录修改成根目录   
    if (!nochdir)  
    {  
        chdir("/home/keji300/work/Board_test/init");  
    }  
    //关闭文件描述符，并重定向标准输入，输出合错误输出   
    //将标准输入输出重定向到空设备   
    if (!noclose)  
    {  
        int fd;  
        fd = open("/dev/null",O_RDWR,0);  
        if (fd != -1)  
        {  
            dup2(fd,STDIN_FILENO);  
            dup2(fd,STDOUT_FILENO);  
            dup2(fd,STDERR_FILENO);  
            if (fd > 2)  
            {  
                close(fd);  
            }  
        }  
    }  
    //设置守护进程的文件权限创建掩码   
    umask(0027);  

    return 0;  
}  

//是否有匹配的字符，有则返回1，没有返回0   
//src:源字符串   
//dst：目标字符串   
//len:源字符串被比较的长度   
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

int main(int argc,char *argv[])  
{  
    int fd = 0;  
    char buf[100];  
    int ret;

    //开启守护进程   
    daemon(0,0);  

    while (1)  
    {  
        //打开日志   
        //openlog(argv[0],LOG_CONS|LOG_PID,LOG_USER);  
    
        //查看程序是否运行   
        //新建输出文件   
        ret = system("touch /home/keji300/work/Board_test/init/2.txt");
        if(!ret)
        {
            printf("touch success\n");
        }
        else
        {
            perror("touch failed\n");
            exit(1);
        }
        //获得程序ID   
        system("ps -el|grep Cidw >> 2.txt ");  
        //打开输出文件   
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

    //关闭日志   
 //   closelog();  

    return 0;  
}  