SELECT u.usuario_name AS usuario, COUNT(h.musica_idh) AS qtde_musicas_ouvidas, ROUND(SUM(c.duracao_seg) / 60, 2) AS total_minutos
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico_reproducoes AS h
ON u.usuario_id = h.usuario_idh
INNER JOIN SpotifyClone.musicas AS c
ON h.musica_idh = c.musica_id
GROUP BY u.usuario_name;