@echo off
title AI Resume Analyzer - Service Startup
color 0A

REM This batch file starts the AI Resume Analyzer services:
REM 1. Resume Analyzer FastAPI Backend (port 8000)
REM 2. Resume Analyzer Streamlit Frontend (port 8501)

cls
echo ╔════════════════════════════════════════════════════════════╗
echo ║         AI Resume Analyzer - Service Launcher              ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Starting services...
echo.

set VSCODE_ROOT=%CD%

REM Terminal 1: Python FastAPI Backend
echo Starting Python NLP Backend (FastAPI)...
start "AI Resume Analyzer - Backend API" cmd /k "cd /d %VSCODE_ROOT%\AI-Resume-Analyzer\backend && venv\Scripts\python main.py"

REM Give backend time to start
timeout /t 3 /nobreak

REM Terminal 2: Streamlit Frontend Engine
echo Starting Streamlit UI Engine...
start "AI Resume Analyzer - Streamlit UI" cmd /k "cd /d %VSCODE_ROOT%\AI-Resume-Analyzer\frontend && venv\Scripts\python -m streamlit run app.py --server.headless true"

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                  All services started!                     ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║  Streamlit UI:    http://localhost:8501                    ║
echo ║  FastAPI Backend: http://localhost:8000                    ║
echo ║  API Health:      http://localhost:8000/health             ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
pause
