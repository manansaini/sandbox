@echo off
if exist \\ms\dist\sec\PROJ\putty\prod (
  set MS_PUTTY_VERSION=prod
) else (
  set MS_PUTTY_VERSION=0.63-ms0
)

set PUTTY_INST=\\ms\dist\sec\PROJ\putty\%MS_PUTTY_VERSION%\bin\PUTTY.EXE

set KRB5CCNAME=MSLSA:
set KRB5_CONFIG=\\ms\dist\sec\PROJ\putty\%MS_PUTTY_VERSION%\etc\krb5.conf
set PATH=\\ms\dist\kerberos\PROJ\mitkfw\3.2-lib-prod\.exec\ia32.nt.4.0\bin;%PATH:\\ms\dist\kerberos\PROJ\mitkfw\3.2-lib-prod\.exec\ia32.nt.4.0\bin;=%

ConEmuC /export PATH
ConEmuC /export KRB5_CONFIG
ConEmuC /export KRB5CCNAME
ConEmuC /export PUTTY_INST

notepad -new_console:s1T50H:t:"Notepad"

%PUTTY_INST% -new_console:t:"AckScript" -load "Script 3 - acksn"
%PUTTY_INST% -new_console:s50V -load "Script 1 - Prod"
%PUTTY_INST% -new_console:s3T50H -load "Script 1 - Prod"

%PUTTY_INST% -new_console:t:"PROD" -load "Script 1 - Prod2"
%PUTTY_INST% -new_console:t:"PROD" -load "Script 1 - Prod2"
%PUTTY_INST% -new_console:t:"PROD" -load "Script 1 - Prod2"

%PUTTY_INST% -new_console:t:"Dev" -load "Script 2 - Dev"


::cmd -new_console:s66V /k cd /d U:Desktop\SCV\script

::%PUTTY_INST% -new_console -load "Script 1 - Prod"
::%PUTTY_INST% -new_console:s50V -load "Script 1 - Prod"

::%PUTTY_INST% -new_console -load "Script 1 - Prod"
::%PUTTY_INST% -new_console:s50V:t:"MISC-V" -load "Script 1 - Prod"
::%PUTTY_INST% -new_console -load "Script 1 - Prod"
::%PUTTY_INST% -new_console:s50H:t:"MISC-H" -load "Script 1 - Prod"


