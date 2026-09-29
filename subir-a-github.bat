@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Subir ProyectoEDA a GitHub

REM ============================================================
REM  Script de subida automatico a GitHub
REM  Repositorio: https://github.com/Rubiook/ProyectoEDA.git
REM  Solo hace falta ejecutarlo UNA vez (y de nuevo si falla).
REM ============================================================

cd /d "%~dp0"

echo ============================================================
echo   SUBIR ProyectoEDA A GITHUB
echo   Repositorio: https://github.com/Rubiook/ProyectoEDA.git
echo ============================================================
echo.

REM ---------- 1. Verificar que Git este instalado ----------
where git >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git no esta instalado o no figura en el PATH.
    echo         Descargalo de: https://git-scm.com/downloads
    echo         Al instalar, deja marcada la opcion "Git from the command line".
    echo.
    pause
    exit /b 1
)
echo [OK] Git detectado:
git --version
echo.

REM ---------- 2. Inicializar el repositorio local ----------
if exist ".git\" (
    echo [OK] El repositorio git local ya existe en esta carpeta.
) else (
    echo [..] Inicializando repositorio git local...
    git init
    echo [OK] Repositorio inicializado.
)
echo.

REM ---------- 3. Identidad para los commits ----------
for /f "delims=" %%i in ('git config user.name 2^>nul') do set "GITNAME=%%i"
for /f "delims=" %%i in ('git config user.email 2^>nul') do set "GITMAIL=%%i"

if "!GITNAME!"=="" (
    set /p GITNAME=Escribi tu nombre/nick para los commits: 
    if not "!GITNAME!"=="" git config user.name "!GITNAME!"
)
if "!GITMAIL!"=="" (
    set /p GITMAIL=Escribi tu correo de GitHub: 
    if not "!GITMAIL!"=="" git config user.email "!GITMAIL!"
)
if "!GITNAME!"=="" echo [AVISO] Sin nombre configurado, GitHub no podra atribuirte el commit.
if "!GITMAIL!"=="" echo [AVISO] Sin correo configurado, GitHub no podra atribuirte el commit.
echo.

REM ---------- 4. Conectar con el repositorio remoto ----------
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo [..] Agregando remote origin...
    git remote add origin https://github.com/Rubiook/ProyectoEDA.git
) else (
    echo [..] El remote origin ya existia. Corrigiendo la URL...
    git remote set-url origin https://github.com/Rubiook/ProyectoEDA.git
)
echo [OK] Remote configurado:
git remote -v
echo.

REM ---------- 5. Preparar y confirmar los archivos ----------
git add -A
echo [OK] Archivos preparados. Esto es lo que se va a subir:
echo ------------------------------------------------------------
git status --short
echo ------------------------------------------------------------
echo.

git diff --cached --quiet
if errorlevel 1 (
    echo [..] Creando el commit...
    git commit -m "Primer commit: Proyecto EDA - Procesador de Texto"
    if errorlevel 1 (
        echo [ERROR] No se pudo crear el commit. Revisa el mensaje de arriba.
        echo.
        pause
        exit /b 1
    )
    echo [OK] Commit creado.
) else (
    echo [INFO] No hay cambios nuevos para commitear ^(ya estaba todo confirmado^).
)
echo.

REM ---------- 6. Renombrar la rama a main ----------
git branch -M main
echo [OK] Rama principal: main
echo.

REM ---------- 7. Subir a GitHub ----------
echo ============================================================
echo   SUBIENDO A GITHUB
echo   Si es la primera vez, se abre el navegador para
echo   iniciar sesion en GitHub. Inicia sesion y volve aca.
echo ============================================================
echo.

git push -u origin main
if errorlevel 1 (
    echo.
    echo [AVISO] El push fue rechazado. Suele pasar cuando el repositorio
    echo         de GitHub ya tenia un commit (por ejemplo un README).
    echo         Intentando integrar los cambios remotos y reintentar...
    echo.
    git pull --rebase origin main
    if errorlevel 1 (
        echo.
        echo [ERROR] Tampoco se pudo hacer pull --rebase.
        echo         Revisa los mensajes de arriba ^(puede ser un conflicto^)
        echo         y consulta con el grupo antes de forzar nada.
        echo.
        pause
        exit /b 1
    )
    git push -u origin main
    if errorlevel 1 (
        echo.
        echo [ERROR] El push sigue fallando. Revisa los mensajes de arriba.
        echo.
        pause
        exit /b 1
    )
)

REM ---------- 8. Resultado final ----------
echo.
echo ============================================================
echo   LISTO. El proyecto ya esta en GitHub.
echo ============================================================
echo.
echo Estado actual:
git status -sb
echo.
echo Ultimos commits:
git log --oneline -5
echo.
echo Revisalo en el navegador:
echo   https://github.com/Rubiook/ProyectoEDA
echo.
echo Para que tus companeros puedan subir cambios, agregalos en:
echo   Settings - Collaborators - Add people
echo.
pause
endlocal
