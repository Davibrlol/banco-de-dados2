
CREATE TABLE matricula (
Cod_turma int,
cod_usuario int,
dt_inicio date,
dt_fim date
);

CREATE TABLE leciona (
cod_curso int,
cod_materia int,
dt_fim date,
dt_inicio date,
cod_leciona int PRIMARY KEY
);

CREATE TABLE curso (
cod_curso int PRIMARY KEY,
ch_curso time,
nome_curso varchar(100)
);

CREATE TABLE turma (
dt_inicio date,
Cod_turma int PRIMARY KEY,
dt_fim date,
descricao_turma char(240),
cod_curso int,
FOREIGN KEY(cod_curso) REFERENCES curso (cod_curso)
);

CREATE TABLE materia (
descricao_materia char(240),
cod_materia int PRIMARY KEY,
ch_materia time
);

CREATE TABLE registro_aula (
cod_leciona int,
descricao_turma char(240),
cod_registro int PRIMARY KEY,
dt_aula datetime,
descricao_aula char(240),
FOREIGN KEY(cod_leciona) REFERENCES leciona (cod_leciona),
FOREIGN KEY(descricao_turma) REFERENCES turma (Cod_turma)
);

CREATE TABLE usuario (
cod_usuario int PRIMARY KEY,
login_usuario char(50),
senha_usuario char(50),
cpf int,
nome_usuario char(80),
cod_tipousuario int
);

CREATE TABLE tipo_usuario (
descricao_tipo char(240),
cod_tipousuario int PRIMARY KEY
);

ALTER TABLE matricula ADD FOREIGN KEY(Cod_turma) REFERENCES turma (Cod_turma);
ALTER TABLE matricula ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE leciona ADD FOREIGN KEY(cod_curso) REFERENCES curso (cod_curso);
ALTER TABLE leciona ADD FOREIGN KEY(cod_materia) REFERENCES materia (cod_materia);
ALTER TABLE usuario ADD FOREIGN KEY(cod_tipousuario) REFERENCES tipo_usuario (cod_tipousuario);
