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
	int device_address = 0x4; 
	char reg_address = 0x20; 
	char wbuf[10];
	char rbuf[10];

	printf("This is a test of I2C\n");
	fd = open("/dev/i2c-0",O_RDWR);
	if (fd<0)
    {
		perror("can't open i2c device!");
		exit(1);
	}
	res = ioctl(fd,I2C_TENBIT,0);
	if(res < 0){
	printf("I2C_TENBIT error, errno = %d, %s\n", errno, strerror(errno));
		close(fd);  		
		return -1;
	}
	res = ioctl(fd,I2C_SLAVE,device_address);
	if(res < 0){
		printf("I2C_SLAVE error, errno = %d, %s\n", errno, strerror(errno));
		close(fd);  		
		return -1;
	}

//****I2C write
	wbuf[0] = reg_address;
	wbuf[1] = 0xff;

	if(write(fd,wbuf,2) != 2)
	{
		perror("write failed\n");
		exit(1);
	}
	
//***I2C read
	if(write(fd,&reg_address,1)!=1)
	{
		perror("write failed\n");
		exit(1);
	}

	if(read(fd,&rbuf[0],1)!= 1)
	{
		perror("read failed\n");
		exit(1);
	}
	else
	{
		printf("rbuf[0] = 0x%x\n",rbuf[0]);
	}



	close(fd);
	return 0;
}

