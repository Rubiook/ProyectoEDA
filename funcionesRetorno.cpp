#include<iostream>
using namespace std;
#include "definiciones.h"
#include "prototipo.h"

cabezalTexto texto = {NULL, NULL, 0};
cabDiccionario diccionario = {NULL, NULL, 0};

void muestroRetorno(int retorno){
	switch (retorno){
	case 0:
		cout << "OK" << endl;
		break;
	case 1:
		cout << "ERROR" << endl;
		break;
	case 2:
		cout << "NO IMPLEMENTADA" << endl;
		break;
	}
}
	

TipoRetorno InsertarLinea(){

	return NO_IMPLEMENTADA;
}

TipoRetorno InsertarLineaEnPosicion(Posicion posicionLinea){

	return NO_IMPLEMENTADA;
}

TipoRetorno BorrarLinea(Posicion posicionLinea){

	return NO_IMPLEMENTADA;
}

TipoRetorno BorrarTodo(){

	return NO_IMPLEMENTADA;
}

TipoRetorno BorrarOcurrenciasPalabraEnTexto(Cadena palabraABorrar){

	return NO_IMPLEMENTADA;
}

TipoRetorno ImprimirTexto(){

	return NO_IMPLEMENTADA;
}

TipoRetorno ComprimirTexto(){

	return NO_IMPLEMENTADA;
}

TipoRetorno InsertarPalabra(Posicion posicionLinea, Posicion posicionPalabra, Cadena palabraAIngresar){

	return NO_IMPLEMENTADA;
}

TipoRetorno BorrarPalabra(Posicion posicionLinea, Posicion posicionPalabra){

	return NO_IMPLEMENTADA;
}

TipoRetorno BorrarOcurrenciasPalabraEnLinea(Posicion posicionLinea, Cadena palabraABorrar){

	return NO_IMPLEMENTADA;
}

TipoRetorno ImprimirLinea(Posicion posicionLinea){

	return NO_IMPLEMENTADA;
}

TipoRetorno IngresarPalabraDiccionario(Cadena palabraAIngresar){

	return NO_IMPLEMENTADA;
}

TipoRetorno BorrarPalabraDiccionario(Cadena palabraABorrar){

	return NO_IMPLEMENTADA;
}

TipoRetorno ImprimirDiccionario(){

	return NO_IMPLEMENTADA;
}

TipoRetorno ImprimirTextoIncorrecto(){

	return NO_IMPLEMENTADA;
}

TipoRetorno ImprimirUltimasPalabras(){

	return NO_IMPLEMENTADA;
}

