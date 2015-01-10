@echo OFF

REM The location of the registry key for the current version of R
set R_PATH_KEY=HKLM\Software\R-core\R
set R_PATH_VAL=InstallPath

REM Get the path where R is installed
set R_PATH=
for /f "tokens=2,*" %%a in ('reg query %R_PATH_KEY% /v %R_PATH_VAL% ^| findstr %R_PATH_VAL%') do (set R_PATH=%%b)

REM Run run_tests.R
Rscript "%R_PATH%"\bin\run_tests.R