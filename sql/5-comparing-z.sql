-- create b-tree indexes
DROP INDEX idx_zconcelhos_distrito;
DROP INDEX idx_zvotacoes_partido;

CREATE INDEX idx_zconcelhos_distrito
ON zconcelhos (distrito);

CREATE INDEX idx_zvotacoes_partido
ON zvotacoes (partido);

-- execute the main query
SELECT c.distrito, v.partido, SUM(NVL(v.votos, 0)) AS total_votos
FROM zvotacoes v
JOIN zfreguesias f ON f.codigo = v.freguesia
JOIN zconcelhos c  ON c.codigo = f.concelho
WHERE c.distrito IN (11, 15, 17) AND v.partido IN ('PS', 'PSD')
GROUP BY c.distrito, v.partido
ORDER BY c.distrito, v.partido;

-- create bitmap indexes
DROP INDEX idx_zconcelhos_distrito;
DROP INDEX idx_zvotacoes_partido;

CREATE BITMAP INDEX bix_zconcelhos_distrito
ON zconcelhos (distrito);

CREATE BITMAP INDEX bix_zvotacoes_partido
ON zvotacoes (partido);

-- execute the main query
SELECT c.distrito, v.partido, SUM(NVL(v.votos, 0)) AS total_votos
FROM zvotacoes v
JOIN zfreguesias f ON f.codigo = v.freguesia
JOIN zconcelhos c  ON c.codigo = f.concelho
WHERE c.distrito IN (11, 15, 17) AND v.partido IN ('PS', 'PSD')
GROUP BY c.distrito, v.partido
ORDER BY c.distrito, v.partido;