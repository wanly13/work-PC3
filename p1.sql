-- Tabla colegio
CREATE TABLE Colegio (
  Codigo INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Direccion VARCHAR(255),
  Ciudad VARCHAR(255),
  NivelAcad VARCHAR(255),
  TotalAlumnos INT
);

-- Fragmentacion horizonatl
CREATE TABLE fragment_p1 AS
SELECT * FROM Colegio WHERE TotalAlumnos <= 600;

CREATE TABLE fragment_p2 AS
SELECT * FROM Colegio WHERE TotalAlumnos > 600 AND TotalAlumnos <= 1300;

CREATE TABLE fragment_p3 AS
SELECT * FROM Colegio WHERE TotalAlumnos > 1300;


-- Busqueda  (a)

SELECT * FROM fragment_p1 ORDER BY TotalAlumnos;

SELECT * FROM fragment_p2 ORDER BY TotalAlumnos;

SELECT * FROM fragment_p3 ORDER BY TotalAlumnos;


-- Busqueda  (b)
SELECT * FROM fragment_p1 ORDER BY Ciudad;

SELECT * FROM fragment_p2 ORDER BY Ciudad;

SELECT * FROM fragment_p3 ORDER BY Ciudad;

-- Busqueda  (c)
SELECT * FROM fragment_p1 ORDER BY NivelAcad;

SELECT * FROM fragment_p2 ORDER BY NivelAcad;

SELECT * FROM fragment_p3 ORDER BY NivelAcad;

-- Busqueda  (d)

SELECT AVG(TotalAlumnos) FROM fragment_p1;

SELECT AVG(TotalAlumnos) FROM fragment_p2;

SELECT AVG(TotalAlumnos) FROM fragment_p3;

-- Busqueda  (e)

SELECT Ciudad, SUM(TotalAlumnos) FROM fragment_p1 GROUP BY Ciudad;

SELECT Ciudad, SUM(TotalAlumnos) FROM fragment_p2 GROUP BY Ciudad;

SELECT Ciudad, SUM(TotalAlumnos) FROM fragment_p3 GROUP BY Ciudad;