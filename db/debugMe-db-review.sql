
CREATE DATABASE debugMe;
USE debugMe;

CREATE TABLE usuarios (
  IDu int NOT NULL,
  nombre varchar(20) NOT NULL,
  apellido varchar(20) NOT NULL,
  username varchar(20) NOT NULL UNIQUE,
  pass varchar(15) NOT NULL,
  email varchar(25) NOT NULL UNIQUE,
  fotoLink varchar(1050) DEFAULT NULL,
  fnac date NOT NULL,
  PRIMARY KEY (IDu)); 
  
  CREATE TABLE estudiante (
  IDu int NOT NULL,
  FOREIGN KEY (IDu) REFERENCES usuarios(IDu));
  
  CREATE TABLE experto (
  IDu int NOT NULL,
  FOREIGN KEY (IDu) REFERENCES usuarios(IDu));
  
  CREATE TABLE tecnologia (
  IDt int NOT NULL,
  nombre varchar(15) DEFAULT NULL,
  PRIMARY KEY (IDt)); 
  
  CREATE TABLE expertoEn (
  IDu int NOT NULL,
  IDt int NOT NULL,
  PRIMARY KEY (IDu, IDt),
  FOREIGN KEY (IDt) REFERENCES tecnologia (IDt),
  FOREIGN KEY (IDu) REFERENCES experto (IDu));
  
  CREATE TABLE pregunta (
  IDp int NOT NULL,
  titulo varchar(50) NOT NULL,
  campo varchar(1500) NOT NULL,
  fechahora timestamp NOT NULL,
  IDu int NOT NULL,
  IDt int NOT NULL,
  PRIMARY KEY (IDp),
  FOREIGN KEY (IDu) REFERENCES usuarios (IDu),
  FOREIGN KEY (IDt) REFERENCES tecnologia (IDt));
  
  CREATE TABLE respuesta (
  IDr int NOT NULL,
  campo varchar(1500) NOT NULL,
  fechahora timestamp NOT NULL,
  IDp int NOT NULL,
  IDu int NOT NULL,
  PRIMARY KEY (IDr),
  FOREIGN KEY (IDp) REFERENCES pregunta (IDp),
  FOREIGN KEY (IDu) REFERENCES experto (IDu));
  
  CREATE TABLE valora (
  nota tinyint NOT NULL,
  IDu int NOT NULL,
  IDr int NOT NULL,
  PRIMARY KEY (IDu, IDr),
  FOREIGN KEY (IDu) REFERENCES usuarios (IDu),
  FOREIGN KEY (IDr) REFERENCES respuesta (IDr));