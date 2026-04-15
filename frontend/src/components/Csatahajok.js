import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { apiUrl } from '../apiBase';

function Csatahajok() {
  const [hajok, setHajok] = useState([]);
  const navigate = useNavigate();

  // 5. feladat: Hajók lekérdezése a szerverről
  useEffect(() => {
    fetch(apiUrl('/api/Hajo/All'))
      .then((response) => response.json())
      .then((data) => setHajok(data))
      .catch((error) => {
        // 15. feladat: Hiba megjelenítése a konzolban
        console.error(error);
      });
  }, []);

  return (
    <div>
      <h2 className="mb-4">Csatahajók</h2>
      {/* 6. feladat: Bootstrap cardok sorokba és oszlopokba rendezve, csak a hajó neve */}
      <div className="row">
        {hajok.map((hajo) => (
          <div className="col-md-4 col-lg-3 mb-3" key={hajo.nev}>
            {/* 7. feladat: Kattintásra navigálás a részletes oldalra */}
            <div
              className="card h-100"
              style={{ cursor: 'pointer' }}
              onClick={() => navigate(`/hajo/${hajo.nev}`)}
            >
              <div className="card-body d-flex align-items-center justify-content-center">
                <h5 className="card-title mb-0">{hajo.nev}</h5>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Csatahajok;
