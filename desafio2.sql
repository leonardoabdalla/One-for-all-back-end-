SELECT 
(SELECT COUNT(*) FROM SpotifyClone.musicas) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artista) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.album) AS albuns;