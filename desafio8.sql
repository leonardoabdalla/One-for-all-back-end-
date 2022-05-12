SELECT art.artista_name AS "artista", alb.album_name AS "album"
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb 
ON art.artista_id = alb.artista_id
WHERE art.artista_name = "Walter Phoenix"
ORDER BY alb.album_name ASC;