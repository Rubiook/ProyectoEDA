#ifndef DEFINICIONES_H
#define DEFINICIONES_H

enum _retorno{
	OK, ERROR, NO_IMPLEMENTADA
};
typedef enum _retorno TipoRetorno;

typedef char *Cadena;

typedef unsigned int Posicion;

#define MAX_CANT_PALABRAS_X_LINEA 3
#define MAX_CANT_ULTIMAS_PALABRAS 3

struct nodo{
	nodo *ant;
	Cadena valor;
	nodo *sig;
};
typedef struct nodo *lista;

struct cabPalabras{
	lista primero;
	lista ultimo;
	Posicion cantPalabras;
};
typedef struct cabPalabras cabPalabras;

struct nodoLinea{
	nodoLinea *ant;
	cabPalabras palabras;
	nodoLinea *sig;
};
typedef struct nodoLinea *linea;

struct cabezalTexto{
	linea primero;
	linea ultimo;
	Posicion cantLineas;
};
typedef struct cabezalTexto cabezalTexto;

struct nodoDiccionario{
	nodoDiccionario *ant;
	Cadena palabra;
	nodoDiccionario *sig;
};
typedef struct nodoDiccionario *listaDiccionario;

struct cabDiccionario{
	listaDiccionario primero;
	listaDiccionario ultimo;
	Posicion cantPalabras;
};
typedef struct cabDiccionario cabDiccionario;

#endif
