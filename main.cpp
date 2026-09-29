#include<iostream>
using namespace std;
#include "definiciones.h"
#include "prototipo.h"

#define MAX_LARGO_COMANDO 256
#define MAX_LARGO_PARTE 100



int main (int argc, char *argv[]) {

	muestroRetorno(InsertarLinea());
	muestroRetorno(InsertarLineaEnPosicion(1));
	muestroRetorno(BorrarLinea(1));
	muestroRetorno(ImprimirTexto());
	muestroRetorno(InsertarPalabra(1, 1, "Palabra1"));
	muestroRetorno(ImprimirLinea(1));
	muestroRetorno(BorrarPalabra(1, 1));
	muestroRetorno(BorrarOcurrenciasPalabraEnLinea(2, "Palabra3"));
	muestroRetorno(BorrarOcurrenciasPalabraEnTexto("Palabra2"));
	muestroRetorno(ComprimirTexto());
	muestroRetorno(IngresarPalabraDiccionario("Hoja"));
	muestroRetorno(BorrarPalabraDiccionario("Hojalata"));
	muestroRetorno(ImprimirDiccionario());
	muestroRetorno(ImprimirTextoIncorrecto());
	muestroRetorno(BorrarPalabraDiccionario("Hoja"));
	muestroRetorno(ImprimirDiccionario());
	muestroRetorno(ImprimirUltimasPalabras());
	muestroRetorno(BorrarTodo());
	
	

	return 0;
}
