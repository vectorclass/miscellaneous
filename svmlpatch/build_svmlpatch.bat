rem Windows batch file to make svmlpatch.lib using cygwin make
rem By Agner Fog, 2019-08-02
rem Last modified 2022-07-26

rem set path to make, lib, nasm, cl(64 bit)
rem Change these paths according to your installation:
rem path %path%;C:\cygwin64\bin;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.21.27702\bin\Hostx64\x64

path %path%;C:\cygwin64\bin;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.32.31326\bin\Hostx64\x86


make -f svmlpatch.make
pause