-- X

DROP TABLE xdistritos CASCADE CONSTRAINTS PURGE;
DROP TABLE xconcelhos CASCADE CONSTRAINTS PURGE;
DROP TABLE xfreguesias CASCADE CONSTRAINTS PURGE;
DROP TABLE xpartidos CASCADE CONSTRAINTS PURGE;
DROP TABLE xvotacoes CASCADE CONSTRAINTS PURGE;
DROP TABLE xlistas CASCADE CONSTRAINTS PURGE;
DROP TABLE xparticipacoes CASCADE CONSTRAINTS PURGE;

CREATE TABLE xdistritos AS SELECT * FROM GTD7.DISTRITOS;
CREATE TABLE xconcelhos AS SELECT * FROM GTD7.CONCELHOS;
CREATE TABLE xfreguesias AS SELECT * FROM GTD7.FREGUESIAS;
CREATE TABLE xpartidos AS SELECT * FROM GTD7.PARTIDOS;
CREATE TABLE xvotacoes AS SELECT * FROM GTD7.VOTACOES;
CREATE TABLE xlistas AS SELECT * FROM GTD7.LISTAS;
CREATE TABLE xparticipacoes AS SELECT * FROM GTD7.PARTICIPACOES;


-- Y

DROP TABLE ydistritos CASCADE CONSTRAINTS PURGE;
DROP TABLE yconcelhos CASCADE CONSTRAINTS PURGE;
DROP TABLE yfreguesias CASCADE CONSTRAINTS PURGE;
DROP TABLE ypartidos CASCADE CONSTRAINTS PURGE;
DROP TABLE yvotacoes CASCADE CONSTRAINTS PURGE;
DROP TABLE ylistas CASCADE CONSTRAINTS PURGE;
DROP TABLE yparticipacoes CASCADE CONSTRAINTS PURGE;

CREATE TABLE ydistritos AS SELECT * FROM GTD7.DISTRITOS;
CREATE TABLE yconcelhos AS SELECT * FROM GTD7.CONCELHOS;
CREATE TABLE yfreguesias AS SELECT * FROM GTD7.FREGUESIAS;
CREATE TABLE ypartidos AS SELECT * FROM GTD7.PARTIDOS;
CREATE TABLE yvotacoes AS SELECT * FROM GTD7.VOTACOES;
CREATE TABLE ylistas AS SELECT * FROM GTD7.LISTAS;
CREATE TABLE yparticipacoes AS SELECT * FROM GTD7.PARTICIPACOES;

ALTER TABLE ydistritos
  ADD CONSTRAINT pk_ydistritos PRIMARY KEY (codigo);

ALTER TABLE yconcelhos
  ADD CONSTRAINT pk_yconcelhos PRIMARY KEY (codigo);

ALTER TABLE yfreguesias
  ADD CONSTRAINT pk_yfreguesias PRIMARY KEY (codigo);

ALTER TABLE ypartidos
  ADD CONSTRAINT pk_ypartidos PRIMARY KEY (sigla);

ALTER TABLE yvotacoes
  ADD CONSTRAINT pk_yvotacoes PRIMARY KEY (partido, freguesia);

ALTER TABLE ylistas
  ADD CONSTRAINT pk_ylistas PRIMARY KEY (distrito, partido);

ALTER TABLE yparticipacoes
  ADD CONSTRAINT pk_yparticipacoes PRIMARY KEY (distrito);

ALTER TABLE yconcelhos
  ADD CONSTRAINT fk_yconcelhos_distrito
  FOREIGN KEY (distrito) REFERENCES ydistritos (codigo);

ALTER TABLE yfreguesias
  ADD CONSTRAINT fk_yfreguesias_concelho
  FOREIGN KEY (concelho) REFERENCES yconcelhos (codigo);

ALTER TABLE yvotacoes
  ADD CONSTRAINT fk_yvotacoes_partido
  FOREIGN KEY (partido) REFERENCES ypartidos (sigla);

ALTER TABLE yvotacoes
  ADD CONSTRAINT fk_yvotacoes_freguesia
  FOREIGN KEY (freguesia) REFERENCES yfreguesias (codigo);

ALTER TABLE ylistas
  ADD CONSTRAINT fk_ylistas_distrito
  FOREIGN KEY (distrito) REFERENCES ydistritos (codigo);

