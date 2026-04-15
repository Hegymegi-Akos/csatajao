import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { apiUrl } from '../apiBase';

function DenmarkStrait() {
  const [hajok, setHajok] = useState([]);
  const navigate = useNavigate();
  const csataNev = 'Denmark Strait';

  // 10. feladat: Denmark Strait csata résztvevőinek lekérdezése
  const fetchResztvevok = () => {
    fetch(apiUrl(`/api/Csata/Resztvevok/${encodeURIComponent(csataNev)}`))
      .then((response) => response.json())
      .then((data) => setHajok(data))
      .catch((error) => {
        // 15. feladat: Hiba megjelenítése a konzolban
        console.error(error);
      });
  };

  useEffect(() => {
    fetchResztvevok();
  }, []);

  // 12-14. feladat: Hajó törlése a csatából
  const handleTorles = (hajoNev) => {
    // 13. feladat: Confirm ablak törlés előtt
    if (window.confirm('Biztosan szeretnéd törölni?')) {
      fetch(
        apiUrl(`/api/Kimenet/KimenetTorles/${encodeURIComponent(csataNev)}/${encodeURIComponent(hajoNev)}`),
        { method: 'DELETE' }
      )
        .then((response) => {
          if (response.ok) {
            // 14. feladat: Sikeres törlés -> alert + navigálás a főoldalra
            alert('Sikeres törlés!');
            navigate('/');
          } else {
            // 15. feladat: Hiba megjelenítése a konzolban
            response.text().then((msg) => console.error(msg));
          }
        })
        .catch((error) => {
          // 15. feladat: Hiba megjelenítése a konzolban
          console.error(error);
        });
    }
  };

  return (
    <div>
      <h2 className="mb-4">A Denmark Strait csata</h2>
      {/* 11. feladat: Bootstrap kártyákon a hajók + törlés ikon */}
      <div className="row">
        {hajok.map((hajoNev) => (
          <div className="col-md-4 col-lg-3 mb-3" key={hajoNev}>
            <div className="card h-100">
              <div className="card-body d-flex justify-content-between align-items-center">
                <h5 className="card-title mb-0">{hajoNev}</h5>
                <i
                  className="bi bi-trash text-danger"
                  style={{ cursor: 'pointer', fontSize: '1.3rem' }}
                  onClick={() => handleTorles(hajoNev)}
                  title="Törlés"
                ></i>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default DenmarkStrait;
