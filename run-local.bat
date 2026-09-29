@echo off
setlocal

echo ==========================================================
echo   User Feedback Synthesizer - Localhost Launcher (Windows)
echo   Stack: React + Vite + TypeScript + Python FastAPI + Hindsight
echo ==========================================================

REM 1. Create .env from .env.example if missing
if not exist ".env" (
    if exist ".env.example" (
        echo [1/4] Creating .env from .env.example...
        copy /Y ".env.example" ".env" >nul
    )
) else (
    echo [1/4] .env configuration ready.
)

REM 2. Create Python virtual environment (.venv)
if not exist ".venv" (
    echo [2/4] Creating Python virtual environment (.venv)...
    python -m venv .venv
) else (
    echo [2/4] Python virtual environment (.venv) exists.
)

REM 3. Install Python dependencies
echo [3/4] Installing Python FastAPI backend dependencies...
call .venv\Scripts\pip.exe install -r backend\requirements.txt

REM 4. Install npm dependencies if missing
if not exist "node_modules" (
    echo [4/4] Installing frontend npm packages...
    call npm install
) else (
    echo [4/4] Frontend node_modules ready.
)

echo.
echo Starting application on localhost...
echo   -^> Frontend UI:        http://localhost:3000
echo   -^> FastAPI Backend:    http://localhost:8000
echo   -^> FastAPI Swagger UI: http://localhost:8000/docs
echo.

call npm run dev
pause
