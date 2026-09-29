# 📘 Guía rápida para colaboradores — ProyectoEDA

**Repositorio:** https://github.com/Rubiook/ProyectoEDA.git
**Proyecto:** Procesador de Texto — Estructuras de Datos y Algoritmos (C++)

Archivos del proyecto (¡no renombrar, el código los incluye por nombre!):

| Archivo | Descripción |
|---|---|
| `definiciones.h` | Tipos, structs y constantes del TDA |
| `prototipo.h` | Prototipos de todas las operaciones |
| `main.cpp` | Programa principal |
| `funciones.cpp` | Funciones auxiliares |
| `funcionesRetorno.cpp` | Implementación de las operaciones |

---

## 🖱️ Primera subida: ejecutar `subir-a-github.bat`

Ya está todo preparado. **Sólo hay que hacer doble clic en `subir-a-github.bat`**
(está en esta misma carpeta). El script hace automáticamente:

1. Verifica que Git esté instalado
2. Inicializa el repositorio (`git init`)
3. Te pide tu nombre y correo para los commits
4. Conecta con `https://github.com/Rubiook/ProyectoEDA.git`
5. Prepara los archivos, muestra la lista y crea el primer commit
6. Renombra la rama a `main`
7. Sube todo a GitHub (abre el navegador la primera vez para iniciar sesión)

Si algo falla, la ventana **no se cierra**: muestra el error y queda esperando
para que puedas leerlo. Se puede volver a ejecutar sin problemas.

> Alternativa manual: si preferís hacerlo a mano, mirá la sección 1 más abajo.

---

## 0) Lo mínimo indispensable (si ya estás clonado)

```bash
git pull
# ... trabajar / editar archivos ...
git add .
git commit -m "Descripción corta de lo que hice"
git push
```

---

## 1) Preparación (una sola vez)

1. Instalar Git: https://git-scm.com/downloads
   (en Windows ya viene con **Git Bash**, que es la consola recomendada para estos comandos)
2. Crear cuenta en GitHub y pedirle a **Rubiook** que te agregue como colaborador
   (Settings → Collaborators del repo). Aceptá la invitación que llega por mail.
3. Configurar tu identidad — aparece en cada commit, así se sabe quién hizo qué:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu-correo@ejemplo.com"
```

4. Clonar el repositorio:

```bash
cd Desktop
git clone https://github.com/Rubiook/ProyectoEDA.git
cd ProyectoEDA
```

> 💡 Al hacer `push` la primera vez se abre una ventana del navegador para
> iniciar sesión en GitHub. Es normal, sólo una vez por computadora.

---

## 2) Flujo de trabajo recomendado (uno por cada tarea)

```bash
# 1. Ponerse al día con lo que subieron los demás
git pull

# 2. Crear una rama propia para tu tarea
git switch -c mi-rama

# 3. Editar los archivos... y probar que compile

# 4. Ver qué cambiaste
git status
git diff

# 5. Guardar el avance
git add .
git commit -m "Implemento InsertarLinea y BorrarLinea"

# 6. Subir tu rama a GitHub
git push -u origin mi-rama
```

Después, en GitHub, entrá al repo: va a aparecer un botón
**Compare & pull request** → creá el Pull Request hacia `main`.
Otro compañero lo revisa y lo aprueba. Así no se pisan el trabajo.

---

## 3) Reglas del repositorio

- ✅ Subir **sólo código fuente**: `.cpp`, `.h`, y archivos de texto.
- ❌ **No subir** ejecutables ni temporales (`.exe`, `.o`, `bin/`, `obj/`,
  archivos de proyecto del IDE). Ya están excluidos en el `.gitignore`.
- ❌ No renombrar ni borrar los archivos del proyecto sin avisar al grupo.
- ✅ Escribir mensajes de commit claros: qué función implementaste.
- ⚠️ **Antes de empezar a trabajar, siempre `git pull`.** Es la causa #1 de conflictos.
- ⚠️ No subir credenciales, tokens ni la carpeta `.git` modificada a mano.

---

## 4) Si hay conflictos al hacer `pull` o `push`

Git marca dentro del archivo la parte en conflicto así:

```
<<<<<<< HEAD
tu version
=======
la version del companero
>>>>>>> main
```

Se resuelve editando el archivo a mano (borrando las líneas de `<<<<<<<`,
`=======` y `>>>>>>>`, dejando el código correcto), y luego:

```bash
git add nombreDelArchivo.cpp
git commit -m "Resuelvo conflicto en nombreDelArchivo.cpp"
git push
```

Si te quedaste trabado y querés descartar lo tuyo y quedarte con lo del repo:

```bash
git checkout -- nombreDelArchivo.cpp
```

---

## 5) Comandos útiles / de emergencia

```bash
git status                # ¿en qué estado estoy?
git log --oneline         # historial de commits
git branch                # en qué rama estoy
git remote -v             # a qué repositorio estoy conectado
git pull                  # traer cambios de GitHub
git stash                 # guardar temporalmente lo que tengo sin commitear
git stash pop             # recuperarlo
git restore .             # descartar TODOS mis cambios no commiteados (¡cuidado!)
```

> En **Windows PowerShell** el comando `&&` no funciona: usá cada comando
> en una línea separada, o trabajá en **Git Bash**.

---

## 6) ¿Error "rejected / non-fast-forward" al hacer push?

Significa que en GitHub hay commits que no tenés localmente. Solución:

```bash
git pull --rebase origin main
git push
```
