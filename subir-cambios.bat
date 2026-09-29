@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Subir mis cambios a GitHub
cd /d "%~dp0"

echo ============================================================
echo   SUBIR MIS CAMBIOS A GITHUB
echo   Repositorio: https://github.com/Rubiook/ProyectoEDA.git
echo ============================================================
echo.

REM ---------- 1. Controles basicos ----------
where git >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git no esta instalado en esta PC.
    echo         Bajalo de: https://git-scm.com/downloads
    echo.
    pause
    exit /b 1
)

if not exist ".git\" (
    echo [ERROR] Esta carpeta NO es un repositorio git.
    echo         No hay que copiar la carpeta a mano: hay que CLONARLA.
    echo.
    echo         Abri Git Bash o PowerShell y escribi:
    echo             git clone https://github.com/Rubiook/ProyectoEDA.git
    echo.
    pause
    exit /b 1
)

REM ---------- 2. Identidad para los commits ----------
for /f "delims=" %%i in ('git config user.name 2^>nul') do set "GITNAME=%%i"
for /f "delims=" %%i in ('git config user.email 2^>nul') do set "GITMAIL=%%i"

if "!GITNAME!"=="" (
    set /p GITNAME=Escribi tu nombre para los commits: 
    if not "!GITNAME!"=="" git config user.name "!GITNAME!"
)
if "!GITMAIL!"=="" (
    set /p GITMAIL=Escribi tu correo de GitHub: 
    if not "!GITMAIL!"=="" git config user.email "!GITMAIL!"
)
echo.

REM ---------- 3. Primero traer lo de los demas ----------
echo [..] Trayendo los cambios de tus companeros...
git pull --rebase
if errorlevel 1 (
    echo.
    echo [ERROR] Hay un CONFLICTO al traer los cambios.
    echo         No sigas. Abri el archivo marcado y resolve los pedazos
    echo         entre ^<^<^<^<^<^< y ^>^>^>^>^>^>, despues avisa al grupo.
    echo.
    pause
    exit /b 1
)
echo [OK] Estas al dia.
echo.

REM ---------- 4. Ver que hay para subir ----------
git add -A
echo Esto es lo que vas a subir:
echo ------------------------------------------------------------
git status --short
echo ------------------------------------------------------------
echo.

git diff --cached --quiet
if errorlevel 1 (
    echo.
    set /p MENSAJE=Escribi que hiciste ^(ej: Implemente InsertarPalabra^): 
    if "!MENSAJE!"=="" set "MENSAJE=Avance del proyecto"
    git commit -m "!MENSAJE!"
    if errorlevel 1 (
        echo [ERROR] No se pudo crear el commit. Revisa el mensaje de arriba.
        echo.
        pause
        exit /b 1
    )
    echo [OK] Commit creado.
) else (
    echo [INFO] No tenes cambios para subir. Nada que hacer.
    echo.
    pause
    exit /b 0
)

REM ---------- 5. Subir ----------
echo.
echo [..] Subiendo a GitHub...
git push
if errorlevel 1 (
    echo.
    echo [AVISO] El push fallo. Probando integrar los cambios remotos...
    git pull --rebase
    git push
    if errorlevel 1 (
        echo.
        echo [ERROR] No se pudo subir. Pasale el mensaje de error al grupo.
        echo.
        pause
        exit /b 1
    )
)

echo.
echo ============================================================
echo   [OK] LISTO. Tus cambios ya estan en GitHub.
echo ============================================================
echo.
echo Ultimos commits:
git log --oneline -5
echo.
echo Miralo en el navegador:
echo   https://github.com/Rubiook/ProyectoEDA
echo.
pause
endlocal
