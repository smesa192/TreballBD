![Introducció](/treball_bd.png)

**Dia 1:**
Vam fer una reunió per repartir-nos les tasques al trello.
Com que el primer dia no teníem molt de temps, vam decidir que el millor que podíem fer era aprendre com funcionava Github.
<br>
Vam repartir la feina analitzant les qualitats de cadascun dels companys:
<br>
- En Sergi, l'Andreu i l'Alex es van enfocar més en el tema relacionat amb la programació.
- En Dennis i en Pau van començar preparant les consultes.
  
<br>

Òbviament vam repartir les tasques de forma equivocada, després veurem el perquè.

<br>

# Primera part.
1. En Sergi va descarregar la base de dades des del GitHub del Robert (model relacional) i la va exportar a codi sql.
2. Vam decidir compartir una carpeta a google drive on pujaríem les nostres parts de la feina.
3. En Sergi va compartir el codi de la base de dades perquè Dennis i Pau poguessin treballar a les seves consultes. Només tenen de guia els noms dels camps, aquestes consultes seran executades després quan es completin les importacions.
4. Creació de repositori compartit a GitHub.
5. Creació de l'arxiu README.md en el repositori de GitHub.

<br>

<br>

<br>

<br>

# Segona part
Mentre Pau i Dennis treballaven a les seves consultes i mentre l' Alex i Sergi es dedicaven a entendre com funcionen les importacions, l'Andreu es va dedicar a crear un document markdown sobre la sintaxi de markdown, perquè quan un company hagi de passar la seva part del treball a markdwon, pugui fer-ho sense problema.

<br>

## Sintaxis del lenguaje Markdown.
>Trabajo realizado por Andreu.

<br>

