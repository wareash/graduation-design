
#define DOUT GPIOB->IDR&1<<14 		//PA6��������	
#define DIN  (1<<15)  				// PA7
#define CLK  (1<<13)  				// PA5
#define CS   (1<<12)  				// PB12 
#define RST   (1<<0)   				// PB14     			    
#define XDCS   (1<<6)  				// PC6
#define DIN_SET(x) GPIOB->ODR=(GPIOB->ODR&~DIN)|(x ? DIN:0)
#define CLK_SET(x) GPIOB->ODR=(GPIOB->ODR&~CLK)|(x ? CLK:0)													    
#define CS_SET(x)  GPIOB->ODR=(GPIOB->ODR&~CS)|(x ? CS:0)  
#define RST_SET(x) GPIOE->ODR=(GPIOE->ODR&~RST)|(x ? RST:0)  
#define XDCS_SET(x) GPIOC->ODR=(GPIOC->ODR&~XDCS)|(x ? XDCS:0)  
#define DREQ  GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_7)

#define VS_WRITE_COMMAND 	0x02
#define VS_READ_COMMAND 	0x03		 		 

#define SPI_MODE        	0x00   
#define SPI_STATUS      	0x01   
#define SPI_BASS        	0x02   
#define SPI_CLOCKF      	0x03   
#define SPI_DECODE_TIME 	0x04   
#define SPI_AUDATA      	0x05   
#define SPI_WRAM        	0x06   
#define SPI_WRAMADDR    	0x07   
#define SPI_HDAT0       	0x08   
#define SPI_HDAT1       	0x09   
#define SPI_AIADDR      	0x0a   
#define SPI_VOL         	0x0b   
#define SPI_AICTRL0     	0x0c   
#define SPI_AICTRL1     	0x0d   
#define SPI_AICTRL2     	0x0e   
#define SPI_AICTRL3     	0x0f   
#define SM_DIFF         	0x01   
#define SM_JUMP         	0x02   
#define SM_RESET        	0x04   
#define SM_OUTOFWAV     	0x08   
#define SM_PDOWN        	0x10   
#define SM_TESTS        	0x20   
#define SM_STREAM       	0x40   
#define SM_PLUSV        	0x80   
#define SM_DACT         	0x100   
#define SM_SDIORD       	0x200   
#define SM_SDISHARE     	0x400   
#define SM_SDINEW       	0x800   
#define SM_ADPCM        	0x1000   
#define SM_ADPCM_HP     	0x2000 


#define MP3CMD_InitVS1003		0x11
#define MP3CMD_Play				0x12
#define MP3CMD_Pause			0x13
#define MP3CMD_Stop				0x14
#define MP3CMD_Next				0x15
#define MP3CMD_TestVS1003		0x16
