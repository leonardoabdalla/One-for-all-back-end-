SELECT m.musica_name AS "nome", COUNT(h.musica_idh) AS "reproducoes"
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico_reproducoes AS h 
ON m.musica_id = h.musica_idh
INNER JOIN SpotifyClone.usuario AS u
ON h.usuario_idh = u.usuario_id
INNER JOIN SpotifyClone.plano AS p
ON p.plano_id = u.plano_id
WHERE p.plano_name = "gratuito" or p.plano_name = "pessoal"
GROUP BY m.musica_name
ORDER BY nome ASC;