### Encabezados: 
<p>Se indican con almohadillas (#) al principio de la línea.</p>
<p>El número de almohadillas indica el nivel del encabezado, hasta 6.</p> 
<p>Ejemplo sin aplicar Markdown:</p> 
<p># Encabezado 1.</p>
<p>## Encabezado 2.</p>
Ejemplo: El titulo sintaxis del lenguaje Markdown tiene un hastag delante.

<br>

### Citas:
Con el mayor que (>) al principio de la linea. <br>
Ejemplo:
> Esto es una cita.

<br>

### Listas desordenadas:
Guión al principio de linea, ejemplo sin markdown:
```markdown
- Elemento 1
- Elemento 2
- Elemento 3
```
Ejemplo con markdown (mismo código que arriba):
- Elemento 1
- Elemento 2
- Elemento 3

<br>

### Listas ordenadas:
Con números al principio de la línea, ejemplo:
1. Elemento 1
2. Elemento 2
3. Elemento 3

<br>

### Separación (línea recta):
___ 
`tres guiones bajos ___.`

<br>

### Negrita:
`**Dos asteriscos al principio y al final de la palabra o frase.**` <br>
**Esto está escrito en negrita.**

<br>

### Cursiva:
`*Con un solo asterisco al principio y al final de la palabra o frase.*` <br>
*Esto está escrito en cursiva.*

<br>

### En cursiva y negrita:
`***Con tres asteriscos al principio y al final de la palabra o frase.***` <br>
***Esto está escrito en cursiva y en negrita.***

<br>

### Crear enlaces:
`[El nombre que quieres ponerle al enlace] (el enlace”Aquí entre comillas si quieres ponerle title al enlace”).` <br>
[Nombre del enlace](https://github.com/smesa192/TreballBD "Treball grupal")

En el caso de que quieras poner una URL <br>
`<Entre mayor y menor que ponemos la URL>` <br>
<https://github.com/smesa192/TreballBD>

### Imágenes:
Exactamente igual que enlaces pero con signo de exclamación delante del corchete. 
**![]().**
![Ejemplo de imagen](https://static.wikia.nocookie.net/television/images/e/e8/Bob_Esponja_%28personaje%29.png/revision/latest?cb=20140310144807&path-prefix=es)

<br>

### Código
Para escribir código tenemos que encerrar lo que queremos con tres acentos abiertos. <br> 
\`\`\` Lenguaje de programación
codigo que queremos poner. <br> Código que queremos mostrar
\`\`\` <br>
Ejemplo con python:
```python
i=0
paraula=input("Paraula: ").lower()

while paraula!="fi":
    Lparaula=len(paraula)
    print(f"La seva longitud es de {Lparaula} lletres.")
    i+=Lparaula
    paraula=input("Paraula: ").lower()
print(f"Total de lletres contades: {i}")
``` 

Si queremos ponerlo en medio de una frase \`lo ponemos en medio de dos acentos abierto \` <br>
`Esto es una linea de código`
<br>

### Saltos de linea.
Si queremos que el texto este con saltos de línea podemos usar la etiqueta `br` o separar por etiquetas `<p></p>` igual que en html.

<br>

<br>

<br>

<br>

# Tercera part.

Abans d'executar les importacions, fam fer una serie de canvis en el script original, creant un segon script amb totes les modificacions anomenat: BD_eleccions_v2.sql

<br>

A continuació l'ordre de les modificacions amb els companys que han participat:

1. Modificació de la taula municipis: **Andreu**
2. Modificació de la taula persones i candidats: **Sergi**
3. Modificació de la taula eleccions_municipis: **Dennis**

***Deixem el script en .sql al repositori de GitHub.***

```sql
-- Modificació de la taula municipis
ALTER TABLE municipis
	MODIFY codi_ine CHAR(5) NOT NULL;
ALTER TABLE municipis
	DROP INDEX `uk_municipis_codi_ine`,
    ADD UNIQUE INDEX `uk_municipis_codi_ine` (`codi_ine` ASC,`districte` ASC) VISIBLE;
    
    
-- Modificació de la taula persones i candidats.
ALTER TABLE candidats 
	DROP CONSTRAINT fk_candidats_persones1;
ALTER TABLE persones
	MODIFY COLUMN persona_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	MODIFY COLUMN dni CHAR(10) DEFAULT NULL;
ALTER TABLE candidats 
	ADD   CONSTRAINT `fk_candidats_persones1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `grup1eleccions`.`persones` (`persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE persones 
	DROP INDEX `uk_candidats_dni`;
    
-- Modificació taula eleccions_municipis
ALTER TABLE eleccions_municipis
	MODIFY COLUMN vots_valids INT UNSIGNED GENERATED ALWAYS AS (vots_candidatures+vots_nuls) STORED,
    MODIFY COLUMN vots_emesos INT UNSIGNED GENERATED ALWAYS AS (vots_candidatures+vots_blanc+vots_nuls) STORED;

```
<br>

<br>

<br>

<br>

# Quarta part.

- L'Andreu va crear un txt compartit amb l'ordre que hi ha que seguir a l'hora d'executar les importacions.
- En Dennis va fer la importació de la taula d'eleccions directament al workbench.
- L'Alex, en Dennis, en Sergi i l'Andreu van realitzar totes les importacions que es demanaven. 
- L'Alex va intentar importar al principi, però no va aconseguir entendre del tot el funcionament i es va possar a entendre el funcionament de la llei d'hont. Encara i així es mereix estar en aquesta part perque va treballar.
- Una vegada vam tenir totes importacions fetes i comprovant que funcionen correctament, en Sergi les va afegir totes en el mateix script.

<br>

A continuació l'ordre d'importacions amb els companys que han participat:

1. Importació de dades a la taula d'eleccions: **Dennis** 
2. Importació de dades a la taula de Comunitats Autonomes: **Sergi, Andreu i Dennis**
3. Importacio de dades a la taula de Provincies: **Sergi, Andreu i Dennis**
4. Importacio de dades a la taula de municipis: **Sergi, Andreu i Dennis**
5. Importacio de dades a la taula de Persones: **Sergi, Andreu i Dennis**
6. Importacio de dades a la taula de candidatures: **Sergi i Andreu**
7. Importacio de dades a la taula de candidats: **Sergi i Andreu**
8. Importacio de dades a la taula d'eleccions_municipis:**Dennis**
9. Importació de vots a nivell municipal: **Sergi i Andreu**
10. Importació de vots a nivell provincial: **Sergi i Andreu**
11. Importació de vots a nivell autonòmic: **Sergi i Andreu**
       
<br>
<br>


## Insert eleccions

> Traball realitzat per Dennis

```
INSERT INTO eleccions (nom,data)
	VALUE ('Elecció Cortes Generales 1977','1977-06-15'),
		('Elecció Parcial Senado 1978','1978-05-15'),
        ('Elecció Cortes Generales 1979','1979-03-01'),
        ('Elecció Parcial Senado 1980','1980-11-27'),
        ('Elecció Cortes Generales 1982','1982-10-28'),
        ('Elecció Parcial Senado 1983','1983-05-08'),
        ('Elecció Cortes Generales 1986','1986-06-22'),
        ('Elecció Cortes Generales 1989','1989-10-29'),
        ('Elecció Cortes Generales 1989','1990-03-25'),
        ('Elecció Cortes Generales 1989','1990-10-07'),
        ('Elecció Cortes Generales 1993','1993-06-06'),
        ('Elecció Cortes Generales 1996','1996-03-03'),
        ('Elecció Cortes Generales 2000','2000-03-12'),
        ('Elecció Cortes Generales 2004','2004-03-14'),
        ('Elecció Cortes Generales 2008','2008-03-09'),
        ('Elecció Cortes Generales 2011','2011-11-20'),
        ('Elecció Cortes Generales 2015','2015-12-20'),
        ('Elecció Cortes Generales 2016','2016-06-26'),
        ('Elecció Cortes Generales abril 2019','2019-04-28'),
        ('Elecció Cortes Generales novembre 2019','2019-11-10');
```
## Importacions amb python

> Importacions realitzades per Sergi, Dennis i Andreu

> Script complet d'importacions realitzat per Sergi

Per començar s'han de importar les llibreries de "mysql.connector" i la de "sys".

``` Python
import mysql.connector
import sys
```

A la connexió s'ha de posar la IP del servidor on s'allotja la base de dades, el usuari i password del usuari mysql, i la base de dades sobre la que es vol treballar.
``` Python
cnx = mysql.connector.connect(host='192.168.56.103',user='perepi',password='pastanaga', database='mydb')
```

Per últim es posa el codi fent els inserts segons les dades dels arxius .DAT.

``` Python
def importacioCA():
    #Primer es fa una variable que tingui la ruta relativa al arxiu que es vol llegir
    pathFitxer="07021911.DAT"
    #Amb el "try, except" es prova d'obrir el fitxer, i si no ho pot obrir imprimeix un missatge d'error
    try:

        with open(pathFitxer, "r") as fitxer:
            #Amb el bucle es mira cada línia del fitxer
            for linia in fitxer:
                if linia[11:13] == "99":
                    if linia[9:11] !="99":
                        # Selecció de variables a importar
                        codi_ine=linia[9:11]
                        nom=" ".join(linia[14:64].split())
                        #Sentència INSERT amb les variables
                        insertar=("INSERT INTO comunitats_autonomes (nom,codi_ine) VALUES (%s,%s);")
                        # Cada %s equival a una variable,la variable "dades" s'utilitza per unir els %s amb els valors.
                        dades=(nom,codi_ine)
                        #Execució de la sentència INSERT amb les dades recollides
                        cursor.execute(insertar,dades)

                
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    
    
def importacioProv():
    pathFitxer="07021911.DAT"
    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                # Selección de variables a importar
                if linia[11:13] !="99":               
                    nom=" ".join(linia[14:64].split())
                    codi_ine=linia[11:13]
                    num_escons=linia[149:155]
                    insertar=(f"INSERT INTO provincies (comunitat_aut_id,nom,codi_ine,num_escons) VALUES ((SELECT comunitat_aut_id FROM comunitats_autonomes WHERE codi_ine = {linia[9:11]}),%s,%s,%s);")
                    # Cada %s equival a una variable
                    dades=(nom,codi_ine,num_escons)
                    cursor.execute(insertar,dades)

                
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    
    

def importacioMun():
    pathFitxer="05021911.DAT"

    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                # Selección de variables a importar
                nom=linia[18:118].strip()
                codi_ine=linia[11:16]
                districte=linia[16:18]
                insertar=(f"INSERT INTO municipis (nom,codi_ine,provincia_id,districte) VALUES (%s,%s,(SELECT provincia_id FROM provincies WHERE codi_ine = {linia[11:13]}),%s);")
                # Cada %s equival a una variable
                dades=(nom,codi_ine,districte)
                cursor.execute(insertar,dades)

                
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    
    
 
def importacioPersones():
    pathFitxer="04021911.DAT"

    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                # Selección de variables a importar
                nom=linia[25:50].strip()
                cog1=linia[50:75].strip()
                cog2=linia[75:100].strip()
                sexo=linia[100:101]
                insertar=(f"INSERT INTO persones (nom,cog1,cog2,sexe) VALUES (%s,%s,%s,%s);")
                # Cada %s equival a una variable
                dades=(nom,cog1,cog2,sexo)
                cursor.execute(insertar,dades)

                
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    

def importacioCandidatures():
    pathFitxer="03021911.DAT"

    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                # Selección de variables a importar
                eleccio_id=linia[0:2]
                codi_candidatura=linia[8:14]
                nom_curt=linia[14:64]
                nom_llarg=linia[64:214]
                codi_acumulacio_provincia=linia[214:220]
                codi_acumulacio_ca=linia[220:226]
                codi_acumulario_nacional=linia[226:232]
                insertar=("INSERT INTO candidatures (eleccio_id,codi_candidatura,nom_curt,nom_llarg,codi_acumulacio_provincia,codi_acumulacio_ca,codi_acumulario_nacional) VALUES (%s,%s,%s,%s,%s,%s,%s);")
                # Cada %s equival a una variable
                dades=(eleccio_id,codi_candidatura,nom_curt,nom_llarg,codi_acumulacio_provincia,codi_acumulacio_ca,codi_acumulario_nacional)
                cursor.execute(insertar,dades)
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    

def importacioCandidats():
    pathFitxer="04021911.DAT"

    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                # Selección de variables a importar
                nom=linia[25:50].strip()
                cog1=linia[50:75].strip()
                cog2=linia[75:100].strip()
                NCC=nom+cog1+cog2
                codi_ine=linia[9:11]
                num_ordre=linia[21:24]
                tipus=linia[24]
                insertar="INSERT INTO candidats (candidatura_id,persona_id,provincia_id,num_ordre,tipus) VALUES ((SELECT candidatura_id FROM candidatures WHERE codi_candidatura = %s),(SELECT persona_id FROM persones WHERE CONCAT(nom,cog1,cog2) = %s LIMIT 1) ,(SELECT provincia_id FROM provincies WHERE codi_ine = %s),%s,%s);"
                # Cada %s equival a una variable
                dades=(linia[15:21], NCC, codi_ine, num_ordre, tipus)
                cursor.execute(insertar,dades)

                
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    

def importacioElecMun():
    pathFitxer="05021911.DAT"

    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                # Selección de variables a importar
                if linia[16:18] =="99":
                    eleccio_id = cursor.execute(f"SELECT eleccio_id FROM eleccions WHERE any = {int(linia[2:6])} AND mes = {int(linia[6:8])}")
                    eleccio_id = cursor.fetchone() #devuelve los valores en formato de lista
                    municipi_id = cursor.execute(f"SELECT municipi_id FROM municipis WHERE (codi_ine = '{linia[11:16]}') AND (provincia_id = (SELECT provincia_id FROM provincies WHERE codi_ine = '{linia[11:13]}'))")
                    municipi_id = cursor.fetchone() #devuelve los valores en formato de lista
                    num_meses=linia[136:141]
                    cens=linia[149:157]
                    vots_candidatures = linia[205:213]
                    vots_blanc = linia[189:197]
                    vots_nuls = linia[197:205]
                    insertar=(f"INSERT INTO eleccions_municipis (eleccio_id,municipi_id,num_meses,cens,vots_candidatures,vots_blanc,vots_nuls) VALUES (%s,%s,%s,%s,%s,%s,%s);")
                    # Cada %s equival a una variable
                    dades=(eleccio_id[0],municipi_id[0],num_meses,cens,vots_candidatures,vots_blanc,vots_nuls)
                    cursor.execute(insertar,dades)

                
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    

def importacioVotsMun():
    pathFitxer="06021911.DAT"
    lista=list()
    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                # Selección de variables a importar
                vots=linia[22:30]
                insertar=("INSERT IGNORE INTO vots_candidatures_mun VALUES ((SELECT eleccio_id FROM eleccions WHERE any = %s AND mes = %s LIMIT 1),(SELECT municipi_id FROM municipis WHERE codi_ine = %s LIMIT 1),(SELECT candidatura_id FROM candidatures WHERE codi_candidatura = %s LIMIT 1),%s);")
                # Cada %s equival a una variable
                dades=(linia[2:6],linia[6:8],linia[9:14],linia[16:22],vots)
                valorsito=linia[9:14],linia[16:22]
                cursor.execute(insertar,dades)    
                lista.append(valorsito)
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    

def importacioVotsProv():
    pathFitxer="08021911.DAT"
    lista=list()
    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer:
                if linia[11:13] != '99':
                    # Selección de variables a importar
                    insertar=("INSERT INTO vots_candidatures_prov VALUES ((SELECT provincia_id FROM provincies WHERE codi_ine = %s),(SELECT candidatura_id FROM candidatures WHERE codi_candidatura = %s),%s,%s)")
                    # Cada %s equival a una variable
                    dades=(linia[11:13],linia[14:20],linia[20:28],linia[28:33])
                    valorsito=linia[9:14],linia[16:22]
                    cursor.execute(insertar,dades)    
                    lista.append(valorsito)
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    

def importacioVotsCA():
    pathFitxer="08021911.DAT"
    lista=list()
    try:

        with open(pathFitxer, "r") as fitxer:
            for linia in fitxer: #11 13 si 9 11 no
                if linia[9:11] != '99' and linia[11:13] == '99':
                    # Selección de variables a importar
                    insertar=("INSERT INTO vots_candidatures_ca VALUES ((SELECT comunitat_aut_id FROM comunitats_autonomes WHERE codi_ine = %s),(SELECT candidatura_id FROM candidatures WHERE codi_candidatura = %s),%s)")
                    # Cada %s equival a una variable
                    dades=(linia[9:11],linia[14:20],linia[20:28])
                    valorsito=linia[9:14],linia[16:22]
                    cursor.execute(insertar,dades)    
                    lista.append(valorsito)
    except OSError as e:
        print("No s'ha pogut obrir el fitxer " + pathFitxer)
    

importacioCA()
importacioProv()
importacioMun()
importacioPersones()
importacioCandidatures()
importacioCandidats()
importacioElecMun()
importacioVotsMun()
importacioVotsProv()
importacioVotsCA()
cnx.commit()
cursor.close()
cnx.close()

```
# Creareacio de sentencias SQL - Categoria 1

## 5 preguntes de consultes simples: inclou una sola taula, funcions, funcions d'agregat o grups.

> Treball realizat per Dennis

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

# Crear sentencias SQL - Categoria 3

## 5 preguntes fent ús de subconsultes.

> Treball realizat per Dennis

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
```
