REM Author: xlpmg
@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Please provide the new AnimationFrameTime value.
    exit /b 1
)

set newValue=%~1
set jsonFile="content.json"

for /f "delims=" %%i in ('type %jsonFile%') do (
    set line=%%i
    if "!line:AnimationFrameTime=!" neq "!line!" (
        echo !line! | findstr /r /c:"\"AnimationFrameTime\":" >nul && (
            echo !line! | sed "s/\(\"AnimationFrameTime\"\:\s*\)[0-9]*/\1%newValue%/g"
        ) || echo !line!
    ) else (
        echo !line!
    )
) > temp.json

move /y temp.json %jsonFile%

echo AnimationFrameTime updated to %newValue%.