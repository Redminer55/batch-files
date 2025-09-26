@echo off
set "bytes=FF FE 0D 0A 65 78 69 74 0D 0A"
set "extension=encodet"
cls
chcp 65001 >nul 
title ENCDE
goto MAIN
:MAIN
cls
call :banner
echo ╔═ encode:
echo ║     ║
echo ║     ╠══ (1) normal encode
echo ║     ║
echo ║     ╠══ (2) batch encode
echo ║     ║
echo ║     ╚══ (3) custom encode
echo ║
echo ╠═ decode: 
echo ║     ║
echo ║     ╠══ (4) normal decode
echo ║     ║
echo ║     ╠══ (5) batch decode
echo ║     ║
echo ║     ╚══ (6) custom decode
echo ║
echo ╚══ (7) exit
echo.
echo.
echo         *Information: the "batch" encoding mode only obfuscates batch files, IT DOES NOT MAKE THEM UNUSABLE!
choice /c 1234567 /n >nul
if %ERRORLEVEL%==1 (
set "bytes=FF FE 0D 0A 65 78 69 74 0D 0A"
set "extension=encodet"
call :encode
goto MAIN
)
if %ERRORLEVEL%==2 (
set "bytes=FF FE 0D 0A 63 6C 73 20 0D 0A"
set "extension=bat"
call :encode
goto MAIN
)
if %ERRORLEVEL%==3 (
cls
call :banner
echo.
set /p "bytes=Enter bytes here: "
call :encode
goto MAIN
)
if %ERRORLEVEL%==4 (
set "bytes=FF FE 0D 0A 65 78 69 74 0D 0A"
set "extension=encodet"
call :decode
goto MAIN
)
if %ERRORLEVEL%==5 (
set "bytes=FF FE 0D 0A 63 6C 73 20 0D 0A"
set "extension=bat"
call :decode
goto MAIN
)
if %ERRORLEVEL%==6 (
cls
call :banner
echo.
echo   [91mWarning: When decoding a file, make sure to use the same bytes with wich the file was encodet![0m
echo.
set /p "bytes=Enter bytes here: "
call :decode
goto MAIN
)
if %ERRORLEVEL%==7 (
exit
)

:banner
echo                                                        (C)Redminer55 2025
echo.
echo 				 ███████╗███╗   ██╗ ██████╗██████╗ ███████╗    ██╗   ██╗ ██╗
echo 				 ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔════╝    ██║   ██║███║
echo 				 █████╗  ██╔██╗ ██║██║     ██║  ██║█████╗      ██║   ██║╚██║
echo 				 ██╔══╝  ██║╚██╗██║██║     ██║  ██║██╔══╝      ╚██╗ ██╔╝ ██║
echo 				 ███████╗██║ ╚████║╚██████╗██████╔╝███████╗     ╚████╔╝  ██║
echo 				 ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═════╝ ╚══════╝      ╚═══╝   ╚═╝
echo.
echo.
goto END


:decode
cls
call :banner
echo.
echo           [91mWarning: When decoding a file, make sure to use the right decoding mode or the file could corrupt![0m
echo.
set /p "Ordnerpfad=Enter folder path or drag here: "

if not exist "%Ordnerpfad%\" (
cls
echo [91mERROR:[0m
echo -------
  echo The folder: [91m"%Ordnerpfad%"[0m does not exist, please try again.
  pause
  goto decode
)

del C:\Users\%USERNAME%\Desktop\Test.bat
cls
echo @echo off > "C:\Users\%USERNAME%\Desktop\Test.bat"
echo call fileInfo.bat >> "C:\Users\%USERNAME%\Desktop\Test.bat"

:: Erstelle eine temporäre Datei mit den Bytes "FF FE"
echo echo(%bytes%^>temp.hex >> "C:\Users\%USERNAME%\Desktop\Test.bat"

:: Konvertiere die Hex-Werte in eine Binärdatei
echo certutil.exe -decodehex temp.hex temp.bin >> "C:\Users\%USERNAME%\Desktop\Test.bat"

:: Berechne die Größe der zu entfernenden Bytes (2 Bytes)
echo set "bytes_to_remove=2" >> "C:\Users\%USERNAME%\Desktop\Test.bat"

:: Erstelle eine temporäre Datei, um die Bytes zu entfernen
echo set "input_file=%%filePath%%" >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo set "output_file=%%filePath%%" >> "C:\Users\%USERNAME%\Desktop\Test.bat"

echo powershell -Command "$bytesToRemove = %%bytes_to_remove%%; $inputFile = '%%input_file%%'; $outputFile = '%%output_file%%'; $bytes = [System.IO.File]::ReadAllBytes($inputFile); $newBytes = $bytes[2..($bytes.Length - 1)]; [System.IO.File]::WriteAllBytes($outputFile, $newBytes);" >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo powershell -Command "$bytesToRemove = %%bytes_to_remove%%; $inputFile = '%%input_file%%'; $outputFile = '%%output_file%%'; $bytes = [System.IO.File]::ReadAllBytes($inputFile); $newBytes = $bytes[2..($bytes.Length - 1)]; [System.IO.File]::WriteAllBytes($outputFile, $newBytes);" >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo powershell -Command "$bytesToRemove = %%bytes_to_remove%%; $inputFile = '%%input_file%%'; $outputFile = '%%output_file%%'; $bytes = [System.IO.File]::ReadAllBytes($inputFile); $newBytes = $bytes[2..($bytes.Length - 1)]; [System.IO.File]::WriteAllBytes($outputFile, $newBytes);" >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo powershell -Command "$bytesToRemove = %%bytes_to_remove%%; $inputFile = '%%input_file%%'; $outputFile = '%%output_file%%'; $bytes = [System.IO.File]::ReadAllBytes($inputFile); $newBytes = $bytes[2..($bytes.Length - 1)]; [System.IO.File]::WriteAllBytes($outputFile, $newBytes);" >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo powershell -Command "$bytesToRemove = %%bytes_to_remove%%; $inputFile = '%%input_file%%'; $outputFile = '%%output_file%%'; $bytes = [System.IO.File]::ReadAllBytes($inputFile); $newBytes = $bytes[2..($bytes.Length - 1)]; [System.IO.File]::WriteAllBytes($outputFile, $newBytes);" >> "C:\Users\%USERNAME%\Desktop\Test.bat"

echo SET "oldExtension=.%extension%" >> "C:\Users\%USERNAME%\Desktop\Test.bat"

echo FOR %%%%a IN ("%%filePath%%") DO ( >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo     SET "fileName=%%%%~na" >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo ) >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo SET "newFilePath=%%fileName%%" >> "C:\Users\%USERNAME%\Desktop\Test.bat"

echo RENAME "%%filePath%%" "%%newFilePath%%" >> "C:\Users\%USERNAME%\Desktop\Test.bat"



:: Lösche die temporären Dateien
echo del temp.hex >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo del temp.bin >> "C:\Users\%USERNAME%\Desktop\Test.bat"

echo echo Fertig. Die ursprüngliche Datei wurde als "%~n1%filePath%" wiederhergestellt. >> "C:\Users\%USERNAME%\Desktop\Test.bat"

setlocal enabledelayedexpansion
set i=0

for /r "%Ordnerpfad%" %%a in (*) do (
  set /a i+=1
  set "Datei!i!=%%a"
)

if %i%==0 (
  echo Der Ordner ist leer.
) else (
del C:\Users\%USERNAME%\Desktop\fileInfo.bat
  for /l %%j in (1,1,%i%) do (
echo !Datei%%j!
    echo set "filePath=!Datei%%j!" > "C:\Users\%USERNAME%\Desktop\fileInfo.bat"
call Test.bat
  )
)

endlocal
del C:\Users\%USERNAME%\Desktop\fileInfo.bat
del C:\Users\%USERNAME%\Desktop\Test.bat
goto END


:encode
cls
call :banner
set /p "Ordnerpfad=Enter folder path or drag here: "

if not exist "%Ordnerpfad%\" (
cls
echo [91mERROR:[0m
echo -------
  echo The folder: [91m"%Ordnerpfad%"[0m does not exist, please try again.
  pause
  goto encode
)


del C:\Users\%USERNAME%\Desktop\Test.bat
cls
echo @echo off > "C:\Users\%USERNAME%\Desktop\Test.bat"

echo set "filePath=Datei Pfad" >> "C:\Users\%USERNAME%\Desktop\Test.bat"

echo call fileInfo.bat >> "C:\Users\%USERNAME%\Desktop\Test.bat"


:: Erstellt eine temporäre Datei mit den Bytes "FF FE"
echo echo(%bytes%^>temp.hex >> "C:\Users\%USERNAME%\Desktop\Test.bat"

:: Konvertiert die Hex-Werte in eine Binärdatei
echo call certutil.exe -decodehex temp.hex temp.bin >> "C:\Users\%USERNAME%\Desktop\Test.bat"

:: Fügt die Binärdaten am Anfang der Zieldatei ein
echo copy /b temp.bin + "%%filePath%%" "%%filePath%%.%extension%" >> "C:\Users\%USERNAME%\Desktop\Test.bat"

:: Löscht die temporären Dateien
echo del temp.hex >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo del temp.bin >> "C:\Users\%USERNAME%\Desktop\Test.bat"
echo del "%%filePath%%" >> "C:\Users\%USERNAME%\Desktop\Test.bat"



echo echo Fertig. Die neue Datei wurde als "%%Outpath%%" erstellt. >> "C:\Users\%USERNAME%\Desktop\Test.bat"

setlocal enabledelayedexpansion
set i=0

for /r "%Ordnerpfad%" %%a in (*) do (
  set /a i+=1
  set "Datei!i!=%%a"
)

if %i%==0 (
  echo Der Ordner ist leer.
) else (
del C:\Users\%USERNAME%\Desktop\fileInfo.bat
  for /l %%j in (1,1,%i%) do (
echo !Datei%%j!
    echo set "filePath=!Datei%%j!" > "C:\Users\%USERNAME%\Desktop\fileInfo.bat"
call Test.bat
  )
)

endlocal
del C:\Users\%USERNAME%\Desktop\fileInfo.bat
del C:\Users\%USERNAME%\Desktop\Test.bat
goto END


:END