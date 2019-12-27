# Ejercicios para examen

## Ejercicio 1.
**Cifrado de Vigenère.**

El cifrado de Vigenère fue expuesto en el siglo XVI y fue considerado imposible de
romper hasta el siglo XX, a pesar de que hubo algunos criptoanalistas que lo rompieron
durante el siglo XVI, y fue resuelto definitivamente con el
método de Karsiski en el XIX.

El cifrado se basa en disfrazar la secuencia de letras del texto y evitar que una
aplicación de análisis de frecuencia descubra qué letra corresponde con cada letra
del texto real. La idea es que cada letra puede cifrarse como diferentes letras para
que no se pueda extraer por frecuencia.

La debilidad del cifrado es la propia repetición de la clave. Si un criptosistema
averigua la longitud de la clave, puede tratar el texto como un doble cifrado césar
y por tanto extraer el cifrado de forma sencilla, resolviendo los cifrados
césar de forma individual.

## Ejercicio 2.
**Explicar la transformación SubBytes() que es parte del algoritmo simétrico de
cifrado ** ***AES.***

La transformación es una sustitución no lineal de bytes que es independiente del
estado. La transformación cambia cada byte de s<sub>ij</sub> a s'<sub>ij</sub>.

Se utiliza una tabla de bytes asociados (S-box) que se construye como:
* Si el byte xy es distinto de 00, tomamos el inverso; en otro caso, se queda el mismo.
* Si b<sub>i</sub> es el i-ésimo bit del byte, b'<sub>i</sub> se calcula como

  b'<sub>i</sub>=b<sub>i</sub>+b<sub>i+4 mód8</sub>+b<sub>i+5 mód8</sub>+b<sub>i+6 mód8</sub>+b<sub>i+7 mód8</sub>+c<sub>i</sub>

  donde c<sub>i</sub> es el i-ésimo bit del byte {63}.

## Ejercicio 3.
**Limitaciones de los sistemas simétricos de cifrado en la comunicación y cómo la
criptografía de clave pública los ha resuelto.**

El problema de los sistemas de cifrado simétricos es que utilizan una única clave:
en el caso de que dicha clave se difunda, cualquiera podrá cifrar o descifrar mensajes.

La fortaleza del algoritmo reside en la propia clave, y en el caso de que esta sea
comprometida, el algoritmo deja de ser seguro.

Con los sistemas de clave asimétrica este problema se elimina: tenemos dos claves,
una privada, que solo tiene el usuario, y una pública que se puede enviar a cualquiera.
De esta forma, cualquiera puede cifrar un mensaje para el
destinatario, pero solo el
destinatario puede desencriptarla puesto que solo se puede con la clave privada, que
el usuario tiene guardada y no ha difundido.

## Ejercicio 4.
**Explicar los fundamentos de la criptografía de clave pública y las líneas fundamentales
de la firma a través de la misma.**

La criptografía de clave pública se creó para eliminar, o al menos reducir, los problemas
que conllevaba el uso de la criptografía de clave privada (no era tan seguro al fin y al cabo
puesto que si alguien conseguía la clave cualquiera podría cifrar o descifrar mensajes).

La criptografía de clave pública intenta satisfacer tres condiciones:
* Autenticación: el receptor es quien dice ser.
* Integridad: el mensaje no se ha modificado cuando llega al destino.
* No repudiabilidad: el emisor del mensaje no puede negar que es el autor que envió dicho mensaje.

Para ello se creó la criptografía de clave pública o asimétrica. Con esta no
se necesita intercambiar claves ya que cada usuario tiene una clave privada
(o de descifrado) que solo conoce él, y una pública (o de cifrado) que envia a
todo aquel que quiera mandarle un mensaje. El mensaje se cifra con la ṕublica y
nadie, salvo el usuario, con la llave privada, puede descifrarlo.

## Ejercicio 5.
**Enumerar resumidamente las precauciones más destacables a tomar al generar un
círculo de comunicación basado en ** ***RSA.***

1. El número *n* debe superar los 308 dígitos de longitud.
2. El número *n* debe tener dos factorios primos de valor alto.
3. Los factores de *n* no deben ser elegido sde una lista de primos famosos.
4. Los factores primos no deben ser cercanos el uno del otro.
5. Si los factores son *p* y *q*, (*p*-1, *q*-1) no deben ser demasiado elevados ni puede ocurrir que *p*-1|*q*-1.
6. Es preferible que los factores de phi(*n*) sean grandes.
7. Los dos factores primos deben ser primos seguros. Un primo es seguro cuando, dado un número *p*, *p* es primo y (*p*-1)/2 también es primo.
8. *n* debe ser alto y tanto *p*-1 como *q*-1 deben tener factores primos altos.
9. *d*= debe ser un úmero elevado (por eso es el que se elige para determinar *e*).
10. No es recomendable que *e* sea pequeño, y en caso de que lo sea, debe elegirlo una sola persona pues el Teorema Chino del Resto eliminaría la seguridad del círculo calculando *e*.
11. Evitar los mensajes inocultables, esto es, hay ciertos mensajes que el propio algoritmo *RSA* no puede cifrar.

## Ejercicio 6.
**Protocolo de intercambio de llaves según el esquema de Diffie-Hellman y explicación
de su supuesta fortaleza.**

## Ejercicio 7.
**Explicación del criptosistema de ElGamal.**

## Ejercicio 8.
**Explicación del algoritmo de firma estándar (** ***DSA*** **).**

## Ejercicio 9.
**Rasgos esenciales de ** ***SSH*** **: cifrado, funcionamiento, negociación de
cifrado para la sesión y autenticación del acceso del usuario al servidor.**
