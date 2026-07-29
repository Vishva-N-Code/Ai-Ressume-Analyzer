# Deployment Guide - AI Resume Analyzer

This guide details how to deploy the **AI Resume Analyzer** application to production or share it via public tunnels for testing and demonstration.

---

## 🏗️ System Architecture & Services

The application consists of 4 main services:

| Service | Technology | Local Port | Host Target |
| :--- | :--- | :--- | :--- |
| **1. React Frontend** | Vite + React SPA | `5173` | **Vercel** / Render Static |
| **2. Node.js Backend** | Express.js API | `8001` | **Render** / Railway |
| **3. Python NLP Backend** | FastAPI + PyPDF2/docx | `8000` | **Render** / Railway |
| **4. Streamlit AI Engine** | Streamlit | `8501` | **Streamlit Community Cloud** / Render |

---

## 🚀 Option 1: Cloud Deployment (Recommended & Free Tier Friendly)

### Step 1: Deploy Python NLP Backend (Render / Railway)
1. Sign up at [Render.com](https://render.com).
2. Create **New Web Service** and link your GitHub repo.
3. Set **Root Directory**: `AI-Resume-Analyzer/backend`.
4. Set **Runtime**: `Python 3`.
5. Set **Build Command**: `pip install -r requirements.txt`.
6. Set **Start Command**: `python main.py` or `uvicorn main:app --host 0.0.0.0 --port $PORT`.
7. Add Environment Variables:
   - `OPENAI_API_KEY`: Your OpenAI Key
8. Copy backend service URL (e.g. `https://resume-nlp-backend.onrender.com`).

---

### Step 2: Deploy Streamlit Engine (Streamlit Community Cloud)
1. Sign up at [share.streamlit.io](https://share.streamlit.io).
2. Click **New App** and select your GitHub repository.
3. Set **Main file path**: `AI-Resume-Analyzer/frontend/app.py`.
4. Under **Secrets / Environment Variables**, set:
   ```toml
   API_URL = "https://resume-nlp-backend.onrender.com"
   ```
5. Deploy and copy your Streamlit URL (e.g. `https://resume-analyzer.streamlit.app`).

---

### Step 3: Deploy Node.js Backend (Render)
1. On Render, click **New +** → **Web Service**.
2. Set **Root Directory**: `Virtual_Agent1/backend`.
3. Set **Runtime**: `Node`.
4. Set **Build Command**: `npm install`.
5. Set **Start Command**: `npm start`.
6. Add Environment Variables:
   - `OPENAI_API_KEY`: Your OpenAI Key
   - `NODE_ENV`: `production`
7. Copy backend URL (e.g. `https://virtual-agent-backend.onrender.com`).

---

### Step 4: Deploy React Frontend (Vercel)
1. Go to [Vercel.com](https://vercel.com) → **Add New Project**.
2. Import your GitHub repository.
3. Set **Root Directory**: `Virtual_Agent1/frontend`.
4. Set **Framework Preset**: `Vite`.
5. Set **Build Command**: `npm run build`.
6. Set **Output Directory**: `dist`.
7. Set Environment Variable:
   - `VITE_API_BASE_URL`: `https://virtual-agent-backend.onrender.com`
8. Deploy! Your app is live at `https://your-app.vercel.app`.

---

## ⚡ Option 2: Quick Public Demo via Cloudflare / Ngrok Tunnels

To instantly share your local application over a public URL without cloud deployment:

1. Start all 4 services locally:
   ```cmd
   start-all-services.bat
   ```
2. Run a Cloudflare Tunnel command to expose the React frontend (port 5173):
   ```cmd
   cloudflared tunnel --url http://localhost:5173
   ```
3. Share the generated public `.trycloudflare.com` link!

---

## 🔑 Environment Variables Checklist

| Variable Name | Component | Description |
| :--- | :--- | :--- |
| `OPENAI_API_KEY` | Python & Node Backends | OpenAI API Key for NLP analysis & prompts |
| `VITE_API_BASE_URL` | React Frontend | URL of deployed Node.js backend |
| `API_URL` | Streamlit Frontend | URL of deployed FastAPI Python backend |
