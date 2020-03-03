REM Author: AnNT
REM script remove lines from beginning to LINE_NUMBER
REM It do not scan subfolder
@echo off

set LINE_NUMBER=3

REM Get current folder name
set FOLDER_NAME="temp"
for /f "delims=\" %%a in ("%cd%") do set FOLDER_NAME=%%~nxa

REM Make a folder inside
set FOLDER_NAME="%FOLDER_NAME%_RemovedToLine%LINE_NUMBER%"
mkdir %FOLDER_NAME%

REM Scanning and removing lines
FOR %%i IN (*.*) DO (
    REM echo %%i
    more +%LINE_NUMBER% "%%i" > "%FOLDER_NAME%\%%i"
)
REM exit
