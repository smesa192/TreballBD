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
En Dennis va fer la importació de la taula d'eleccions directament al workbench.



