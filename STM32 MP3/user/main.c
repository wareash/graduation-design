/****************************************************************************
* Copyright (C), 2013 �ܶ�Ƕ��ʽ������ www.ourstm.net
*
* �������� �ܶ���STM32������V3,V5�ϵ���ͨ��           
* QQ: 9191274, ������sun68, Email: sun68@163.com 
* �Ա����̣�ourstm.taobao.com  
*
* �ļ���: main.c
* ���ݼ���:	
*       
*	TF���ϵĵ�Tini-FatFs0.09aʵ�֣������˽�TF����Ŀ¼�µ����������ļ�����ͨ��VS1003
    ���ų�����֧�ֳ��ļ����� ֧�������ļ�����֧�ֵ��ļ�����Ϊ��MP3��MID��WAV WMA
*	���������PC������Ҫ���д��ڵ������������
    
	����MDK�汾��        3.8
	���ڹٷ������汾�� 3.5
	����Tiny-FatFs�汾�� 0.09A
*
* �ļ���ʷ:
* �汾��  ����       ����    ˵��
* v0.1    2011-8-17 sun68  �������ļ� �ļ�ϵͳFATFS0.08b
* V0.2    2013.1.28 sun68  ����Ϊ�ļ�ϵͳFATFS0.09a
                           �����MDK4���������ļ����ȶԴ�������⡣ 
*/
/* Includes ------------------------------------------------------------------*/

#define GLOBALS 

#include "vs1003.h"	 
#include "sdio_sdcard.h"
#include "ff.h"
#include "ffconf.h"
#include "diskio.h"
#include "demo.h"


/* Private variables ---------------------------------------------------------*/
USART_InitTypeDef USART_InitStructure;

SD_CardInfo SDCardInfo;
uint32_t Buffer_Block_Tx[512], Buffer_Block_Rx[512]; 
SD_Error Status = SD_OK;


void RCC_Configuration(void);
void NVIC_Configuration(void);
void USART_OUT(USART_TypeDef* USARTx, uint8_t *Data,...);
void Usart1_Init(void);	;
void Delay_us(__IO uint32_t nTime);
void TimingDelay_Decrement(void);
//SPI��������
void SPI1_Configeration(void);
unsigned char SPI1_SendByte(unsigned char dt);
//LEDָʾ��
void LED_Config(void);


/*------------LED------------*/
GPIO_InitTypeDef GPIO_InitStructure;
#define LED1_ON GPIO_SetBits(GPIOB, GPIO_Pin_5);  
#define LED1_OFF GPIO_ResetBits(GPIOB, GPIO_Pin_5); 
/*-------------LED------------*/
		
FATFS fs;                      // �߼��������ı�־
FIL fsrc, fdst;                // �ļ���־ 
unsigned char buffer[512];     // �ļ����ݻ�����
FRESULT res;                   // FatFs ���ܺ������ؽ������
unsigned int br, bw;           // �ļ���/д������


