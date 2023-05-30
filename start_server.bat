@echo off
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Python is not installed.
    echo Downloading Python...
    powershell -Command "Invoke-WebRequest https://www.python.org/ftp/python/3.11.3/python-3.11.3-amd64.exe -OutFile %TEMP%\python-3.11.3-amd64.exe"
    echo Python installer has been downloaded to %TEMP%\python-3.11.3-amd64.exe
    echo Launching Python installer...
    start /wait %TEMP%\python-3.11.3-amd64.exe
    echo Please ensure Python was installed correctly and added to PATH before continuing.
    pause
)
echo Python is installed.
if exist requirements.txt (
    echo Installing Python packages from requirements.txt...
    python -m pip install -r requirements.txt
) else (
    echo requirements.txt not found. Skipping package installation.
)
echo Running server.py...
python server.py
pause
