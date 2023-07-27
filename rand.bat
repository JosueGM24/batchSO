@echo off
setlocal enabledelayedexpansion

set OUTPUT_FILE=numeros.txt

set /p NUM_NUMEROS="Ingrese la cantidad de numeros aleatorios a generar: "

set "valid_number=true"
for /F "delims=0123456789" %%i in ("%NUM_NUMEROS%") do set "valid_number=false"
if "%valid_number%"=="false" (
    echo Error: Debes ingresar un numero valido.
    pause
    exit /b
) else (
    echo Generando %NUM_NUMEROS% numeros aleatorios...
)

if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

for /L %%i in (1,1,%NUM_NUMEROS%) do (
    set /a "rand_num=!RANDOM! %% 100"  
    echo !rand_num! >> "%OUTPUT_FILE%"
)

echo Numeros aleatorios generados y guardados en "%OUTPUT_FILE%"

set /p sum="Ingrese el numero para encontrar combinaciones de suma: "

echo Combinaciones que suman %sum%:
call :find_combinations "!sum!" 0 ""
pause
exit /b

:find_combinations
if "%~1"=="" (
    echo %~3
    exit /b
)

for /F "usebackq" %%a in ("%OUTPUT_FILE%") do (
    set /a "current_sum=%~1+%%a"
    if !current_sum! LEQ !sum! (
        call :find_combinations "!current_sum!" %%a "%~3 + %%a"
    )
)
exit /b
