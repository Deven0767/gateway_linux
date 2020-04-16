#include <stdio.h>
#include "app.h"
#include <unistd.h>



void *app_thread(void *arg)  
{
     
     while(1)
     {
        sleep(1);
        printf("hello world \r\n");
     }
}