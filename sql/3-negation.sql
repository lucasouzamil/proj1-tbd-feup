-- Likewise in question 2, analyze the query: 'Which parties did not compete in thedistrict of Lisbon?'
-- ############################################
-- x
SELECT p.sigla, p.designacao
FROM xpartidos p
WHERE NOT EXISTS (
    SELECT 1
    FROM xlistas l
    JOIN xdistritos d ON d.codigo = l.distrito
    WHERE d.nome = 'Lisboa' AND l.partido = p.sigla
);
-- y
SELECT p.sigla, p.designacao
FROM ypartidos p
WHERE NOT EXISTS (
    SELECT 1
    FROM ylistas l
    JOIN ydistritos d ON d.codigo = l.distrito
    WHERE d.nome = 'Lisboa' AND l.partido = p.sigla
);
-- z
SELECT p.sigla, p.designacao
FROM zpartidos p
WHERE NOT EXISTS (
    SELECT 1
    FROM zlistas l
    JOIN zdistritos d ON d.codigo = l.distrito
    WHERE d.nome = 'Lisboa' AND l.partido = p.sigla
);