ALTER TABLE ylistas
  ADD CONSTRAINT fk_ylistas_partido
  FOREIGN KEY (partido) REFERENCES ypartidos (sigla);

ALTER TABLE yparticipacoes
  ADD CONSTRAINT fk_yparticipacoes_distrito
  FOREIGN KEY (distrito) REFERENCES ydistritos (codigo);


-- Z - WITH INTEGRITY CONSTRAINTS + EXTRA INDEXES

DROP TABLE zdistritos CASCADE CONSTRAINTS PURGE;
DROP TABLE zconcelhos CASCADE CONSTRAINTS PURGE;
DROP TABLE zfreguesias CASCADE CONSTRAINTS PURGE;
DROP TABLE zpartidos CASCADE CONSTRAINTS PURGE;
DROP TABLE zvotacoes CASCADE CONSTRAINTS PURGE;
DROP TABLE zlistas CASCADE CONSTRAINTS PURGE;
DROP TABLE zparticipacoes CASCADE CONSTRAINTS PURGE;

CREATE TABLE zdistritos AS SELECT * FROM GTD7.DISTRITOS;
CREATE TABLE zconcelhos AS SELECT * FROM GTD7.CONCELHOS;
CREATE TABLE zfreguesias AS SELECT * FROM GTD7.FREGUESIAS;
CREATE TABLE zpartidos AS SELECT * FROM GTD7.PARTIDOS;
CREATE TABLE zvotacoes AS SELECT * FROM GTD7.VOTACOES;
CREATE TABLE zlistas AS SELECT * FROM GTD7.LISTAS;
CREATE TABLE zparticipacoes AS SELECT * FROM GTD7.PARTICIPACOES;

ALTER TABLE zdistritos
  ADD CONSTRAINT pk_zdistritos PRIMARY KEY (codigo);

ALTER TABLE zconcelhos
  ADD CONSTRAINT pk_zconcelhos PRIMARY KEY (codigo);

ALTER TABLE zfreguesias
  ADD CONSTRAINT pk_zfreguesias PRIMARY KEY (codigo);

ALTER TABLE zpartidos
  ADD CONSTRAINT pk_zpartidos PRIMARY KEY (sigla);

ALTER TABLE zvotacoes
  ADD CONSTRAINT pk_zvotacoes PRIMARY KEY (partido, freguesia);

ALTER TABLE zlistas
  ADD CONSTRAINT pk_zlistas PRIMARY KEY (distrito, partido);

ALTER TABLE zparticipacoes
  ADD CONSTRAINT pk_zparticipacoes PRIMARY KEY (distrito);

ALTER TABLE zconcelhos
  ADD CONSTRAINT fk_zconcelhos_distrito
  FOREIGN KEY (distrito) REFERENCES zdistritos (codigo);

ALTER TABLE zfreguesias
  ADD CONSTRAINT fk_zfreguesias_concelho
  FOREIGN KEY (concelho) REFERENCES zconcelhos (codigo);

ALTER TABLE zvotacoes
  ADD CONSTRAINT fk_zvotacoes_partido
  FOREIGN KEY (partido) REFERENCES zpartidos (sigla);

ALTER TABLE zvotacoes
  ADD CONSTRAINT fk_zvotacoes_freguesia
  FOREIGN KEY (freguesia) REFERENCES zfreguesias (codigo);

ALTER TABLE zlistas
  ADD CONSTRAINT fk_zlistas_distrito
  FOREIGN KEY (distrito) REFERENCES zdistritos (codigo);

ALTER TABLE zlistas
  ADD CONSTRAINT fk_zlistas_partido
  FOREIGN KEY (partido) REFERENCES zpartidos (sigla);

ALTER TABLE zparticipacoes
  ADD CONSTRAINT fk_zparticipacoes_distrito
  FOREIGN KEY (distrito) REFERENCES zdistritos (codigo);

-- Extra indexes for query optimization in Z
CREATE INDEX idx_zconcelhos_distrito
  ON zconcelhos (distrito);

CREATE INDEX idx_zfreguesias_concelho
  ON zfreguesias (concelho);

CREATE INDEX idx_zlistas_distrito
  ON zlistas (distrito);

CREATE INDEX idx_zlistas_partido
  ON zlistas (partido);

CREATE INDEX idx_zvotacoes_freguesia
  ON zvotacoes (freguesia);