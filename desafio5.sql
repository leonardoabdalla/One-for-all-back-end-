SELECT m.musica_name AS cancao, COUNT(h.musica_idh) AS reproducoes
FROM SpotifyClone.historico_reproducoes AS h
INNER JOIN SpotifyClone.musicas AS m
ON m.musica_id = h.musica_idh
GROUP BY m.musica_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;