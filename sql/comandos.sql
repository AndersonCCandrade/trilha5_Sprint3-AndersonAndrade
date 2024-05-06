-- TAREFA 1 - Inserindo novo colaborador

INSERT INTO BRH.ENDERECO (cep, uf, cidade, bairro)
VALUES
('02401-200','SP','São Paulo','Santana');

INSERT INTO BRH.COLABORADOR (matricula, cpf, nome, salario, departamento, cep,
logradouro, complemento_endereco) 
VALUES 
('A124','335.578.528.06','fulano de tal',580.55,'DEPTI','02401-200','Rua Voluntários da Pátria','Senac');

INSERT INTO BRH.TELEFONE_COLABORADOR (numero, colaborador, tipo)
VALUES
('(61) 99999-9999','A124','M');

INSERT INTO BRH.TELEFONE_COLABORADOR (numero, colaborador, tipo)
VALUES
('(61) 3030-4040','A124','R');

INSERT INTO BRH.EMAIL_COLABORADOR (email, colaborador, tipo)
VALUES
('fulano@email.com','A124','P');

INSERT INTO BRH.EMAIL_COLABORADOR (email, colaborador, tipo)
VALUES
('fulano.tal@brh.com','A124','T');

INSERT INTO BRH.DEPENDENTE (cpf, nome, data_nascimento, parentesco, colaborador)
VALUES
('236.254.875-55','Beltrana de Tal','02/02/2022','Filho(a)','A124');

INSERT INTO BRH.DEPENDENTE (cpf, nome, data_nascimento, parentesco, colaborador)
VALUES
('005.275.852-98','Cicrana de Tal','01/08/1785','Cônjuge','A124');

INSERT INTO BRH.PROJETO (nome,responsavel, inicio, fim) --ID GERADO AUTOM�?TICAMENTE
VALUES
('BI','B123','01/09/2023','12/12/2023');

INSERT INTO BRH.PAPEL (nome) --ID GERADO AUTOM�?TICAMENTE
VALUES
('Especialista de Negócios');

INSERT INTO BRH.ATRIBUICAO (colaborador, projeto,papel)
VALUES
('A124',9,8);



--TAREFA 2 - Criando relat�rio de c�njuges

SELECT 
    C.MATRICULA AS "MATRICULA DO COLABORADOR", 
    D.NOME AS "DEPENDENTE",
    D.DATA_NASCIMENTO AS "DATA DE NASCIMENTO DO DEPENDENTE", 
    D.PARENTESCO  
FROM 
    BRH.COLABORADOR C 
INNER JOIN 
    BRH.DEPENDENTE D 
    ON  
    D.COLABORADOR = C.MATRICULA
WHERE 
    D.PARENTESCO = 'CÃ´njuge';



--TAREFA 3 - Criando relatório de contatos telefônicos

SELECT 
    C.MATRICULA AS "MATRICULA", 
    T.NUMERO AS "TELEFONE" 
FROM 
    BRH.COLABORADOR C
INNER JOIN
    BRH.TELEFONE_COLABORADOR T
    ON
    C.MATRICULA = T.COLABORADOR
WHERE
    T.TIPO = 'M' OR
    T.TIPO = 'C'
ORDER BY
    MATRICULA, TELEFONE;



--TAREFA 4 - Listando colaborador com maior salário

SELECT
    NOME AS COLABORADOR,
    SALARIO
FROM
    BRH.COLABORADOR
WHERE
    SAlARIO = (SELECT MAX(SALARIO) FROM BRH.COLABORADOR);


--TAREFA 5 - Criando relatório de senioridade

SELECT
    MATRICULA,
    NOME AS COLABORADOR,
    SALARIO AS SALÁRIO,
    CASE 
        WHEN SALARIO <= 3000 THEN 'JUNIOR'
        WHEN SALARIO BETWEEN 3000.01 AND 6000 THEN 'PLENO'
        WHEN SALARIO BETWEEN 6000.01 AND 20000 THEN 'S�NIOR'
        ELSE 'CORPO DIRETOR'
    END AS SENIORIDADE  
FROM
    BRH.COLABORADOR
ORDER BY SENIORIDADE, NOME;



--TAREFA 6 - Criando lista de colaboradores com mais dependentes

SELECT 
    C.NOME,
    COUNT(*) AS "QUANTIDADE DE DEPENDENTES"
FROM
    BRH.DEPENDENTE D
INNER JOIN
    BRH.COLABORADOR C ON D.COLABORADOR = C.MATRICULA
GROUP BY 
    C.NOME
HAVING (COUNT(*)) >= 2
ORDER BY
   "QUANTIDADE DE DEPENDENTES" DESC, C.NOME;


--TAREFA 7 - Criando relatório de dependentes menores de idade

SELECT 
    COLABORADOR AS "MATRICULA DO COLABORADOR",
    NOME AS "NOME DO DEPENDENTE",
    TRUNC((MONTHS_BETWEEN(SYSDATE, DATA_NASCIMENTO))/12) AS IDADE
FROM 
    BRH.DEPENDENTE
WHERE
    TRUNC((MONTHS_BETWEEN(SYSDATE, DATA_NASCIMENTO))/12) < 18;

