use `2026-2_banco-de-dados`;

-- 4) Dada a estrutura criada na atividade 3 escreva uma consulta que retorne todas as
-- “Tracks”, projetando o track_name e o time das tracks que tem o atributo time maior
-- que 180. (2 ponto)

SELECT track_name, time
FROM Track
WHERE time > 180;

-- 5) Dada a estrutura criada na atividade 3 (1 ponto), escreva uma consulta que dado o id
-- de uma track, retorne todo seu histórico de reprodução.

SELECT played
FROM Played
WHERE track_id = 1;

SELECT * FROM Track, Album, Played
LIMIT 15;