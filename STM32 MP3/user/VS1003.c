/****************************************************************************
* Copyright (C), 2013 �ܶ�Ƕ��ʽ������ www.ourstm.net
*
* �������� �ܶ���STM32������V3��V5�ϵ���ͨ��           
* QQ: 9191274, ������sun68, Email: sun68@163.com 
* �Ա����̣�ourstm.taobao.com  
*
* �ļ���: VS1003.c
* ���ݼ���:
*       �����̰�����VS1003�ĵײ���������
*
* �ļ���ʷ:
* �汾��  ����       ����    ˵��
* v0.2    2011-7-28 sun68  �������ļ�
*
*/
#include "vs1003.h"   
#include "stm32f10x_spi.h"
unsigned char  BassEnhanceValue=0x55,TrebleEnhanceValue=0x00;
extern void Delay_us(__IO uint32_t nTime);

/****************************************************************************
* ��    �ƣ�void SPI_VS1003_Init(void)
* ��    �ܣ�VS1003��ʼ������
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
void SPI_VS1003_Init(void)
{
  SPI_InitTypeDef  SPI_InitStructure;
  GPIO_InitTypeDef GPIO_InitStructure;
   
  /* ʹ��SPI2 ʱ�� */
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2 ,ENABLE);	
  /* ���� SPI2 ����: SCK, MISO �� MOSI */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
  GPIO_InitStructure.GPIO_Speed =GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
  GPIO_Init(GPIOB, &GPIO_InitStructure);
  
  //V3---BRF24L01��SPI2 Ƭѡ 
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
  GPIO_InitStructure.GPIO_Speed =GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOB, &GPIO_InitStructure); 
 
  /* ����PB12ΪVS1003B��Ƭѡ  */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_Init(GPIOB, &GPIO_InitStructure);   
 
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_0;    //PE0 VS1003 RST   
  GPIO_Init(GPIOE, &GPIO_InitStructure);
  
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_6;    //PC6 VS1003 XDCS  �������ݽӿ�ѡ��  
  GPIO_Init(GPIOC, &GPIO_InitStructure);

  
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPD;
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_7;	 //PC7 VS1003 DREQ
  GPIO_Init(GPIOC, &GPIO_InitStructure);

 
  /* SPI2 configuration */ 
  SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  SPI_InitStructure.SPI_Mode = SPI_Mode_Master;				  			//SPI ��ģʽ
  SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;			  			//8λ 
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;				  			//ƽʱCLK Ϊ��
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
  SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_32;  //����VS1003����Ӧ�ٶȣ�SPI�ٶȻ�����̫��
  SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;				   //��λ��ǰ
  SPI_InitStructure.SPI_CRCPolynomial = 7;
  SPI_Init(SPI2, &SPI_InitStructure);
  
  /* Enable SPI2  */
  SPI_Cmd(SPI2, ENABLE);   									  		  //ʹ��SPI2 

  GPIO_SetBits(GPIOB, GPIO_Pin_0);									  //��ֹNRF24L01��Ƭѡ
  
}

/****************************************************************************
* ��    �ƣ�u8 VS1003_ReadByte(void)
* ��    �ܣ���VS1003����һ���ֽ�
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
u8 VS1003_ReadByte(void)
{
   while(SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);  	   //�ж�SPI2 ���ͻ������Ƿ��  
   SPI_I2S_SendData(SPI2, 0);										   //����һ�����ֽ�	   
   while(SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_RXNE) == RESET);	   //�ж��Ƿ���ջ������ǿ�
   return SPI_I2S_ReceiveData(SPI2);								   //���ؽ��յ�������
}

/****************************************************************************
* ��    �ƣ�u8 VS1003_WriteByte(u8 byte)
* ��    �ܣ���VS1003д��һ���ֽ�
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
u8 VS1003_WriteByte(u8 byte)
{			  
  while(SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);		//�ж�SPI2 ���ͻ������Ƿ��  
  SPI_I2S_SendData(SPI2, byte);											//����8λ������
  while(SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_RXNE) == RESET);	    //�ж��Ƿ���ջ������ǿ�
  return SPI_I2S_ReceiveData(SPI2);										//���ؽ��յ�������
}


/****************************************************************************
* ��    �ƣ�void VS1003_WriteReg(unsigned char add, unsigned char highbyte, unsigned char lowbyte)
* ��    �ܣ�дvs1003�Ĵ���
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
void VS1003_WriteReg(unsigned char add, unsigned char highbyte, unsigned char lowbyte)
{
	XDCS_SET(1);                    			//xDCS = 1
	CS_SET(0);                      			//xCS = 0
	VS1003_WriteByte(VS_WRITE_COMMAND); 		//����д�Ĵ�������
	VS1003_WriteByte(add);      				//���ͼĴ����ĵ�ַ
	VS1003_WriteByte(highbyte);         		//���ʹ�д���ݵĸ�8λ
	VS1003_WriteByte(lowbyte);          		//���ʹ�д���ݵĵ�8λ
	CS_SET(1);       							//xCS = 1
}


/****************************************************************************
* ��    �ƣ�unsigned int VS1003_ReadReg(unsigned char add)
* ��    �ܣ���vs1003�Ĵ���
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
unsigned int VS1003_ReadReg(unsigned char add)
{
	unsigned int resultvalue = 0;
	XDCS_SET(1);                			//xDCS =1
	CS_SET(0);                   			//xCS = 0
	VS1003_WriteByte(VS_READ_COMMAND); 		//���Ͷ��Ĵ�������
	VS1003_WriteByte((add));				//���ͼĴ����ĵ�ַ
	resultvalue = (unsigned int )(VS1003_ReadByte() << 8);//��ȡ��8λ����
	resultvalue |= VS1003_ReadByte();  		//��ȡ��8λ����
	CS_SET(1);                    			//xCS = 1        
	return resultvalue;                 	//����16λ�Ĵ�����ֵ
}

/****************************************************************************
* ��    �ƣ�void VS1003_start(void)
* ��    �ܣ�VS1003�ĳ�ʼ����
* ��ڲ�������
* ���ڲ�������
* ˵    ����
* ���÷������� 
****************************************************************************/
void VS1003_start(void)
{
	RST_SET(0);          					//xRST = 0   ��λvs1003(); 
	Delay_us(1000);       					//��ʱ10ms
	VS1003_WriteByte(0xff);   				//����һ���ֽڵ���Ч���ݣ�����SPI����
	XDCS_SET(1);         					//xDCS =1
	CS_SET(1);           					//xCS = 1
	RST_SET(1);          					//xRST =1   
	Delay_us(1000);             			//��ʱ10ms
 	VS1003_WriteReg(SPI_MODE,0x08,0x00);  	//����vs1003�Ĳ���ģʽ
	VS1003_WriteReg(3, 0x98, 0x00);   		//����vs1003��ʱ��,3��Ƶ
	VS1003_WriteReg(5, 0xBB, 0x81);   		//������48k��������
	VS1003_WriteReg(SPI_BASS, TrebleEnhanceValue, BassEnhanceValue);//��������
	VS1003_WriteReg(0x0b,0x00,0x00);      	//VS1003 ����
	while(DREQ==0);						   	//�ȴ�DREQΪ��  ��ʾ�ܹ�����������������
}
/******************* (C) COPYRIGHT 2011 �ܶ�STM32 *****END OF FILE****/

