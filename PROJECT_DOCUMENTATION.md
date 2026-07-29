# 📄 AI Resume Analyzer - Project Documentation

> **Intelligent ATS Scoring, Job Alignment & Skill Gap Optimization Engine**  
> **Developed by**: Vishva Nandakumar  
> **Repository**: [https://github.com/Vishva-N-Code/Ai-Ressume-Analyzer.git](https://github.com/Vishva-N-Code/Ai-Ressume-Analyzer.git)

---

## 🌟 Executive Summary

The **AI Resume Analyzer** is an end-to-end artificial intelligence application designed to help job seekers optimize their resumes for **Applicant Tracking Systems (ATS)** and recruiter screening.

Using advanced **Natural Language Processing (NLP)** and machine learning models, the system parses resume documents (PDF, DOCX, TXT), compares them against specific Job Descriptions (JD), extracts skills, calculates an overall ATS compatibility score, identifies critical skill gaps, and suggests AI-generated resume improvements.

---

## 🚀 Key Features

### 1. 📤 Multi-Format Resume Parsing
- Supports **PDF**, **DOCX**, and **TXT** files up to 10MB.
- Extracts candidate name, contact details, skills, experience, and education automatically.

### 2. 🎯 ATS Match Score & Radial Gauge
- Generates a holistic **ATS Compatibility Score (0 - 100%)** based on:
  - **Skills Match (25%)**
  - **Experience Relevance (30%)**
  - **Education & Credentials (20%)**
  - **Formatting & Structure (10%)**
  - **Quantifiable Achievements (15%)**

### 3. 🔍 Job Description (JD) Keyword Alignment
- Compares resume text against target job descriptions.
- Highlights missing keywords, critical missing technical skills, and role alignment percentage.

### 4. 💡 AI Bullet Point Enhancer & Rewriter
- Transforms weak bullet points into high-impact, quantified achievement statements using action verbs.

### 5. 📚 Career Resources & Guidance
- Integrated collection of resume Do's & Don'ts, formatting guides, FAQ, and troubleshooting support.

### 6. 📊 Admin Analytics Dashboard
- Track total resumes analyzed, average scores, top candidate skills, and regional distribution.

---

## 🏗️ System Architecture

```
                  ┌──────────────────────────────────────────┐
                  │    Streamlit Web App (Python 3.11)       │
                  │    - Custom Cyber Obsidian Dark Theme    │
                  │    - Port 8501                           │
                  └────────────────────┬─────────────────────┘
                                       │ HTTP API Requests
                                       ▼
                  ┌──────────────────────────────────────────┐
                  │    FastAPI Backend Server (Python 3.11)  │
                  │    - Security & CORS Middleware          │
                  │    - Port 8000                           │
                  └──────────┬────────────────────┬──────────┘
                             │                    │
                             ▼                    ▼
             ┌───────────────────────┐   ┌───────────────────────┐
             │ SQLite Database       │   │ OpenAI GPT NLP Engine │
             │ (resume_analyzer.db)  │   │ & Regex Fallback      │
             └───────────────────────┘   └───────────────────────┘
```

---

## 🛠️ Technology Stack

| Layer | Technology Used |
| :--- | :--- |
| **Frontend UI** | Streamlit (Python) + CSS Luxury Dark Design System |
| **Typography** | Google Fonts (*Outfit*, *Plus Jakarta Sans*) |
| **Backend API** | FastAPI + Uvicorn |
| **NLP & AI** | OpenAI GPT API + PyPDF2 + python-docx |
| **Database** | SQLite 3 |
| **Deployment Target** | Streamlit Community Cloud / Render / Vercel |

---

## ⚡ How to Run Locally

### Method 1: Single-Click Launcher (Recommended)
Double-click `start-all-services.bat` in your project folder. It will launch:
1. Python FastAPI Backend on `http://localhost:8000`
2. Streamlit Web App on `http://localhost:8501`

### Method 2: Manual Terminal Commands
```cmd
# 1. Start Backend API
cd AI-Resume-Analyzer\backend
venv\Scripts\python.exe main.py

# 2. Start Frontend UI (in a new terminal window)
cd AI-Resume-Analyzer\frontend
venv\Scripts\python.exe -m streamlit run app.py
```

Open your browser at **`http://localhost:8501`** to view the application!

---

## 🌐 How to Deploy (Free Hosting)

1. **Streamlit UI**: Deploy to [Streamlit Community Cloud](https://share.streamlit.io) setting file path to `AI-Resume-Analyzer/frontend/app.py`.
2. **FastAPI Backend**: Deploy to [Render.com](https://render.com) setting root directory to `AI-Resume-Analyzer/backend`.

---

## 👤 Developer Information

- **Developer**: Vishva Nandakumar
- **Project**: Final Year AI Resume Analyzer System
- **License**: MIT License © 2026
