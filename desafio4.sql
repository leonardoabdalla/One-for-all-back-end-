SELECT u.usuario_name AS usuario, 
IF(MAX(YEAR(h.data_reproducao)) = 2021, "Usuário ativo", "Usuário inativo") AS condicao_usuario
FROM SpotifyClone.historico_reproducoes AS h
INNER JOIN SpotifyClone.usuario AS u
ON h.usuario_idh = u.usuario_id
GROUP BY u.usuario_name
ORDER BY usuario;