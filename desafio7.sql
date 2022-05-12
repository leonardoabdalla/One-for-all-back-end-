SELECT art.artista_name AS "artista", alb.album_name AS "album", COUNT(sa.seguidor_ida) AS seguidores
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON art.artista_id = alb.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS sa
ON art.artista_id = sa.seguido_ida
GROUP BY art.artista_name, alb.album_name
ORDER BY seguidores DESC, artista ASC, album ASC;