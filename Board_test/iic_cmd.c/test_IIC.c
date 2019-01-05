/*
#include <fcntl.h>
#include <stdio.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
*/
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/i2c-dev.h>
//#include <linux/i2c.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>


int main(void)
{
	int fd,res,i;
	// unsigned char addr[]= 0x10;
	unsigned char write_buf[]={0x10,2};
    unsigned char read_buf[5]={0,0,0,0,0};
    int readsize=0;
	int writesize=0; 
	unsigned short start_address = 0; 
	printf("This is a test of I2C\n");
	fd = open("/dev/i2c-0",O_RDWR);
	if (fd<0)
    {
             perror("can't open i2c device!");
             exit(1);
     }
	//printf("%x\n",start_address);
	res = ioctl(fd,I2C_TENBIT,0);
	if(res < 0){
  		printf("I2C_TENBIT error, errno = %d, %s\n", errno, strerror(errno));
		close(fd);  		
		return -1;
 	}
	res = ioctl(fd,I2C_SLAVE,start_address);
	if(res < 0){
  		printf("I2C_SLAVE error, errno = %d, %s\n", errno, strerror(errno));
		close(fd);  		
		return -1;
 	}

	writesize=write(fd,&write_buf[0],sizeof(write_buf));
	printf("writesize = %d\n",writesize);
	if (writesize<0)
	{
		printf("write data failed!\n");
		close(fd);
		return -1;	
	}
	usleep(100);											//
	// if(write(fd,0x10,2)!=2)
	// {
	// 	printf("write addr failed!\n");
	// 	close(fd);
	// 	return -1;
 	// }	  
	
   	readsize=read(fd,read_buf,sizeof(read_buf));	
	printf("readsize = %d\n",readsize);
	if(readsize<0)
	{		
		printf("read data failed!\n");		
		close(fd);	
		return -1;	
	}
	for (i=0;i<sizeof(read_buf);i++)
	{	
		printf("char= %c\n",read_buf[i]);
	}      
	close(fd);
	return 0;
}

