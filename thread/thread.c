#include <stdio.h> 
#include <pthread.h>
#include "thread.h"
#include "udp.h"
static pthread_t tidp;

int create_thread_udp(void)
{
	
	int ret;

	ret = pthread_create(&tidp, NULL, udp_rece_thread, NULL);//创建线程并传递n的地址
	if (ret)
	{
		printf("pthread_create failed:%d\n", ret);
		return -1;
	}
	 

	printf("in main:thread is created\n");
	 
	return 0;
    
}



void create_thread(void)
{
    create_thread_udp();



    pthread_join(tidp,NULL); //等待子线程结束
}


