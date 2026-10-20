USE `db-m2`;

/*
Construa índices que atendam as consultas (D, E, H, I, J) realizas na parte 1 do trabalho. 
Apresente o código SQL para criação de cada um destes índices.
*/


CREATE INDEX idx_venda_data ON Venda(data);
CREATE INDEX idx_venda_prod_data ON Venda(produto_idx, data);
CREATE INDEX idx_venda_vendedor_data ON Venda (vendedor_idx, data);

SHOW INDEXES FROM Venda;

# D
EXPLAIN SELECT p.id, p.description, p.price
FROM
    Produto p
    LEFT JOIN Venda v
        ON v.produto_idx = p.id
            AND v.data >= '2026-09-01'
            AND v.data <= '2026-09-30'
WHERE
    v.produto_idx IS NULL;

# E 
EXPLAIN SELECT 
	vv.nome,
    vv.matricula
FROM
	Vendedor vv
		LEFT JOIN
	Venda v ON v.vendedor_idx = vv.matricula
    AND v.data >= DATE_SUB(
        (SELECT MAX(v2.data) FROM Venda v2),
        INTERVAL 20 DAY
    )
WHERE
	v.vendedor_idx is NULL
;

# H 
EXPLAIN SELECT u.id, SUM(p.price * v.quantidade) AS total
FROM
    Venda v
    JOIN Produto p
        ON p.id = v.produto_idx
    JOIN Unidade u
        ON u.id = v.unidade_idx
WHERE
    v.data > DATE_SUB((SELECT MAX(v2.data) FROM Venda v2), INTERVAL 1 YEAR)
GROUP BY
    u.id
HAVING
    SUM(p.price * v.quantidade) > 100000
;

# I 
EXPLAIN SELECT p.id, SUM(v.quantidade) AS unidades
FROM
    Produto p
    LEFT JOIN Venda v
        ON v.produto_idx = p.id
            AND v.data >= DATE_SUB((SELECT MAX(v2.data) FROM Venda v2), INTERVAL 3 MONTH)
GROUP BY
    p.id
HAVING
    SUM(v.quantidade) < 20
    OR SUM(v.quantidade) IS NULL
;

# J
EXPLAIN SELECT
    vv.matricula,
    SUM(p.price * v.quantidade) as total
FROM Venda v
JOIN Produto p ON p.id = v.produto_idx
JOIN Vendedor vv ON vv.matricula = v.vendedor_idx
WHERE v.data >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY vv.matricula
HAVING SUM(p.price * v.quantidade) > (
    SELECT AVG(t.total)
    FROM (
        SELECT
            v_.vendedor_idx,
            SUM(pp.price  * v_.quantidade) as total
        FROM Venda v_
        JOIN Produto pp ON pp.id = v_.produto_idx
        WHERE v_.data >= DATE_SUB((SELECT MAX(v2.data) FROM Venda v2), INTERVAL 1 YEAR)
        GROUP BY v_.vendedor_idx
    ) AS t
)
;