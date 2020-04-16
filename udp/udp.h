#ifndef _UDP_H_
#define _UDP_H_
#include "config.h"
void *udp_rece_thread(void *arg);
int send_udp(u8 *pdat, u32 len, int port);


#endif // !1