-- a. How many votes did the party PS obtain nationwide?
-- ############################################
-- x
SELECT SUM(NVL(votos, 0)) AS total_votos
FROM xvotacoes
WHERE partido = 'PS';
-- y
SELECT SUM(NVL(votos, 0)) AS total_votos
FROM yvotacoes
WHERE partido = 'PS';
-- z
SELECT SUM(NVL(votos, 0)) AS total_votos
FROM zvotacoes
WHERE partido = 'PS';

-- b. How many votes did each party obtain in each district?
-- ############################################
-- x
SELECT d.codigo AS distrito_codigo,
       d.nome   AS distrito_nome,
       p.sigla  AS partido_sigla,
       p.designacao,
       SUM(NVL(v.votos, 0)) AS total_votos
FROM xvotacoes v
JOIN xfreguesias f ON f.codigo = v.freguesia
JOIN xconcelhos c  ON c.codigo = f.concelho
JOIN xdistritos d  ON d.codigo = c.distrito
JOIN xpartidos p   ON p.sigla = v.partido
GROUP BY d.codigo, d.nome, p.sigla, p.designacao
ORDER BY d.codigo, p.sigla;
-- y
SELECT d.codigo AS distrito_codigo,
       d.nome   AS distrito_nome,
       p.sigla  AS partido_sigla,
       p.designacao,
       SUM(NVL(v.votos, 0)) AS total_votos
FROM yvotacoes v
JOIN yfreguesias f ON f.codigo = v.freguesia
JOIN yconcelhos c  ON c.codigo = f.concelho
JOIN ydistritos d  ON d.codigo = c.distrito
JOIN ypartidos p   ON p.sigla = v.partido
GROUP BY d.codigo, d.nome, p.sigla, p.designacao
ORDER BY d.codigo, p.sigla;
-- z
SELECT d.codigo AS distrito_codigo,
       d.nome   AS distrito_nome,
       p.sigla  AS partido_sigla,
       p.designacao,
       SUM(NVL(v.votos, 0)) AS total_votos
FROM zvotacoes v
JOIN zfreguesias f ON f.codigo = v.freguesia
JOIN zconcelhos c  ON c.codigo = f.concelho
JOIN zdistritos d  ON d.codigo = c.distrito
JOIN zpartidos p   ON p.sigla = v.partido
GROUP BY d.codigo, d.nome, p.sigla, p.designacao
ORDER BY d.codigo, p.sigla;

-- c. Which party obtained the highest number of votes in a parish? Indicate the 
-- partyacronym, parish name, and the corresponding votes.
-- ############################################
-- x
SELECT p.sigla AS partido_sigla,
       f.nome  AS freguesia_nome,
       v.votos
FROM xvotacoes v
JOIN xpartidos p   ON p.sigla = v.partido
JOIN xfreguesias f ON f.codigo = v.freguesia
WHERE NVL(v.votos, 0) = (
    SELECT MAX(NVL(v2.votos, 0))
    FROM xvotacoes v2
);
-- y
SELECT p.sigla AS partido_sigla,
       f.nome  AS freguesia_nome,
       v.votos
FROM yvotacoes v
JOIN ypartidos p   ON p.sigla = v.partido
JOIN yfreguesias f ON f.codigo = v.freguesia
WHERE NVL(v.votos, 0) = (
    SELECT MAX(NVL(v2.votos, 0))
    FROM yvotacoes v2
);
-- z
SELECT p.sigla AS partido_sigla,
       f.nome  AS freguesia_nome,
       v.votos
FROM zvotacoes v
JOIN zpartidos p   ON p.sigla = v.partido
JOIN zfreguesias f ON f.codigo = v.freguesia
WHERE NVL(v.votos, 0) = (
    SELECT MAX(NVL(v2.votos, 0))
    FROM zvotacoes v2
);

-- d. For each district, indicate its name and the party that obtained 
-- the highest number of votes in that district.
-- ############################################
-- x
SELECT d.nome AS distrito_nome,
       p.sigla AS partido_sigla,
       SUM(NVL(v.votos, 0)) AS total_votos
FROM xvotacoes v
JOIN xfreguesias f ON f.codigo = v.freguesia
JOIN xconcelhos c  ON c.codigo = f.concelho
JOIN xdistritos d  ON d.codigo = c.distrito
JOIN xpartidos p   ON p.sigla = v.partido
GROUP BY d.codigo, d.nome, p.sigla
HAVING SUM(NVL(v.votos, 0)) = (
    SELECT MAX(total_votos)
    FROM (
        SELECT SUM(NVL(v2.votos, 0)) AS total_votos
        FROM xvotacoes v2
        JOIN xfreguesias f2 ON f2.codigo = v2.freguesia
        JOIN xconcelhos c2  ON c2.codigo = f2.concelho
        WHERE c2.distrito = d.codigo
        GROUP BY v2.partido
    )
);
-- y
SELECT d.nome AS distrito_nome,
       p.sigla AS partido_sigla,
       SUM(NVL(v.votos, 0)) AS total_votos
FROM yvotacoes v
JOIN yfreguesias f ON f.codigo = v.freguesia
JOIN yconcelhos c  ON c.codigo = f.concelho
JOIN ydistritos d  ON d.codigo = c.distrito
JOIN ypartidos p   ON p.sigla = v.partido
GROUP BY d.codigo, d.nome, p.sigla
HAVING SUM(NVL(v.votos, 0)) = (
    SELECT MAX(total_votos)
    FROM (
        SELECT SUM(NVL(v2.votos, 0)) AS total_votos
        FROM yvotacoes v2
        JOIN yfreguesias f2 ON f2.codigo = v2.freguesia
        JOIN yconcelhos c2  ON c2.codigo = f2.concelho
        WHERE c2.distrito = d.codigo
        GROUP BY v2.partido
    )
);
-- z  
SELECT d.nome AS distrito_nome,
       p.sigla AS partido_sigla,
       SUM(NVL(v.votos, 0)) AS total_votos
FROM Zvotacoes v
JOIN Zfreguesias f ON f.codigo = v.freguesia
JOIN Zconcelhos c  ON c.codigo = f.concelho
JOIN Zdistritos d  ON d.codigo = c.distrito
JOIN Zpartidos p   ON p.sigla = v.partido
GROUP BY d.codigo, d.nome, p.sigla
HAVING SUM(NVL(v.votos, 0)) = (
    SELECT MAX(total_votos)
    FROM (
        SELECT SUM(NVL(v2.votos, 0)) AS total_votos
        FROM Zvotacoes v2
        JOIN Zfreguesias f2 ON f2.codigo = v2.freguesia
        JOIN Zconcelhos c2  ON c2.codigo = f2.concelho
        WHERE c2.distrito = d.codigo
        GROUP BY v2.partido
    )
);