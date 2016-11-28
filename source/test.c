#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

#define OUT 1

int main(){
	int i,pid, k, j;
	for(i = 0 ; i < 3; i++){
		pid=fork((i % 10) + 1);
                if(!pid){
			for(j=0; j < 10000; j++)for(k=0; k < 10000000; k++);
			exit();
		}
	}
	for(i = 0 ; i < 3; i++){
		pid=wait();
		printf(OUT,"Filho %d finalisou\n",pid );
	}
	//while(1){
        //	p = wait();
        //	if(p < 0)
	//		break;
        //      	printf(OUT,"Filho %d finalisou\n",pid ); 
	//}
	//for(i = 0 ; i < 100; i++)	
//		exit();
	return 1;
}
