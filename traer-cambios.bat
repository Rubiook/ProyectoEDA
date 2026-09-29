@echo off
chcp 65001 >nul
title Traer cambios de GitHub
cd /d "%~dp0"

echo ============================================================
echo   TRAER CAMBIOS DE GITHUB
echo   Repositorio: https://github.com/Rubiook/ProyectoEDA.git
echo ============================================================
echo.

where git >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git no esta instalado en esta PC.
    echo         Bajalo de: https://git-scm.com/downloads
    echo         Al instalar, deja marcada la opcion "Git from the command line".
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

echo [..] Bajando los cambios que subieron tus companeros...
echo.

git pull
if errorlevel 1 (
    echo.
    echo [ERROR] No se pudieron traer los cambios.
    echo         Si el mensaje habla de "conflict", NO sigas: abri el archivo
    echo         marcado, elegi con que version quedarte y avisa al grupo.
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo   [OK] LISTO. Ya tenes la ultima version del proyecto.
echo ============================================================
echo.
echo Ultimos commits:
git log --oneline -5
echo.
pause
endlocal
