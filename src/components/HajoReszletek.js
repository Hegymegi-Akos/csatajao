import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';

function HajoReszletek() {
  const { name } = useParams();
  const navigate = useNavigate();
  const [hajo, setHajo] = useState(null);

  // 8. feladat: Hajó részletes adatainak lekérdezése név alapján
  useEffect(() => {
    fetch(`http://localhost:5014/api/Hajo/ByName/${name}`)
      .then((response) => response.json())
      .then((data) => setHajo(data))
      .catch((error) => {
        // 15. feladat: Hiba megjelenítése a konzolban
        console.error(error);
      });
  }, [name]);

  if (!hajo) {
    return <p>Betöltés...</p>;
  }

  // 9. feladat: Adatok megjelenítése kártyán + Vissza gomb
  return (
    <div>
      <h2 className="mb-4">{hajo.nev}</h2>
      <div className="card" style={{ maxWidth: '500px' }}>
        <div className="card-body">
          <h5 className="card-title">{hajo.nev}</h5>
          <ul className="list-group list-group-flush">
            <li className="list-group-item">
              <strong>Osztály:</strong> {hajo.osztaly || 'N/A'}
            </li>
            <li className="list-group-item">
              <strong>Felavatva:</strong> {hajo.felavatva || 'N/A'}
            </li>
            <li className="list-group-item">
              <strong>Ágyúk száma:</strong> {hajo.agyukSzama}
            </li>
            <li className="list-group-item">
              <strong>Kaliber:</strong> {hajo.kaliber}
            </li>
            <li className="list-group-item">
              <strong>Vízkiszorítás:</strong> {hajo.vizkiszoritas}
            </li>
          </ul>
        </div>
      </div>
      {/* 9. feladat: Vissza gomb */}
      <button className="btn btn-primary mt-3" onClick={() => navigate('/')}>
        Vissza a csatahajókhoz
      </button>
    </div>
  );
}

export default HajoReszletek;
