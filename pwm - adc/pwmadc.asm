
_main:

;pwmadc.c,5 :: 		void main() {
;pwmadc.c,6 :: 		OSCCON = 0x62;
	MOVLW       98
	MOVWF       OSCCON+0 
;pwmadc.c,8 :: 		ANSELA = 0X02; // ra1 pin as analog
	MOVLW       2
	MOVWF       ANSELA+0 
;pwmadc.c,9 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;pwmadc.c,10 :: 		TRISA.B1 = 1; // as input
	BSF         TRISA+0, 1 
;pwmadc.c,11 :: 		TRISD = 0;
	CLRF        TRISD+0 
;pwmadc.c,12 :: 		PORTD = 0;
	CLRF        PORTD+0 
;pwmadc.c,14 :: 		PWM4_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM4_Init+0, 0
;pwmadc.c,15 :: 		PWM4_Set_Duty(110);
	MOVLW       110
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;pwmadc.c,16 :: 		PWM4_Start();
	CALL        _PWM4_Start+0, 0
;pwmadc.c,19 :: 		do{
L_main0:
;pwmadc.c,21 :: 		adcresult = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _adcresult+0 
	MOVF        R1, 0 
	MOVWF       _adcresult+1 
	MOVF        R2, 0 
	MOVWF       _adcresult+2 
	MOVF        R3, 0 
	MOVWF       _adcresult+3 
;pwmadc.c,22 :: 		bb = adcresult / 4;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _bb+0 
	MOVF        R1, 0 
	MOVWF       _bb+1 
;pwmadc.c,23 :: 		PWM4_Set_Duty(bb);
	MOVF        R0, 0 
	MOVWF       FARG_PWM4_Set_Duty_new_duty+0 
	CALL        _PWM4_Set_Duty+0, 0
;pwmadc.c,26 :: 		}while(1);
	GOTO        L_main0
;pwmadc.c,28 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
