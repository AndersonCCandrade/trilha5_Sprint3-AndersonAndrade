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



