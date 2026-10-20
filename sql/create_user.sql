USE `db-m2`;

CREATE USER 'app1'@'localhost' IDENTIFIED BY 'app1';

GRANT SELECT ON `db-m2`.`Unidade` TO 'app1'@'localhost';
GRANT SELECT ON `db-m2`.`Produto` TO 'app1'@'localhost';
GRANT SELECT ON `db-m2`.`Vendedor` TO 'app1'@'localhost';
GRANT SELECT ON `db-m2`.`Venda` TO 'app1'@'localhost';