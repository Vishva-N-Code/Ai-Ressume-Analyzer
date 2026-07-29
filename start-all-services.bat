@echo off
title AI Resume Analyzer - Multi-Service Startup
color 0A

REM This batch file starts all services:
REM 1. Node Backend (port 8001)
REM 2. React Frontend (Vite on port 5173)  
REM 3. Resume Analyzer FastAPI Backend (port 8000)
REM 4. Resume Analyzer Streamlit Frontend (port 8501)

cls
echo ╔════════════════════════════════════════════════════════════╗
echo ║         AI Resume Analyzer - Service Launcher              ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Starting all services...
echo.

set VSCODE_ROOT=%CD%

REM Terminal 1: Node Backend
echo Starting Node Backend...
start "AI Resume Analyzer - Node Backend" cmd /k "cd /d %VSCODE_ROOT%\Virtual_Agent1\backend && npm run dev"

REM Terminal 2: React Frontend
echo Starting React Frontend...
start "AI Resume Analyzer - React Frontend" cmd /k "cd /d %VSCODE_ROOT%\Virtual_Agent1\frontend && npm run dev"

REM Terminal 3: Resume Analyzer Python FastAPI Backend
echo Starting Resume Analyzer FastAPI Backend...
start "AI Resume Analyzer - Python Backend" cmd /k "cd /d %VSCODE_ROOT%\AI-Resume-Analyzer\backend && venv\Scripts\python main.py"

REM Terminal 4: Resume Analyzer Streamlit Frontend
echo Starting Resume Analyzer Streamlit Engine...
start "AI Resume Analyzer - Streamlit Engine" cmd /k "cd /d %VSCODE_ROOT%\AI-Resume-Analyzer\frontend && venv\Scripts\python -m streamlit run app.py --server.headless true"

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                  All services started!                     ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║  Main App:       http://localhost:5173                     ║
echo ║  Streamlit Engine:http://localhost:8501                     ║
echo ║  FastAPI Backend: http://localhost:8000                     ║
echo ║  Node Backend:    http://localhost:8001                     ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
pause
