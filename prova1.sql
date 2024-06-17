CREATE SCHEMA `p1` ;

use p1;

CREATE TABLE `p1`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_aluno`));

CREATE TABLE `p1`.`disciplina` (
  `id_disciplina` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `resumo` VARCHAR(45) NULL,
  `carga_horaria` TIME NOT NULL,
  PRIMARY KEY (`id_disciplina`));

CREATE TABLE `p1`.`professor` (
  `id_prof` INT NOT NULL AUTO_INCREMENT,
  `nome_prof` VARCHAR(45) NOT NULL,
  `materia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_prof`));

CREATE TABLE `p1`.`turma` (
  `id_turma` INT NOT NULL AUTO_INCREMENT,
  `sala` VARCHAR(45) NOT NULL,
  `turno` VARCHAR(45) NOT NULL,
  `data` VARCHAR(45) NOT NULL,
  `disciplina_id` INT NOT NULL,
  `prof_id` INT NOT NULL,
  PRIMARY KEY (`id_turma`));

CREATE TABLE `p1`.`matricula` (
  `aluno_id` INT NOT NULL,
  `turma_id` INT NOT NULL,
  `nota_1` FLOAT NOT NULL,
  `nota_2` FLOAT NOT NULL,
  `nota_final` FLOAT NOT NULL,
  PRIMARY KEY (`aluno_id`));

ALTER TABLE turma ADD CONSTRAINT fk_turma_disciplina FOREIGN KEY (disciplina_id) REFERENCES disciplina(id_disciplina);
ALTER TABLE turma ADD CONSTRAINT fk_turma_professor FOREIGN KEY (prof_id) REFERENCES professor(id_prof);
ALTER TABLE matricula ADD CONSTRAINT fk_matricula_aluno FOREIGN KEY (aluno_id) REFERENCES aluno(id_aluno);
ALTER TABLE matricula ADD CONSTRAINT fk_matricula_turma FOREIGN KEY (turma_id) REFERENCES turma(id_turma);

INSERT INTO aluno VALUES (01, 'joao', 'ativo');
INSERT INTO aluno VALUES (02, 'maria', 'ativo');
INSERT INTO aluno VALUES (03, 'jose', 'ativo');
INSERT INTO aluno VALUES (04,'bruno', 'ativo');
INSERT INTO aluno VALUES (05, 'abel', 'inativo');

INSERT INTO disciplina VALUES (01, 'Banco de Dados','' ,'40:00:00');
INSERT INTO disciplina VALUES (02, 'Matematica Discreta','' ,'40:00:00');
INSERT INTO disciplina VALUES (03, 'PE','' ,'40:00:00');
INSERT INTO disciplina VALUES (04, 'POO','' ,'40:00:00');
INSERT INTO disciplina VALUES (05, 'Logica Matematica','' ,'40:00:00');

INSERT INTO professor VALUES (01, 'Dieguinho','Banco de Dados');
INSERT INTO professor VALUES (02, 'Cleto S2', 'Matematica Discreta');
INSERT INTO professor VALUES (03, 'joyce linda','PE');
INSERT INTO professor VALUES (04, 'Osman','POO');
INSERT INTO professor VALUES (05, 'Hercules','Logica Matematica');

INSERT INTO turma VALUES (01,'R01B', 'Matutino', 'segunda', 1, 1);
INSERT INTO turma VALUES (02,'M01', 'Matutino', 'terça', 2, 2);
INSERT INTO turma VALUES (03,'M02', 'Matutino', 'quarta', 3, 3);
INSERT INTO turma VALUES (04,'A13', 'Matutino', 'quinta', 4, 4);
INSERT INTO turma VALUES (05,'B06', 'Matutino', 'sexta', 5, 5);

INSERT INTO matricula VALUES (01, 1, 7.5, 6, 6.75);
INSERT INTO matricula VALUES (02, 2, 5, 6, 5.5);
INSERT INTO matricula VALUES (03, 3, 8.5, 6, 7.25);
INSERT INTO matricula VALUES (04, 4, 7, 6, 6.5);
INSERT INTO matricula VALUES (05, 5, 6, 6, 6);

select * from aluno;

select * from professor
where materia = 'Banco de Dados'
;

select nome 
from aluno
where nome like 'jo%'
;

select disciplina.nome, turma.sala, turma.turno
from disciplina, turma
where turma.disciplina_id = disciplina.id_disciplina
;

select disciplina.nome, turma.sala, turma.turno
from disciplina, turma
where id_disciplina = 1
	and turma.disciplina_id = 1
;

select aluno.nome, disciplina.nome, turma.sala, turma.turno, turma.data
from aluno,disciplina, turma
where id_disciplina = 1
	and turma.disciplina_id = 1
;

select professor.nome_prof, aluno.nome, disciplina.nome, turma.sala, turma.turno, turma.data
from professor, aluno,disciplina, turma
where id_disciplina = professor.id_prof
	and id_disciplina = turma.disciplina_id 
    and id_prof = 1
    limit 40
;