/****************************************************************************
* ��    �ƣ�void Delay_us(__IO uint32_t nTime)
* ��    �ܣ���ʱ��ʱ���� 10usΪ��λ
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/  
void Delay_us(__IO uint32_t nTime)
{ 
  TimingDelay = nTime;

  while(TimingDelay != 0);
}
/****************************************************************************
* ��    �ƣ�void TimingDelay_Decrement(void)
* ��    �ܣ���ȡ���ĳ���
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/  
void TimingDelay_Decrement(void)
{
  if (TimingDelay != 0x00)
  { 
    TimingDelay--;
  }
}

/****************************************************************************
* ��    �ƣ�void RCC_Configuration(void)
* ��    �ܣ�ϵͳʱ������Ϊ72MHZ�� ����ʱ������
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/ 
void RCC_Configuration(void){

  SystemInit(); 
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC 
  						| RCC_APB2Periph_GPIOD| RCC_APB2Periph_GPIOE , ENABLE);
}
/****************************************************************************
* ��    �ƣ�void SD_TEST(void)
* ��    �ܣ�SD�����Ժ���
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/ 
void SD_TEST(void){
	Status = SD_Init();
    Status = SD_GetCardInfo(&SDCardInfo);
    Status = SD_SelectDeselect((uint32_t) (SDCardInfo.RCA << 16));
    Status = SD_EnableWideBusOperation(SDIO_BusWide_4b);
    Status = SD_SetDeviceMode(SD_DMA_MODE);  
 	if (Status == SD_OK)
  	{
        // �ӵ�ַ0��ʼ��ȡ512�ֽ�  
    	Status = SD_ReadBlock(Buffer_Block_Rx, 0x00,  512); 
  	}
  	if (Status == SD_OK)
    {	 
       // ���سɹ��Ļ����������SD�����Գɹ���Ϣ 
	    USART_OUT(USART1,"\r\nSD SDIO-4bitģʽ ����TF���ɹ��� \n ");
    } 
}
/*-----------�������õ����ļ�ϵͳ����ԭ��------------------------

---------------���ļ�ϵͳ��ע��/ע�� ��������0-9)-----------------------------------------------------------------
FRESULT f_mount (
  BYTE  Drive,                 	//Logical drive number 
  FATFS*  FileSystemObject  	// Pointer to the work area 
);
������
Drive�����߼���������(0-9) ȥע��/ע�� ������ 
FileSystemObject���ļ�ϵͳ�������ı�ʶ�� 
--------------------------------------------------------------------------------

---------------��Ŀ¼------------------------------------------------------------------
FRESULT f_opendir (
  DIR* DirObject,       	//��Ŀ¼�ṹָ��
  const TCHAR* DirName  	//Ŀ¼��ָ��
)
����ֵ��
FR_OK (0)  ��Ŀ¼�ɹ�
--------------------------------------------------------------------------------
---------------��ȡĿ¼�µ��ļ��� --------------------------------------------------------
FRESULT f_readdir (
  DIR* DirObject,             // Ŀ¼�ṹָ��
  FILINFO* FileInfo           // �ļ���Ϣָ�� 
);
����ֵ��
FR_OK (0)  ��ȡ�ļ����ɹ�
-------------------------------------------------------------------------------------------
----------------Ϊ�˴�ȡ���ݣ����ļ�Ŀ��----------------------------------------------------------
FRESULT f_open (
  FIL* FileObject,       	 // �ļ��ṹ��ָ�� 
  const TCHAR* FileName, 	 // �ļ���ָ��
  BYTE ModeFlags             // ģʽ��־ 
);
ModeFlags��
FA_OPEN_EXISTING�� ָ��Ϊ�ļ������ڵĻ������ش���
FA_READ��          ָ��Ϊ�ļ���
FA_CREATE_ALWAYS�� �ļ������ڵĻ���ֱ�ӽ���
FA_WRITE: 		   ָ��Ϊ�ļ�д

--------------------------------------------------------------------------
-----------------���ļ�����--------------------------------------------------------------
FRESULT f_read (
  FIL* FileObject,    // �ļ��ṹ��ָ�� 
  void* Buffer,       // �����ݻ�����ָ��
  UINT ByteToRead,    // Ҫ��ȡ���ֽ��� 
  UINT* ByteRead      // ���ص�����ȡ�Ŀɱ��ֽ�����ָ�� 
);
----------------------------------------------------------------------------------

-----------------д�ļ�����-------------------------------------------------------
FRESULT f_write (
  FIL* FileObject,     // �ļ��ṹ��ָ�� 
  const void* Buffer,  // д���ݻ�����ָ��
  UINT ByteToWrite,    // Ҫд����ֽ��� 
  UINT* ByteWritten    // ���ص���д��Ŀɱ��ֽ�����ָ�� 
);
----------------------------------------------------------------------------------
-----------------�رմ򿪵��ļ�---------------------------------------------------
FRESULT f_close (
  FIL* FileObject     // �ļ��ṹ��ָ�� 
);

-------------------------------------------------------------------------------
*/ 

