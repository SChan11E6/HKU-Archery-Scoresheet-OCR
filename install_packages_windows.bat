@echo off
setlocal

set BASE_DIR=%~dp0
set VENV_NAME=archery_ocr
set VENV_PATH=%BASE_DIR%%VENV_NAME%

REM Dynamically find Python executable
set PYTHON_EXEC=py

if exist "%VENV_PATH%" (
    echo Virtual environment already exists at %VENV_PATH%.
) else (
    echo Creating virtual environment...
    "%PYTHON_EXEC%" -m venv "%VENV_PATH%"
    
    if errorlevel 1 (
        echo Failed to create virtual environment.
        exit /b 1
    ) else (
        echo Virtual environment created successfully.
    )
)

call "%VENV_NAME%\Scripts\activate.bat"

set PYTHON_EXEC=%VENV_PATH%\Scripts\pythonw.exe
if exist "%PYTHON_EXEC%" (
    python install_packages_bat.cpython-312.pyc
) else (
    echo Python executable not found.
    exit /b 1
)

echo Installation complete.
exit /b 0