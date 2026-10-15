use `2026-2_banco-de-dados`;

-- 2) Dada a estrutura criada na atividade 1 escreva o código SQL para retornar todos os
-- estudantes que moram em City “Ulm”, projetando o Name, o Roll_No e a Street. (1
-- ponto)

SELECT name, roll_no,
		(SELECT street
        FROM StudentAddress
        WHERE StudentAddress.id = Student.chave_address
        ) AS street
FROM Student 
WHERE chave_address IN (
	SELECT id
    FROM StudentAddress
    WHERE city = 'Ulm'
);