/****************************************************************************
* ��    �ƣ�void Play_Music(void)
* ��    �ܣ�TXT�ļ��������
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/ 
void Play_Music(void)
{ 
  FILINFO finfo;
  DIR dirs;
  unsigned int count=0;
  char path[50]={""},j=0;  
  char *result1,*result2,*result3,*result4; 

  /*�������ļ�������ʱ�� ҪԤ�ȳ�ʼ���ļ����������ĳ��� */
  #if _USE_LFN
    static char lfn[_MAX_LFN * (_DF1S ? 2 : 1) + 1];
    finfo.lfname = lfn;
    finfo.lfsize = sizeof(lfn);
  #endif
  USART_OUT(USART1,"\n�ļ�ϵͳ(Tini-FatFS0.09a)�����ɹ�! \n");
  
  disk_initialize(0);						     //fatfs���Թ��������ʵķ����� ���԰�����洢����SST25VF016B��ʾΪ0�����൱�ڴ��̱��
  VS1003_start();
  f_mount(0, &fs);							     //���ļ�ϵͳ���õ�0�� 
  if (f_opendir(&dirs, path) == FR_OK)            //��ȡ�ô��̵ĸ�Ŀ¼        
  {
    while (f_readdir(&dirs, &finfo) == FR_OK)  	 //ѭ�����ζ�ȡ�ļ���
    {	 
      if (finfo.fattrib & AM_ARC) 			     //�ж��ļ������Ƿ�Ϊ�浵��	 TXT�ļ�һ�㶼Ϊ�浵��
      {
        if(!finfo.fname[0])	 break;    		     //������ļ���Ϊ�ձ�ʾ��Ŀ¼��ĩβ���˳�	 
		if(finfo.lfname[0]){	 		         //���ļ���	
			USART_OUT(USART1,"\r\n�ļ�����:\n   %s\n",finfo.lfname);	         //����ļ���
			result1=strstr(finfo.lfname,".mp3");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�	
			result2=strstr(finfo.lfname,".mid");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�	
			result3=strstr(finfo.lfname,".wav");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�	
			result4=strstr(finfo.lfname,".wma");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�
		}
		else{									  //8.3��ʽ�ļ���
			USART_OUT(USART1,"\r\n�ļ�����:\n   %s\n",finfo.fname);	         //����ļ���
			result1=strstr(finfo.fname,".mp3");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�	
			result2=strstr(finfo.fname,".mid");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�	
			result3=strstr(finfo.fname,".wav");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�	
			result4=strstr(finfo.fname,".wma");	     //�ȽϺ�׺�Ƿ�Ϊ��Ƶ�ļ�
		}	
		if(result1!=NULL||result2!=NULL||result3!=NULL||result4!=NULL){
        	if(finfo.lfname[0]){	 		         //���ļ���	
				res = f_open(&fsrc, finfo.lfname, FA_OPEN_EXISTING | FA_READ);   
			}
			else{									 //8.3��ʽ�ļ���
				res = f_open(&fsrc, finfo.fname, FA_OPEN_EXISTING | FA_READ);    
			}
			USART_OUT(USART1,"\r\n Playing...");
       		br=1; 
			XDCS_SET(0);                         //xDCS = 0��ѡ��vs1003�����ݽӿ�
			LED1_ON;
			for (;;) { 		
    	    	res = f_read(&fsrc, buffer, sizeof(buffer), &br);	  
            	if(res==0){					
					count=0;
					Delay_us(1000);
					while(count<512){ 						   //����SD�����ʵ�ԭ���ļ�ÿ��ֻ�ܶ���512�ֽ�														   
            			if(DREQ!=0){						   //VS1003����������ߣ� ÿ��Ϊ�ߺ󣬿���ͨ��SPI2д��32�ֽڵ���Ƶ����						
 							for(j=0;j<32;j++)				   //ÿ����32������
							{
								VS1003_WriteByte(buffer[count]); //д����Ƶ����	
/*�޸ĵĵط�*/	 //    			USART_OUT(USART1,"%d\n",buffer[count]);	
								SPI1_SendByte(buffer[count]);
								count++;
							} 						
						}
    	    			if (res || br == 0) break;   // �Ƿ��ļ�β
					}
       			}
				if (res || br == 0) break;   // �Ƿ��ļ�β		   
        	}
			LED1_OFF;
			count=0;
			while(count<2048){	             //����VS1003�����ԣ���Ҫ�����ļ���ĩβ����һЩ��0	����֤��һ����Ƶ�ļ��Ĳ���
       	     if(DREQ!=0){
 				for(j=0;j<32;j++)            //ÿ����32������
				{
					VS1003_WriteByte(0); 						
					count++;
				}
			}
		}
		XDCS_SET(1);    
		f_close(&fsrc);
      }
    } 
   } 
  } 
} 


