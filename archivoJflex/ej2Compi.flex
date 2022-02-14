/* primera seccion codigo usuario*/
package com.mycompany.ejercicio02compi.main;
import java.util.ArrayList;
%%
/*Segunda seccion: configuracion*/
%class Ejercicio02Compi
%unicode
%line
%column
%int
%public
%init{ 
    yyline = 1; 
    yycolumn = 1; 
%init}
%{
	int vocales=0;
	int unaVocal=0;
	int dosVocales=0;
	int tresVocales=0;
	int cuatroVocales=0;
	int cincoVocales=0;
	int mayorVocales=0;
	int errores=0;
	ArrayList<String> numeros=new ArrayList<String>();
	
	private void contadorNumeros(){
		numeros.add("Fila: "+yyline+", Columna: "+yycolumn);	
	}
	
	private void contadorVocales(){
		vocales++;
	}
	
	private void cambiarPalabra(){
		if(vocales==1){
			unaVocal++;
			vocales=0;
		} else if(vocales==2){
			dosVocales++;
			vocales=0;
		} else if(vocales==3){
			tresVocales++;
			vocales=0;
		} else if(vocales==4){
			cuatroVocales++;
			vocales=0;
		} else if(vocales==5){
			cincoVocales++;
			vocales=0;
		} else if(vocales>5) {
			mayorVocales++;
			vocales=0;
		}
		vocales=0;
	}	
	private void errores(){
		errores++;
	}
	
	public int getUnaVocal(){
		return unaVocal;
	}
	
	public int getDosVocales(){
		return dosVocales;
	}
	public int getTresVocales(){
		return tresVocales;
	}
	public int getCuatroVocales(){
		return cuatroVocales;
	}
	public int getCincoVocales(){
		return cincoVocales;
	}
	public ArrayList<String> getNumeros(){
		return numeros;
	}
%}
%%
	
/*tercer seccion: reglas lexicas*/

[0-9]+			{contadorNumeros();}
[a|e|i|o|u|A|E|I|O|U]	{contadorVocales();}
[" "]			{cambiarPalabra();}
[^]  {}                 
