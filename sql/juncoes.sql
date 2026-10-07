USE `db-m2`;

# A. Retorne todas as vendas de determinado produto, exibindo detalhes das unidades
# que realizaram a venda.

SELECT 
    *
FROM
    Venda v
        JOIN
    Produto p ON p.id = 1
        JOIN
    Unidade u ON u.id = v.unidade_idx
ORDER BY p.price;

# B. Retorne todas as vendas de determinado vendedor, exibindo os detalhes da venda,
# das unidades, e do vendedor.

SELECT 
    *
FROM
    Venda v
        JOIN
    Vendedor vv ON vv.matricula = 1001
        JOIN
    Unidade u ON u.id = v.unidade_idx
ORDER BY 1;

# C. Retorne todas as vendas de determinada unidade, realizadas nos últimos 2 anos.

SELECT 
    *
FROM
    Venda v
        JOIN
    Unidade u ON u.id = 1
WHERE
    v.data > '2024-01-01'
        AND v.data <= '2026-12-31';

# D. Retorne todos os produtos que não tiveram vendas realizadas no último mês.
# Ultimo mes em nossa DB: 09 (Setembro)
                                
SELECT 
    p.id, p.description, p.price
FROM
    Produto p
        LEFT JOIN
    Venda v ON v.produto_idx = p.id
        AND v.data >= '2026-09-01'
        AND v.data <= '2026-09-30'
WHERE
    v.produto_idx IS NULL;
    
# E. Retorne todos os vendedores que não realizaram nenhuma venda nos últimos 20 dias.

SELECT 
	vv.nome,
    vv.matricula
FROM
	Vendedor vv
		LEFT JOIN
	Venda v ON v.vendedor_idx = vv.matricula
    AND v.data >= DATE_SUB(CURRENT_DATE(), INTERVAL 20 DAY)
WHERE
	v.vendedor_idx is NULL
;