/****************************************************************************
* ��    �ƣ�int main(void)
* ��    �ܣ�������
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
int main(void)
{
  RCC_Configuration();	             //�����ڲ�ʱ�Ӽ�����ʱ��ʹ��
  if (SysTick_Config(720))		     //ʱ�ӽ����ж�ʱ10usһ��  ���ڶ�ʱ 
  { 
    /* Capture error */ 
    while (1);
  }     
  NVIC_Configuration();			     //�ж�Դ����  
         					//xRST =1   
  
  Usart1_Init();		             //����1��ʼ��
  SPI_VS1003_Init();				 //VS1003 ��ʼ�� 
  
  SPI1_Configeration();   			//SPI1��ʼ��
  LED_Config();						//LED ��ʼ��
  
 
  Delay_us(10000);					 //��ʱ100ms
  SD_TEST();                         //SD�����Ժ���
  Play_Music();						 //������Ƶ
  while (1);
}
/****************************************************************************
* ��    �ƣ�void Usart1_Init(void)
* ��    �ܣ�����1��ʼ������
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
void Usart1_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  USART_InitTypeDef USART_InitStructure;
 
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13; 			      //LCD�������
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOD, &GPIO_InitStructure);
  GPIO_ResetBits(GPIOD, GPIO_Pin_13);			                  //LCD����ر�	


  RCC_APB2PeriphClockCmd( RCC_APB2Periph_USART1 , ENABLE);	 //ʹ�ܴ���1ʱ��

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;	         		 //USART1 TX
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;    		 //�����������
  GPIO_Init(GPIOA, &GPIO_InitStructure);		    		 //A�˿� 

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;	         	 //USART1 RX
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;   	 //���ÿ�©����
  GPIO_Init(GPIOA, &GPIO_InitStructure);		         	 //A�˿� 

  USART_InitStructure.USART_BaudRate = 115200;						//����115200bps
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;		//����λ8λ
  USART_InitStructure.USART_StopBits = USART_StopBits_1;			//ֹͣλ1λ
  USART_InitStructure.USART_Parity = USART_Parity_No;				//��У��λ
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;   //��Ӳ������
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;					//�շ�ģʽ

  /* Configure USART1 */
  USART_Init(USART1, &USART_InitStructure);							//���ô��ڲ�������   
   /* Enable the USART1 */
  USART_Cmd(USART1, ENABLE);	
  
}


/****************************************************************************
* ��    �ƣ�void NVIC_Configuration(void)
* ��    �ܣ��ж�Դ���ú���
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

  /* ���ȼ���1 */
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);	  

  NVIC_InitStructure.NVIC_IRQChannel = SDIO_IRQn;			     //SDIO�ж�
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;		 //�������ȼ�0  ��Χ��0��1
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;			 //�����ȼ�0	��Χ��0-7
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
}

/******************************************************
		��������ת�ַ�������
        char *itoa(int value, char *string, int radix)
		radix=10 ��ʾ��10����	��ʮ���ƣ�ת�����Ϊ0;  

	    ����d=-379;
		ִ��	itoa(d, buf, 10); ��
		
		buf="-379"							   			  
**********************************************************/
char *itoa(int value, char *string, int radix)
{
    int     i, d;
    int     flag = 0;
    char    *ptr = string;

    /* This implementation only works for decimal numbers. */
    if (radix != 10)
    {
        *ptr = 0;
        return string;
    }

    if (!value)
    {
        *ptr++ = 0x30;
        *ptr = 0;
        return string;
    }

    /* if this is a negative value insert the minus sign. */
    if (value < 0)
    {
        *ptr++ = '-';

        /* Make the value positive. */
        value *= -1;
    }

    for (i = 10000; i > 0; i /= 10)
    {
        d = value / i;

        if (d || flag)
        {
            *ptr++ = (char)(d + 0x30);
            value -= (d * i);
            flag = 1;
        }
    }

    /* Null terminate the string. */
    *ptr = 0;

    return string;

} /* NCL_Itoa */
/****************************************************************************
* ��    �ƣ�void USART_OUT(USART_TypeDef* USARTx, uint8_t *Data,...)
* ��    �ܣ���ʽ�������������
* ��ڲ�����USARTx:  ָ������
			Data��   ��������
			...:     ��������
* ���ڲ�������
* ˵    ������ʽ�������������
        	"\r"	�س���	   USART_OUT(USART1, "abcdefg\r")   
			"\n"	���з�	   USART_OUT(USART1, "abcdefg\r\n")
			"%s"	�ַ���	   USART_OUT(USART1, "�ַ����ǣ�%s","abcdefg")
			"%d"	ʮ����	   USART_OUT(USART1, "a=%d",10)
* ���÷������� 
****************************************************************************/
void USART_OUT(USART_TypeDef* USARTx, uint8_t *Data,...){ 

	const char *s;
    int d;
   
    char buf[16];
    va_list ap;
    va_start(ap, Data);

	while(*Data!=0){				                          //�ж��Ƿ񵽴��ַ���������
		if(*Data==0x5c){									  //'\'
			switch (*++Data){
				case 'r':							          //�س���
					USART_SendData(USARTx, 0x0d);	   

					Data++;
					break;
				case 'n':							          //���з�
					USART_SendData(USARTx, 0x0a);	
					Data++;
					break;
				
				default:
					Data++;
				    break;
			}
			
			 
		}
		else if(*Data=='%'){									  //
			switch (*++Data){				
				case 's':										  //�ַ���
                	s = va_arg(ap, const char *);
                	for ( ; *s; s++) {
                    	USART_SendData(USARTx,*s);
						while(USART_GetFlagStatus(USARTx, USART_FLAG_TC)==RESET);
                	}
					Data++;
                	break;
            	case 'd':										  //ʮ����
                	d = va_arg(ap, int);
                	itoa(d, buf, 10);
                	for (s = buf; *s; s++) {
                    	USART_SendData(USARTx,*s);
						while(USART_GetFlagStatus(USARTx, USART_FLAG_TC)==RESET);
                	}
					Data++;
                	break;
				default:
					Data++;
				    break;
			}		 
		}
		else USART_SendData(USARTx, *Data++);
		while(USART_GetFlagStatus(USARTx, USART_FLAG_TC)==RESET);
	}
}
/******************* (C) COPYRIGHT 2011 �ܶ�STM32 *****END OF FILE****/


