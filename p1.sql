
-- Fragmentacion horizonatl (para TotalAlumnos)
CREATE TABLE Colegio_Particionado (
  Código INT,
  Nombre VARCHAR(100),
  Dirección VARCHAR(100),
  Ciudad VARCHAR(100),
  NivelAcad VARCHAR(50),
  TotalAlumnos INT
) PARTITION BY RANGE (TotalAlumnos);

CREATE TABLE Colegio_Particionado_Part1 PARTITION OF Colegio_Particionado
  FOR VALUES FROM (MINVALUE) TO (600);

CREATE TABLE Colegio_Particionado_Part2 PARTITION OF Colegio_Particionado
  FOR VALUES FROM (600) TO (1300);

CREATE TABLE Colegio_Particionado_Part3 PARTITION OF Colegio_Particionado
  FOR VALUES FROM (1300) TO (MAXVALUE);


-- Busqueda  (a)
SELECT * FROM Colegio_Particionado ORDER BY TotalAlumnos;

-- Fragmentacion horizonatl (para Ciudad)
CREATE TABLE Colegio_ParticionadoCiudad (
  Código INT,
  Nombre VARCHAR(100),
  Dirección VARCHAR(100),
  Ciudad VARCHAR(100),
  NivelAcad VARCHAR(50),
  TotalAlumnos INT
) PARTITION BY LIST (Ciudad);

CREATE TABLE Colegio_Particionado_CiudadA PARTITION OF Colegio_ParticionadoCiudad
  FOR VALUES IN ('CiudadA');

CREATE TABLE Colegio_Particionado_CiudadB PARTITION OF Colegio_ParticionadoCiudad
  FOR VALUES IN ('CiudadB');
SELECT * FROM Colegio_ParticionadoCiudad ORDER BY Ciudad

-- Busqueda  (b)
SELECT * FROM Colegio_ParticionadoCiudad ORDER BY Ciudad;

-- Fragmentacion horizonatl (para nivelAcad)
CREATE TABLE Colegio_Particionado (
  Código INT,
  Nombre VARCHAR(100),
  Dirección VARCHAR(100),
  Ciudad VARCHAR(100),
  NivelAcad VARCHAR(50),
  TotalAlumnos INT
) PARTITION BY LIST (NivelAcad);

CREATE TABLE Colegio_Particionado_NivelS PARTITION OF Colegio_ParticionadoNivelAcad
  FOR VALUES IN ('S');

CREATE TABLE Colegio_Particionado_NivelU PARTITION OF Colegio_ParticionadoNivelAcad
  FOR VALUES IN ('U');
-- Busqueda  (c)
  SELECT * FROM Colegio_ParticionadoNivelAcad ORDER BY NivelAcad;


-- Busqueda  (d)
SELECT AVG(TotalAlumnos) FROM Colegio_Particionado;

-- Busqueda  (e)

SELECT Ciudad, SUM(TotalAlumnos) FROM Colegio_Particionado GROUP BY Ciudad;
