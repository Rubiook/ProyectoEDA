#include "definiciones.h"
#include "prototipo.h"

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
