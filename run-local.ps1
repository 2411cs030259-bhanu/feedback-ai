Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  User Feedback Synthesizer — Localhost Launcher (PowerShell)" -ForegroundColor Cyan
Write-Host "  Stack: React + Vite + TypeScript + Python FastAPI + Hindsight" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

if (-not (Test-Path ".env") -and (Test-Path ".env.example")) {
    Write-Host "[1/4] Creating .env from .env.example..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
} else {
    Write-Host "[1/4] .env configuration ready." -ForegroundColor Green
}

if (-not (Test-Path ".venv")) {
    Write-Host "[2/4] Creating Python virtual environment (.venv)..." -ForegroundColor Yellow
    python -m venv .venv
} else {
    Write-Host "[2/4] Python virtual environment (.venv) ready." -ForegroundColor Green
}

Write-Host "[3/4] Installing Python FastAPI dependencies..." -ForegroundColor Yellow
if (Test-Path ".venv\Scripts\pip.exe") {
    & ".venv\Scripts\pip.exe" install -r backend/requirements.txt
} elseif (Test-Path ".venv/bin/pip") {
    & ".venv/bin/pip" install -r backend/requirements.txt
}

if (-not (Test-Path "node_modules")) {
    Write-Host "[4/4] Installing frontend npm dependencies..." -ForegroundColor Yellow
    npm install
} else {
    Write-Host "[4/4] Frontend node_modules ready." -ForegroundColor Green
}

Write-Host ""
Write-Host "Starting application on localhost..." -ForegroundColor Cyan
Write-Host "  -> Frontend UI:        http://localhost:3000" -ForegroundColor Green
Write-Host "  -> FastAPI Backend:    http://localhost:8000" -ForegroundColor Green
Write-Host "  -> FastAPI Swagger UI: http://localhost:8000/docs" -ForegroundColor Green
Write-Host ""

npm run dev