/*SPI1 �� FPGA ͨ�Žӿں�������*/

#define                SCS_HIGH                GPIO_SetBits(GPIOA, GPIO_Pin_4)
#define                SCS_LOW                GPIO_ResetBits(GPIOA, GPIO_Pin_4)
void SPI1_Configeration(void)
{
        GPIO_InitTypeDef  GPIO_InitStructure;
        SPI_InitTypeDef  SPI_InitStructure;

        RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO|RCC_APB2Periph_GPIOA, ENABLE);

        GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;               //NSS(PA.4) �������
        GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
        GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
        GPIO_Init(GPIOA,&GPIO_InitStructure);

        GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5|GPIO_Pin_7;    //MOSI(PA.7) SCK(PA.5) �����������
        GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
        GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
        GPIO_Init(GPIOA,&GPIO_InitStructure);

        GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;               //MISO(PA.6) �������� 
//      GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
        GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
        GPIO_Init(GPIOA,&GPIO_InitStructure);

////////////////////////////////////////////////////////////////////////////////////////
        RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1,ENABLE);      //�򿪶˿ڸ���ʱ�ӡ�SPI1ʱ��

        SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;   //˫��˫��ȫ˫��
        SPI_InitStructure.SPI_Mode = SPI_Mode_Master;            //����ģʽ
        SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;        //SPI���ͽ���8λ֡�ṹ
        SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;               //ʱ�����յ�
        SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;             //���ݲ����ڵ�1��ʱ����
        SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;                //�������NSS�ͺ�
        SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8; //������8��Ƶ
        SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;       //���ݴ����MSBλ��ʼ
        SPI_InitStructure.SPI_CRCPolynomial = 7;                 //����������CRCֵ����Ķ���ʽ
        
        SPI_Init(SPI1,&SPI_InitStructure);

        SPI_Cmd(SPI1, ENABLE);                                    //ʹ��SPI1
}

/**********************************************************
��������: SPI_SendByte
��    ��: SPI1��/��һ���ֽ����ݣ�Ӳ��SPI��
**********************************************************/
unsigned char SPI1_SendByte(unsigned char dt)
{
        SCS_LOW;
        
        //�ȴ�SPI1�������
        while((SPI_I2S_GetFlagStatus(SPI1,SPI_I2S_FLAG_TXE) == RESET));
//       LED1_ON;
        SPI_I2S_SendData(SPI1,dt);
        
        //�ȴ�SPI1�������
        while((SPI_I2S_GetFlagStatus(SPI1,SPI_I2S_FLAG_RXNE) == RESET));
        SCS_HIGH;
//		LED1_OFF;
        return SPI_I2S_ReceiveData(SPI1);        
}



/*SPI����ָʾ��*/

void LED_Config(void)
{
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB  , ENABLE);	
	
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;				     //LED1  V6	   //��V6,V7,V8 ����Ϊͨ���������  
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;			 //���߷�ת�ٶ�Ϊ50MHz
  GPIO_Init(GPIOB, &GPIO_InitStructure);					 

}

