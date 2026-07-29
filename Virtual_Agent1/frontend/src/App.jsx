import React, { useEffect, useState } from 'react';
import { Switch, Route, useLocation } from "wouter";
import Navbar from "./components/Navbar";
import Login from "./pages/Login";
import UserProfile from "./pages/UserProfile";
import ResumeParse from "./pages/ResumeParse";
import ProgressDashboard from "./pages/ProgressDashboard";
import PersistentIframe from "./components/PersistentIframe";

function ProtectedRoute({ component: Component }) {
  const [, navigate] = useLocation();
  const userId = localStorage.getItem('userId');

  useEffect(() => {
    if (!userId) {
      navigate('/login');
    }
  }, [userId, navigate]);

  if (!userId) {
    return null;
  }

  return <Component />;
}

function Router() {
  return (
    <div>
      <Navbar />
      <Switch>
        <Route path="/login" component={Login} />
        <Route path="/profile">{() => <ProtectedRoute component={UserProfile} />}</Route>
        <Route path="/progress">{() => <ProtectedRoute component={ProgressDashboard} />}</Route>
        <Route path="/resume-parse">{() => <ProtectedRoute component={ResumeParse} />}</Route>
        <Route path="/">{() => <ProtectedRoute component={ResumeParse} />}</Route>
        <Route>{() => <ProtectedRoute component={ResumeParse} />}</Route>
      </Switch>
      <PersistentIframe />
    </div>
  );
}

function App() {
  return <Router />;
}

export default App;
