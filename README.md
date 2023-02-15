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



