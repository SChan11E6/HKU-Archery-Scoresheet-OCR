@echo off
setlocal
set VENV_PATH=archery_ocr
set PYTHON_EXEC=%VENV_PATH%\Scripts\pythonw.exe

REM Check if the Python executable exists
if exist "%PYTHON_EXEC%" (
    start "" "%PYTHON_EXEC%" ocr.cpython-310.pyc
)
exit