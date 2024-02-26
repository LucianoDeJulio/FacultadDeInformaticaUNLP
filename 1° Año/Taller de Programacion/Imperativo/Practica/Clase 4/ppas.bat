@echo off
SET THEFILE=c:\users\julian\desktop\recursadataller\juliandiyu\imperatvo\clase4\c4a12opcional.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o c:\users\julian\desktop\recursadataller\juliandiyu\imperatvo\clase4\c4a12opcional.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
