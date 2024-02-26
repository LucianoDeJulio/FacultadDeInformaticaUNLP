@echo off
SET THEFILE=d:\escritorio\facultad de informática\1° año\2° semestre\taller de programacion\imperativo\taller\clase 5\supermercado parcial.exe
echo Linking %THEFILE%
d:\programas\dev-pascal\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o "d:\escritorio\facultad de informática\1° año\2° semestre\taller de programacion\imperativo\taller\clase 5\supermercado parcial.exe" link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
