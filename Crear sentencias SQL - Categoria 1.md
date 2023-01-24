# Crear sentencias SQL - Categoria 1

## 5 preguntes de consultes simples: inclou una sola taula, funcions, funcions d'agregat o grups.

> Trabajo realizado por Dennis

### Consulta per saber les eleccions que san celebrat entre dues dates ordenades per el any mes gran.
```
SELECT nom
	FROM eleccions
WHERE any BETWEEN 1970 AND 2001
ORDER BY any DESC;
```
### Consulta que ens mostra el nom_curt i el nom_llarg de cada candidatura concatenat i seprarat mab un '.'.
```
SELECT CONCAT(nom_curt,'.',nom_llarg) AS nom_candidatura
	FROM candidatures
ORDER BY nom_candidatura;
```
### Consulta per saber quants vots valids tenim per cada eleccio i municipi.
```
SELECT vots_valids, COUNT(*) AS quants
	FROM eleccions_municipis
GROUP BY eleccio_id,municipi_id;
```
### Consulta per saber quans anys an pasat desde que es va fer cada eleccio, ordenat per anys_pasat de manera ascedent.
```
SELECT nom, TIMESTAMPDIFF(YEAR, data, CURRENT_DATE()) AS anys_pasat
	FROM eleccions
ORDER BY anys_pasat ASC;
```
### Consulta per saber tots els candidats del menys importatnts al mes important.
```
SELECT num_ordre, tipus
	FROM candidats
WHERE tipus = 'T'
ORDER BY num_ordre DESC;
```
