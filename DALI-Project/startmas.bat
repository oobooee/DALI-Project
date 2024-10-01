@echo off
cls
title "MAS"
set sicstus_home=F:\..MAGISTRALE\AALS\PROGETTO\SICStus\bin
::set main_home=%~dp0\..
set main_home=..\..
set dali_home=..\..\src
set conf_dir=conf
set prolog=%sicstus_home%\spwin.exe
set WAIT=ping -n 4 127.0.0.1

::del /q tmp\*.*
del /q work\*.*
copy mas\*.txt work

set daliH=%dali_home:\=/%

start /B "" "%prolog%" --noinfo -l "%dali_home%\active_server_wi.pl" --goal go(3010,'%daliH%/server.txt').
echo Server attivato. Pronto ad attivare il MAS.

start /B "" "%prolog%" --noinfo -l "%dali_home%\active_user_wi.pl" --goal utente.
%WAIT% >nul 
@echo Server DALI attivato.
FOR /F "tokens=*" %%G IN ('dir /b mas\*.txt') DO (
@echo agente: %%~nG
call conf/makeconf %%~nG %%G
call conf/startagent %%G "%prolog%" "%dali_home%"
%WAIT% >nul 
)

