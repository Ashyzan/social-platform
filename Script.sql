USE social_platform_db;

#Seleziona gli utenti che hanno postato almeno un video 


# corretta
SELECT u.username , m.`type` , COUNT(m.`type`)
FROM users u 
JOIN medias m ON m.user_id = u.id 
WHERE m.`type` = "video"
GROUP BY u.username;



/*SELECT m.user_id AS "ID Utente", m.`type` AS "Tipo di media" , COUNT(user_id) AS "numero di post media"
FROM medias m 
WHERE `type` = "video"
AND `type` IS NOT NULL # non necessaria in quanto se esiste un id utente nella tabella media significa che l'utente ha fatto almeno un post media
GROUP BY m.user_id ;
#test count
/* SELECT u.username , m.`type`
FROM users u 
RIGHT JOIN medias m ON m.user_id = u.id 
WHERE m.`type` IS NULL
OR m.`type` = "photo"
GROUP BY u.username , m.`type` ;

SELECT COUNT(*)
FROM medias m2 
WHERE m2.`type` IS NULL ;

SELECT COUNT(*)
FROM medias m 
WHERE m.`type` = "photo";

SELECT COUNT(*)
FROM medias m 
WHERE m.`type` = "video";

SELECT DISTINCT m.user_id 
FROM medias m 
WHERE m.`type` = "video"; */

#Seleziona tutti i post senza Like (13) - OK
SELECT p.id AS "id post", l.post_id AS "Like"
FROM likes l 
RIGHT JOIN posts p ON l.post_id = p.id 
WHERE l.post_id IS NULL
GROUP BY p.id, l.post_id;


#Conta il numero di like per ogni post (165)
SELECT  p.id AS "id del post",  p.title AS "Titolo Post", COUNT(l.post_id) AS "Numero di like"
FROM likes l 
JOIN posts p ON l.post_id = p.id
GROUP BY p.id ;


#Ordina gli utenti per il numero di media caricati (25) - OK
SELECT u.username as "Utente",  COUNT(m.id) AS "Numero media caricati"
FROM medias m
JOIN users u ON m.user_id = u.id 
GROUP BY u.username
ORDER BY COUNT(m.id) DESC;

#Ordina gli utenti per totale di likes ricevuti nei loro posts (25) 
SELECT u.username as "Utente",  COUNT(l.post_id) AS "Likes"
FROM users u 
JOIN posts p ON p.user_id = u.id
JOIN likes l ON l.user_id = u.id 
GROUP BY u.username 
ORDER BY COUNT(l.post_id) DESC;


#####
SELECT DISTINCT p.id , p.title, p.tags 
FROM posts p ;
