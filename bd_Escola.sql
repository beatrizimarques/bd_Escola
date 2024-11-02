CREATE DATABASE db_Escola;
USE db_Escola;

CREATE TABLE tb_Aluno(
	pk_id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR (100),
	data_nasc_aluno DATE,
    cpf_aluno CHAR(11), 
    genero_aluno ENUM('f', 'm', 'o'),
    endereco_aluno VARCHAR(100),
    telefone_resp_aluno CHAR(13)
);

INSERT INTO tb_Aluno (nome_aluno, data_nasc_aluno, cpf_aluno,  genero_aluno, endereco_aluno, telefone_resp_aluno) values 
('João Silva', '2002-02-20', '35625621256', 'm', 'Rua Lua, 320', '5511965231024'),
('Maria Oliveira', '1998-05-15', '45678912345', 'f', 'Rua Sol, 123', '5511976584231'),
('Carlos Pereira', '1985-11-30', '67895432187', 'm', 'Avenida das Palmeiras, 789', '5511987456321'),
('Ana Souza', '2000-01-10', '78912345698', 'f', 'Rua das Flores, 456', '5511963215478'),
('Bruno Rocha', '1995-06-25', '98765412309', 'm', 'Travessa das Árvores, 852', '5511945698741'),
('Clara Melo', '2003-09-18', '12345678932', 'f', 'Rua das Pedras, 234', '5511964785123'),
('Rafael Lima', '1999-12-02', '32165498701', 'm', 'Avenida Brasil, 963', '5511978451269'),
('Paula Santos', '1988-03-22', '45612378956', 'f', 'Rua do Sol, 512', '5511998745123'),
('Diego Ferreira', '1990-07-14', '78945612336', 'm', 'Viela do Bosque, 120', '5511932147854'),
('Larissa Silva', '2001-04-09', '65478912305', 'f', 'Avenida Central, 305', '5511958741236');


DESCRIBE tb_Aluno;
SELECT*FROM tb_Aluno;

CREATE TABLE tb_Professor(
	pk_id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR (100),
	data_nasc_professor DATE,
    cpf_professor CHAR(11), 
    genero_professor ENUM('f', 'm', 'o'),
    endereco_professor VARCHAR(100),
    telefone_resp_professor CHAR(13)
);

INSERT INTO tb_Professor (nome_professor, data_nasc_professor, cpf_professor, genero_professor, endereco_professor, telefone_resp_professor) values 
('Debora Paixão', '2000-12-13', '98563214567', 'f', 'Rua Matos, 15', '5511945632157'),
('Eduardo Costa', '1997-08-19', '65432198745', 'm', 'Rua das Américas, 101', '5511986542314'),
('Fernanda Almeida', '2002-03-27', '32198765409', 'f', 'Avenida Atlântica, 402', '5511932148756'),
('Gabriel Martins', '1996-12-05', '98745632174', 'm', 'Rua do Sol, 258', '5511945236987'),
('Juliana Ramos', '2004-07-22', '12378945632', 'f', 'Travessa do Rio, 789', '5511965247891'),
('Thiago Cardoso', '1989-10-11', '78912365498', 'm', 'Avenida da Liberdade, 753', '5511987456213'),
('Patrícia Vieira', '1992-02-14', '32165478907', 'f', 'Rua Esperança, 234', '5511978523641'),
('André Silva', '2001-11-06', '45698712309', 'm', 'Avenida Independência, 456', '5511956341278'),
('Beatriz Monteiro', '1998-04-17', '78945632185', 'f', 'Rua Primavera, 908', '5511945876321'),
('Felipe Duarte', '2000-09-09', '65412378954', 'm', 'Viela das Rosas, 307', '5511932547814');

/*inserir o campo estado civil e o campo nome da mãe*/
ALTER TABLE tb_Professor 
ADD COLUMN estado_civil_professor VARCHAR(50),
ADD COLUMN nome_mae_professor VARCHAR(50);

/*mudar o tamanho do campo cpf*/
ALTER TABLE tb_Professor
MODIFY COLUMN cpf_professor CHAR(12);

