@echo off

git add .

set /p comment=Commit title: 
set /p desc=Commit description: 

git commit -m "%comment%" -m "%desc%"

if errorlevel 1 (
    echo Commit failed.
    exit /b 1
)

echo.
set /p pushConfirm=Push to remote? (Y/N): 

if /I not "%pushConfirm%"=="Y" (
    echo Push skipped.
    exit /b 0
)

git push

if errorlevel 1 (
    echo Push failed.
    exit /b 1
)

echo.
echo Done!