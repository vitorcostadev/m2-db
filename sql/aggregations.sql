USE `db-m2`;

# F. Retorne a quantidade de vendas de determinado produto e o valor total destas
# vendas. 

SELECT
    p.id,
    COUNT(*) AS vendas_qty, 
    SUM(p.price * v.quantidade) AS total
FROM
    Venda v
    JOIN Produto p
        ON p.id = v.produto_idx
WHERE
    p.id = 1
GROUP BY 
    p.id
;

# G. Retorne a quantidade de vendas de determinado vendedor, exibindo o valor total
# destas vendas e a média dos valores das vendas.

SELECT
    vv.matricula,
    COUNT(*) AS vendas_qty,
    SUM(p.price * v.quantidade) AS total,
    AVG(p.price * v.quantidade) AS media
FROM
    Venda v
    JOIN Produto p
        ON p.id = v.produto_idx
    JOIN Vendedor vv
        ON vv.matricula = v.vendedor_idx
WHERE
    v.vendedor_idx = 1001
GROUP BY
    vv.matricula;

# H. Retorne todas as unidades que tiveram o valor total de vendas superior a 100.000 no
# último ano.

SELECT u.id, SUM(p.price * v.quantidade) AS total
FROM
    Venda v
    JOIN Produto p
        ON p.id = v.produto_idx
    JOIN Unidade u
        ON u.id = v.unidade_idx
WHERE
    v.data >= DATE_SUB((SELECT MAX(v2.data) FROM Venda v2), INTERVAL 1 YEAR)
GROUP BY
    u.id
HAVING
    SUM(p.price * v.quantidade) > 100000
;

/*
I.Retorne todos os produtos que tiveram total de vendas nos últimos 3 meses inferior
a 20 unidades.
*/

SELECT p.id, SUM(v.quantidade) AS unidades
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

# J.Retorne todos os vendedores que no último ano tiveram valor de vendas acumulado
# acima da média das vendas de todos os vendedores.

SELECT
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
