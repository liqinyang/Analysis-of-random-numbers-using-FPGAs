#include <stdio.h>
#include <memory.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <dirent.h>
#include <inttypes.h>
#include <sys/time.h>
#include <stdbool.h>
#include <pthread.h>
#include "math.h"
#include  "hps_0.h"

#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"	
#include "socal/alt_gpio.h"
#include  "disp_config.h"


#define SDRAM_BASE_ADDR 0
#define ALT_VIP_SOFTWARE_RESET_N_BASE 0x00000200   //


#define ALT_AXI_FPGASLVS_OFST (0xC0000000)  // axi_master
#define HW_FPGA_AXI_SPAN (0x40000000)  // Bridge span
#define HW_FPGA_AXI_MASK ( HW_FPGA_AXI_SPAN - 1 )

#define ALT_GPIO1_BASE_OFST   (0xFF709000)

#define HW_REGS_BASE (ALT_STM_OFST )
#define HW_REGS_SPAN (0x04000000 )
#define HW_REGS_MASK (HW_REGS_SPAN - 1 )


#define DEMO_VGA_FRAME0_ADDR					                0x00000000//0x00080000 //0x00100000  //on chip memory base
#define FR0_FRAME0_OFFSET							(0x00000000)




static volatile unsigned long *h2p_memory_addr=NULL;
static volatile unsigned long *h2p_temp_addr=NULL;
static volatile unsigned long *h2p_temp_addr_copy=NULL;




int main(int argc,char ** argv) {
	void *axi_virtual_base;
	int fd;
	int i,j;
	uint64_t last=0;
	FILE * fp;

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}
	axi_virtual_base  = mmap( NULL, HW_FPGA_AXI_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd,ALT_AXI_FPGASLVS_OFST  );	
	if( axi_virtual_base == MAP_FAILED ) {
		printf( "ERROR: axi mmap() failed...\n" );
		close( fd );
		return( 1 );
	}	
	h2p_memory_addr=axi_virtual_base + ( ( unsigned long  )( DEMO_VGA_FRAME0_ADDR) & ( unsigned long)( HW_FPGA_AXI_MASK ) );
	h2p_temp_addr=axi_virtual_base + ( ( unsigned long  )( 0x02000000) & ( unsigned long)( HW_FPGA_AXI_MASK ) );
	h2p_temp_addr_copy=h2p_temp_addr;
		 
	//setup_hps_timer();
	*(uint64_t *)(h2p_temp_addr)=1;	 
	printf("write 1\n");
	*(uint64_t *)(h2p_temp_addr)=0;
	printf("Done write 1\n");
	*(uint64_t *)(h2p_temp_addr+16)=0x80000000;
	printf("enable\n");
	*(uint64_t *)(h2p_temp_addr+16)=0x40000000;
	printf("shot\n");
	*(uint64_t *)(h2p_temp_addr+16)=0x0;
	
	fp = fopen ("o2.txt","w");
	printf("Started\n");
	fprintf(fp,"Started\n");
	fclose (fp);
	
	
		
	for(j=0;j<1000;j++){
		
		uint64_t temp,total,next;
		
		total=*(uint64_t *)(h2p_temp_addr+16*32);
		while(total-last<100000000000){ //2.5min100000000000
			*(uint64_t *)(h2p_temp_addr+16)=0x40000000;
			//printf("shot\n");
			*(uint64_t *)(h2p_temp_addr+16)=0x0;
			total=*(uint64_t *)(h2p_temp_addr+16*32);
		}
		last=total;
		fp = fopen ("o2.txt","a");
		printf("total,%llu,",total);
		fprintf(fp,"j,%d,total,%llu,",j,total);
		next=*(uint64_t *)(h2p_temp_addr+16*33);
		
		

		for(i=0;i<66;i++){
			//printf("addr:%x\n",h2p_temp_addr);
			temp=*(uint64_t *)(h2p_temp_addr);
			//double s=total-temp;
			//s=fabs(temp-s);
			//s=s/sqrt(total);
			//double p=erfc(s/sqrt(2));
			printf("data%d,%llu,",i,temp);
			fprintf(fp,"data%d,%llu,",i,temp);
			h2p_temp_addr+=16;
		}
		
		printf("\n next:%llu\n",next);
		fprintf(fp,"\n next:%llu\n",next);
		fclose (fp);
		h2p_temp_addr=h2p_temp_addr_copy;
		*(uint64_t *)(h2p_temp_addr+16)=0x40000000;
		printf("shot\n");
		*(uint64_t *)(h2p_temp_addr+16)=0x0;
	}
		
	if( munmap( axi_virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	 close( fd );
	 return( 0 );
}
