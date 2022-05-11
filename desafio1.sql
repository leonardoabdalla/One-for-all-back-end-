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
    artista_id INT NOT NULL,
    album_name VARCHAR(100) NOT NULL,
    ano_lancamento YEAR,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.musicas(
    musica_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    album_id INT NOT NULL,
    musica_name VARCHAR(100) NOT NULL,
    duracao_seg INT,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas(
    seguido_ida INT NOT NULL,
    seguidor_ida INT NOT NULL,
    CONSTRAINT PRIMARY KEY(seguido_ida, seguidor_ida),
    FOREIGN KEY (seguido_ida) REFERENCES artista (artista_id),
    FOREIGN KEY (seguidor_ida) REFERENCES usuario (usuario_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducoes(
    usuario_idh INT NOT NULL,
    musica_idh INT NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_idh, musica_idh),
    FOREIGN KEY (usuario_idh) REFERENCES usuario (usuario_id),
    FOREIGN KEY (musica_idh) REFERENCES musicas (musica_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plano (plano_name, plano_valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.usuario (plano_id, usuario_name, usuario_idade, data_assinatura)
VALUES
  (1, 'Thati', 23, '2019-10-20'),
  (2, 'Cintia', 35, '2017-12-30'),
  (3, 'Bill', 20, '2019-06-05'),
  (4, 'Roger', 45, '2020-05-13'),
  (4, 'Norman', 58, '2017-02-17'),
  (2, 'Patrick', 33, '2017-01-06'),
  (3, 'Vivian', 26, '2018-01-05'),
  (3, 'Carol', 19, '2018-02-14'),
  (2, 'Angelina', 42, '2018-04-29'),
  (2, 'Paul', 46, '2017-01-17');

INSERT INTO SpotifyClone.artista (artista_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.album (artista_id, album_name, ano_lancamento)
VALUES
  (1, 'Envious', '1990'),
  (1, 'Exuberant', '1993'),
  (2, 'Hallowed Steam', '1995'),
  (3, 'Incandescent', '1998'), 
  (4, 'Temporary Culture', '2001'),
  (4, 'Library of liberty', '2003'),
  (5, 'Chained Down', '2007'),
  (5, 'Cabinet of fools', '2012'),
  (5, 'No guarantees', '2015'),
  (6, 'Apparatus', '2015');

INSERT INTO SpotifyClone.musicas (album_id, musica_name, duracao_seg)
VALUES
  (1, 'Soul For Us', 200),
  (1, 'Reflections Of Magic', 163),
  (1, 'Dance With Her Own', 116),
  (2, 'Troubles Of My Inner Fire', 203),
  (2, 'Time Fireworks', 152),
  (3, 'Magic Circus', 105),
  (3, 'Honey, So Do I', 207),
  (3, "Sweetie, Let's Go Wild", 139),
  (3, 'She Knows', 244),
  (4, 'Fantasy For Me', 100),
  (4, 'Celebration Of More', 146),  
  (4, 'Rock His Everything', 223),  
  (4, 'Home Forever', 231),  
  (4, 'Diamond Power', 241),  
  (4, "Let's Be Silly", 132),  
  (5, 'Thang Of Thunder', 240),
  (5, 'Words Of Her Life', 185),  
  (5, 'Without My Streets', 176), 
  (6, 'Need Of The Evening', 190),  
  (6, 'History Of My Roses', 222),  
  (6, 'Without My Love', 111),  
  (6, 'Walking And Game', 123),  
  (6, 'Young And Father', 197),  
  (7, 'Finding My Traditions', 179),  
  (7, 'Walking And Man', 229),  
  (7, 'Hard And Time', 135),    
  (7, "Honey, I'm A Lone Wolf", 150), 
  (8, "She Thinks I Won't Stay Tonight", 166),
  (8, "He Heard You're Bad For Me", 154),    
  (8, "He Hopes We Can't Stay", 210),    
  (8, "I Know I Know", 117),
  (9, "He's Walking Away", 159),    
  (9, "He's Trouble", 138),    
  (9, "I Heard I Want To Bo Alone", 120),    
  (9, "I Ride Alone", 151),   
  (10, "Honey",79),
  (10, "You Cheated On Me", 95),
  (10, "Wouldn't It Be Nice", 213),
  (10, "Baby", 136),
  (10, "you Make Me Feel So..", 83);

INSERT INTO SpotifyClone.seguindo_artistas (seguidor_ida, seguido_ida)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

INSERT INTO SpotifyClone.historico_reproducoes (usuario_idh, musica_idh)
VALUES
  (1, 36),
  (1, 25),
  (1, 23),
  (1, 14),
  (1, 15),
  (2, 34),
  (2, 24),
  (2, 21),
  (2, 39),
  (3, 6),
  (3, 3),
  (3, 26),
  (4, 2),
  (4, 35),
  (4, 27),
  (5, 7),
  (5, 12),
  (5, 14),
  (5, 1),
  (6, 38),
  (6, 29),
  (6, 30),
  (6, 22),
  (7, 5),
  (7, 4),
  (7, 11),
  (8, 39),
  (8, 40),
  (8, 32),
  (8, 33),
  (9, 16),
  (9, 17),
  (9, 8),
  (9, 9),
  (10, 20),
  (10, 21),
  (10, 12),
  (10, 13);



