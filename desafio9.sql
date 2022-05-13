SELECT COUNT(h.musica_idh) AS "quantidade_musicas_no_historico"
FROM SpotifyClone.historico_reproducoes AS h
INNER JOIN SpotifyClone.usuario AS u 
ON h.usuario_idh = u.usuario_id
WHERE u.usuario_name = "Bill";