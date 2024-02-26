@echo off
SET THEFILE=c:\users\viviana\desktop\facultad de informática\1ao~1\2semes~1\taller~1\practica\clase3~1\activi~1.exe
echo Linking %THEFILE%
c:\progra~1\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o "c:\users\viviana\desktop\facultad de informática\1ao~1\2semes~1\taller~1\practica\clase3~1\activi~1.exe" link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
