@echo off

:: Start up clink
C:\Users\chad.cuddigan\clink\clink_x64.exe inject >NUL

:: Aliases
doskey ls=ls --color=auto $* >NUL
doskey grep=grep --color=auto $* >NUL
doskey ..=cd .. >NUL
doskey ...=cd ../.. >NUL
doskey cd~=cd C:\Users\chad.cuddigan\$* >NUL

clear
@echo on
