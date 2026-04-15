import React from 'react';
import { BrowserRouter as Router, Routes, Route, NavLink } from 'react-router-dom';
import Csatahajok from './components/Csatahajok';
import HajoReszletek from './components/HajoReszletek';
import DenmarkStrait from './components/DenmarkStrait';

function App() {
  return (
    <Router>
      {/* 4. feladat: Navbar komponens */}
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
        <div className="container">
          <span className="navbar-brand">Csatahajók App</span>
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNav"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav">
              <li className="nav-item">
                <NavLink className="nav-link" to="/">
                  Csatahajók
                </NavLink>
              </li>
              <li className="nav-item">
                <NavLink className="nav-link" to="/denmark-strait">
                  A Denmark Strait csata
                </NavLink>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      {/* 3. feladat: Router útvonalak */}
      <div className="container mt-4">
        <Routes>
          <Route path="/" element={<Csatahajok />} />
          <Route path="/hajo/:name" element={<HajoReszletek />} />
          <Route path="/denmark-strait" element={<DenmarkStrait />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
