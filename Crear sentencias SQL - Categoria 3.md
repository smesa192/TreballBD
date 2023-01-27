# Crear sentencias SQL - Categoria 3

## 5 preguntes fent ús de subconsultes.

> Trabajo realizado por Dennis

### Consulta per saber el municipi que te mes vots valids.
 ```
SELECT m.nom, em.vots_valids
	FROM municipis m
    INNER JOIN eleccions_municipis em ON m.municipi_id = em.municipi_id
WHERE em.vots_valids = (SELECT MAX(vots_valids) 
	FROM eleccions_municipis);
```

### Consulta per saber el nom complet dels candidats que han participat en alguna de les eleccions anteriors.
```
SELECT CONCAT(p.nom,' ',p.cog1,' ',p.cog2) AS nom_complet
	FROM persones p
    INNER JOIN candidats c1 ON p.persona_id = c1.persona_id
    INNER JOIN candidatures c2 ON c1.candidatura_id = c2.candidatura_id
WHERE c2.eleccio_id = ANY (SELECT eleccio_id
FROM eleccions);
```
### Consulta per saber el nom i el codi ine del municipi amb menys escons.
```
SELECT m.nom, m.codi_ine
	FROM municipis m 
    INNER JOIN provincies p ON m.provincia_id = p.provincia_id
    INNER JOIN comunitats_autonomes ca ON p.comunitat_aut_id = ca.comunitat_aut_id
WHERE p.num_escons = (SELECT MIN(num_escons)
	FROM provincies);
```    
### Consulta per saber quina o quines eleccions san celebrat un dimecres.
```
SELECT nom, data
	FROM eleccions
WHERE WEEKDAY(data) = (SELECT WEEKDAY(data)
	FROM eleccions
WHERE WEEKDAY(data) = 2); 
```
### Consulta per saber el nom, cognom i numero d'orde dels candidats que son de Tarragona.
```
SELECT p.nom, p.cog1, c.num_ordre
	FROM persones p
    INNER JOIN candidats c ON p.persona_id = c.persona_id
WHERE c.provincia_id = (SELECT provincia_id
	FROM provincies
WHERE nom = 'Tarragona');    
