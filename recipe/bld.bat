
cd win32

:: Build using ming64 via msys2's bash
:: mingw32-make.exe
make.exe -f mingwin32.mak clean
if %errorlevel% neq 0 exit /b %errorlevel%
make.exe -f mingwin32.mak WIDE=Y UTF8=Y
if %errorlevel% neq 0 exit /b %errorlevel%
make.exe -f mingwin32.mak WIDE=Y UTF8=Y DLL=Y libs
REM if %errorlevel% neq 0 exit /b %errorlevel%

if not exist %LIBRARY_LIB% mkdir %LIBRARY_LIB%
if not exist %LIBRARY_BIN% mkdir %LIBRARY_BIN%
if not exist %LIBRARY_INC%\pdcurses mkdir %LIBRARY_INC%\pdcurses

copy ..\win32\pdcurses.dll %LIBRARY_BIN%
copy ..\win32\pdcurses.a %LIBRARY_LIB%
copy ..\curses.h %LIBRARY_INC%\pdcurses
