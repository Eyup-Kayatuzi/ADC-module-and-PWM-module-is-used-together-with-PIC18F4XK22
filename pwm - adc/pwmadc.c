int bb = 0;
float adcresult = 0;
char buff[10];

void main() {
     OSCCON = 0x62;

     ANSELA = 0X02; // ra1 pin as analog
     ANSELD = 0;
     TRISA.B1 = 1; // as input
     TRISD = 0;
     PORTD = 0;

     PWM4_Init(5000);
     PWM4_Set_Duty(110);
     PWM4_Start();


     do{

        adcresult = ADC_Read(1);
        bb = adcresult / 4;
        PWM4_Set_Duty(bb);


     }while(1);

}