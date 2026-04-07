-- a)
-- ############################################
-- freguesia no concelho com codigo 1103
-- x
SELECT f.codigo, f.nome
FROM xfreguesias f
WHERE f.concelho = 1103;
-- y
SELECT f.codigo, f.nome
FROM yfreguesias f
WHERE f.concelho = 1103;
-- z
SELECT f.codigo, f.nome
FROM zfreguesias f
WHERE f.concelho = 1103;

-- freguesia no concelho com o nome 'Azambuja'
-- x
SELECT f.codigo, f.nome
FROM xfreguesias f
JOIN xconcelhos c ON c.codigo = f.concelho
WHERE c.nome = 'Azambuja';
-- y
SELECT f.codigo, f.nome
FROM yfreguesias f
JOIN yconcelhos c ON c.codigo = f.concelho
WHERE c.nome = 'Azambuja';
-- z
SELECT f.codigo, f.nome
FROM zfreguesias f
JOIN zconcelhos c ON c.codigo = f.concelho
WHERE c.nome = 'Azambuja';


-- b)
-- ############################################
-- x
SELECT p.sigla, p.designacao, l.mandatos
FROM xlistas l
JOIN xpartidos p ON p.sigla = l.partido
JOIN xdistritos d ON d.codigo = l.distrito
WHERE d.nome = 'Lisboa';
-- y
SELECT p.sigla, p.designacao, l.mandatos
FROM ylistas l
JOIN ypartidos p ON p.sigla = l.partido
JOIN ydistritos d ON d.codigo = l.distrito
WHERE d.nome = 'Lisboa';
-- z
SELECT p.sigla, p.designacao, l.mandatos
FROM zlistas l
JOIN zpartidos p ON p.sigla = l.partido
JOIN zdistritos d ON d.codigo = l.distrito
WHERE d.nome = 'Lisboa';


-- c)
-- ############################################
-- x
SELECT SUM(v.votos) AS total_votos
FROM xvotacoes v
JOIN xfreguesias f ON f.codigo = v.freguesia
JOIN xconcelhos c  ON c.codigo = f.concelho
JOIN xdistritos d  ON d.codigo = c.distrito
WHERE v.partido = 'BE' AND d.nome = 'Lisboa';

-- y
SELECT SUM(v.votos) AS total_votos
FROM yvotacoes v
JOIN yfreguesias f ON f.codigo = v.freguesia
JOIN yconcelhos c  ON c.codigo = f.concelho
JOIN ydistritos d  ON d.codigo = c.distrito
WHERE v.partido = 'BE' AND d.nome = 'Lisboa';

-- z
SELECT SUM(v.votos) AS total_votos
FROM zvotacoes v
JOIN zfreguesias f ON f.codigo = v.freguesia
JOIN zconcelhos c  ON c.codigo = f.concelho
JOIN zdistritos d  ON d.codigo = c.distrito
WHERE v.partido = 'BE' AND d.nome = 'Lisboa';
