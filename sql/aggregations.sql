USE `db-m2`;

# F. Retorne a quantidade de vendas de determinado produto e o valor total destas
# vendas. 

SELECT v.quantidade, SUM(price) FROM Venda v
JOIN Produto p ON p.id = 1
GROUP BY p.price;

# G. Retorne a quantidade de vendas de determinado vendedor, exibindo o valor total
 # destas vendas e a média dos valores das vendas.

SELECT
	p.price * v.quantidade as total,
    AVG(p.price * v.quantidade) as media
FROM
    Venda v
        JOIN
    Vendedor vv ON vv.matricula = v.vendedor_idx
        JOIN
    Produto p ON p.id = v.produto_idx
WHERE
    vv.matricula = 1001
GROUP BY price
ORDER BY total;