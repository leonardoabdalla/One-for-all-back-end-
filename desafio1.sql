DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
    plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    plano_name VARCHAR(100) NOT NULL,
    plano_valor DOUBLE NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.usuario(
    usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    plano_id INT NOT NULL,
    usuario_name VARCHAR(100) NOT NULL,
    usuario_idade INT,
    data_assinatura DATE,
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.artista(
    artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artista_name VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    ano_lancamento YEAR
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.musicas(
    musica_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    musica_name VARCHAR(100) NOT NULL,
    duracao_seg INT,
    FOREIGN KEY (album_id) REFERENCES album (album_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas(
    seguido_id INT NOT NULL,
    seguidor_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(seguido_id, seguidor_id),
    FOREIGN KEY (seguido_id) REFERENCES artista (artista_id),
    FOREIGN KEY (seguidor_id) REFERENCES usuario (usuario_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducoes(
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id, musica_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
    FOREIGN KEY (musica_id) REFERENCES musicas (musica_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.usuario (usuario_name, usuario_idade, data_assinatura)
VALUES
  ('Thati', '23', '2019-10-20'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados X'),
  ('exemplo de dados 2', 'exemplo de dados Y');