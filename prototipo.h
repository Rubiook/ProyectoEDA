#ifndef PROTOTIPO_H
#define PROTOTIPO_H
#include "definiciones.h"

TipoRetorno InsertarLinea();
TipoRetorno InsertarLineaEnPosicion(Posicion posicionLinea);
TipoRetorno BorrarLinea(Posicion posicionLinea);
TipoRetorno BorrarTodo();
TipoRetorno BorrarOcurrenciasPalabraEnTexto(Cadena palabraABorrar);
TipoRetorno ImprimirTexto();
TipoRetorno ComprimirTexto();

TipoRetorno InsertarPalabra(Posicion posicionLinea, Posicion posicionPalabra, Cadena palabraAIngresar);
TipoRetorno BorrarPalabra(Posicion posicionLinea, Posicion posicionPalabra);
TipoRetorno BorrarOcurrenciasPalabraEnLinea(Posicion posicionLinea, Cadena palabraABorrar);
TipoRetorno ImprimirLinea(Posicion posicionLinea);

TipoRetorno IngresarPalabraDiccionario(Cadena palabraAIngresar);
TipoRetorno BorrarPalabraDiccionario(Cadena palabraABorrar);
TipoRetorno ImprimirDiccionario();
TipoRetorno ImprimirTextoIncorrecto();

TipoRetorno ImprimirUltimasPalabras();


cabezalTexto creo_TextoVacio();
cabDiccionario creo_DiccionarioVacio();
linea creo_LineaVacia();
lista creo_NodoPalabra(Cadena valor);
listaDiccionario creo_NodoDiccionario(Cadena palabra);

Posicion longitudCadena(Cadena original);
Cadena copiarCadena(Cadena original);
bool sonIguales(Cadena primera, Cadena segunda);
bool esMenor(Cadena primera, Cadena segunda);
void liberarCadena(Cadena &cadena);

linea obtenerLinea(cabezalTexto &t, Posicion posicionLinea);
void liberarPalabrasDeLinea(cabPalabras &palabras);
void mostrarLinea(Posicion numeroLinea, cabPalabras &palabras);

void insertoNodoAlFrente(cabPalabras &palabras, lista nuevo);
void insertoNodoAlFinal(cabPalabras &palabras, lista nuevo);
void insertoNodoEnPosicion(cabPalabras &palabras, Posicion posicion, lista nuevo);
lista quitoNodo(cabPalabras &palabras, Posicion posicion);

listaDiccionario buscoPalabraDiccionario(cabDiccionario &d, Cadena palabra);

void muestroRetorno(int retorno);

#endif
