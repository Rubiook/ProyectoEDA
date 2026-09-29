# 👥 Trabajar todos a la vez — Edición en tiempo real

Este proyecto se guarda con **Git**: cada uno hace sus commits y los sube.
Pero si además quieren escribir código **al mismo tiempo y en la misma
pantalla**, existen herramientas para eso. Son dos cosas distintas y se
**complementan**.

| | **Git** (lo que ya tenemos) | **Edición en tiempo real** |
|---|---|---|
| Cuándo | Cada uno en su casa, a su ritmo | Reunión virtual, tecleando juntos |
| Cómo | Ramas → commits → Pull Request | Todos escriben en el mismo archivo a la vez |
| Ventaja | Queda registro de quién hizo qué | Ves el cursor del otro, hablás y programás |
| Desventaja | Hay que hacer `pull` / `push` | **No deja historial ni autoría** |

---

## ⭐ Opción recomendada: VS Code + Live Share

Es gratis, es de Microsoft y está pensada exactamente para esto.

### Instalación (una sola vez, cada uno)

1. Bajar **Visual Studio Code**: https://code.visualstudio.com/
2. Abrir VS Code → icono de extensiones (`Ctrl+Shift+X`) → buscar e instalar:
   - **Live Share** (Microsoft)
   - **C/C++** (Microsoft)
3. El compilador **MinGW / g++**: alcanza con que lo tenga **el anfitrión**
   (el que comparte la sesión). Los demás pueden usar el terminal compartido.

### Cómo se usa

1. El **anfitrión** abre la carpeta `ProcesadorDeTexto` en VS Code.
2. Aprieta el botón **Share** (abajo en la barra de Live Share).
3. Se copia el **link de invitación** y se lo pasa al grupo por WhatsApp/Discord.
4. Cada compañero abre el link: se lo invita a instalar la extensión si no la
   tiene, entra con su cuenta de **GitHub o Microsoft**, y ya está adentro.
5. Opcional: el anfitrión puede **compartir el terminal** (así todos ven
   compilar y ejecutar el programa) y hacer el terminal editable para que
   cualquiera pueda escribir los comandos.

Ventajas: cada uno ve el **cursor y la selección** de los demás, se puede
**compartir la terminal** (el que no tiene compilador igual prueba el
programa), y no hay que copiar ni subir nada para empezar.

---

## 🔄 Alternativas

| Herramienta | Cómo funciona | Cuándo conviene |
|---|---|---|
| **CodeTogether** | Igual que Live Share, pero soporta VS Code, IntelliJ y Eclipse | Si no todos usan VS Code |
| **Replit** | Todo en el **navegador**, sin instalar nada. Crean un Repl de C++, invitan al equipo por mail y editan a la vez | Si alguien no logra instalar MinGW (el problema #1 en la facu) |
| **GitHub Codespaces** | VS Code corriendo en la nube; se combina con Live Share | Tiene cuota gratuita mensual limitada (verifiquen la actual) |
| **JetBrains CLion + Code With Me** | El mejor IDE de C++ que existe, con colaboración en tiempo real | **Gratis para estudiantes** con el *JetBrains Student Pack* usando el correo de la facultad |

---

## ⚠️ Reglas para no arruinar el repositorio

1. **Lo que se escribe en tiempo real NO queda como commit.** Si nadie
   commitea, en el historial de GitHub no figura nada. Si la cátedra pide ver
   los commits por alumno, no los van a tener.
2. **Al terminar cada sesión, siempre:**

```bash
git add .
git commit -m "Trabajo en equipo: implementamos InsertarPalabra y BorrarPalabra"
git push
```

3. **Que una sola persona haga el commit** de lo que hicieron entre todos.
   Si los 3 commitean lo mismo a la vez, se pisan.
4. Si dos escriben en la **misma función** al mismo tiempo, gana el último en
   escribir y se pierde el trabajo del otro.

---

## 🎯 Cómo organizarse (lo más importante)

Live Share es ideal si están **todos en el mismo archivo** o si alguien se
trabó con un bug. Pero para el trabajo de todos los días, es mejor:

- **Repartir las funciones** del TDA y que cada uno sea dueño de las suyas.
- Cada uno hace su commit de lo que implementó (así queda la autoría).
- Juntarse por Live Share cuando haya que **resolver un problema entre todos**
  o cuando el trabajo sea sobre la misma parte del código.