/*inserir + 3 registros*/
INSERT INTO tb_Professor (nome_professor, data_nasc_professor, cpf_professor, genero_professor, endereco_professor, telefone_resp_professor, estado_civil_professor, nome_mae_professor, formacao_professor) values
('Juliana Costa', '1985-03-15', '12345678901', 'f', 'Rua das Flores, 45', '5511987654321', 'casada', 'Ana Costa', 'Pedagogia'),
('Roberto Almeida', '1990-07-25', '23456789012', 'm', 'Avenida Brasil, 1234', '5511976543210', 'solteiro', 'Maria Almeida', 'Matemática'),
('Fernanda Lima', '1978-11-05', '34567890123', 'f', 'Rua do Sol, 67', '5511965432109', 'divorciada', 'Clara Lima', 'História'),
('Carlos Pereira', '1983-09-30', '45678901234', 'm', 'Rua da Paz, 89', '5511954321098', 'casado', 'Júlia Pereira', 'Física');

/*inserir o campo e-mail na tabela e colocar a frase "solicitação em andamento" nesse campo, em todos os registros*/
ALTER TABLE tb_Professor 
ADD COLUMN email_professor VARCHAR(50);
UPDATE tb_Professor 
SET email_professor = 'solicitação em andamento';

/*Trocar o tipo do campo estado civil para char(10)*/
ALTER TABLE tb_Professor
MODIFY COLUMN estado_civil_professor CHAR(10);

/*Inserir o campo formacao_prof varchar(50)*/
ALTER TABLE tb_Professor
ADD COLUMN formacao_professor varchar(50);

/*deletar a coluna cidade*/
ALTER TABLE tb_Professor
ADD COLUMN cidade_professor varchar(50);
ALTER TABLE tb_Professor 
DROP COLUMN cidade_professor;

/*inserindo novos atributos*/
INSERT INTO tb_Professor (estado_civil_professor, nome_mae_professor, disciplina_professor) values
('casado', 'Maria Oliveira', 'Matemática'),
('solteiro', 'Ana Santos', 'Português'),
('divorciado', 'Cláudia Ferreira', 'História'),
('casado', 'Patrícia Lima', 'Física'),
('solteiro', 'Renata Costa', 'Química'),
('casado', 'Juliana Rocha', 'Geografia'),
('divorciado', 'Sandra Nunes', 'Educação Física'),
('casado', 'Laura Almeida', 'Artes'),
('solteiro', 'Mariana Martins', 'Inglês'),
('divorciado', 'Isabel Ribeiro', 'Biologia');

/*alterar o valor da disciplina 5 últimos registros*/
ALTER TABLE tb_Professor
ADD COLUMN disciplina_professor varchar(50);
UPDATE tb_Professor
SET disciplina_professor = CASE 
    WHEN pk_id_professor = 1 THEN 'Matemática'
    WHEN pk_id_professor = 2 THEN 'Física'
    WHEN pk_id_professor = 3 THEN 'Química'
    WHEN pk_id_professor = 4 THEN 'História'
    WHEN pk_id_professor = 5 THEN 'Biologia'
END
WHERE pk_id_professor IN (1, 2, 3, 4, 5);

/*deletar os registros 7, 10 e 12*/
SELECT * FROM tb_Professor
WHERE pk_id_professor IN (7, 10, 12);
DELETE FROM tb_Professor
WHERE pk_id_professor IN (7, 10, 12);

/*Não esquecer start transaction, Rollback e o commit.*/


DESCRIBE tb_Professor;
SELECT*FROM tb_Professor;

CREATE TABLE tb_Aula(
	pk_id_aula INT AUTO_INCREMENT PRIMARY KEY,
    horario_aula TIME,
    data_aula DATE,
	sala_aula VARCHAR(50),
    andar_sala VARCHAR(50),
    equipamentos_aula VARCHAR(30)
);

INSERT INTO tb_Aula (horario_aula, data_aula, sala_aula, andar_sala, equipamentos_aula) values 
('15:30:00', '2023-09-15', 'sala 13', '3 andar', '25 equipamentos'),
('08:00:00', '2023-08-10', 'sala 5', '2 andar', '30 equipamentos'),
('10:15:00', '2023-10-22', 'sala 8', '1 andar', '20 equipamentos'),
('11:45:00', '2023-09-11', 'sala 12', '3 andar', '15 equipamentos'),
('13:30:00', '2023-07-18', 'sala 3', 'térreo', '10 equipamentos'),
('15:00:00', '2023-06-27', 'sala 6', '1 andar', '12 equipamentos'),
('16:45:00', '2023-11-05', 'sala 9', '2 andar', '18 equipamentos'),
('18:00:00', '2023-05-19', 'sala 11', '4 andar', '22 equipamentos'),
('09:30:00', '2023-12-01', 'sala 10', '3 andar', '28 equipamentos'),
('14:00:00', '2023-03-23', 'sala 4', 'térreo', '30 equipamentos');

DESCRIBE tb_Aula;
SELECT*FROM tb_Aula;

