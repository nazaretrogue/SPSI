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
cifrado AES**.

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
círculo de comunicación basado en RSA.**

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

El algoritmo de Diffie-Hellman está pensado para intercambio de claves.
Se basa en la dificultad para calcular el logaritmo discreto en cuerpos con
cardinal alto. Los pasos son:

1. Los usuarios A y B eligen dos enteros elevados, *n* y *g* donde 1<*g*<*n*. Estos números no tienen por qué ser secretos.
2. A elige aleatoriamente un número *x* elevado y calcula X = *g*<sup>x</sup>mód *n*.
3. B elige aleatoriamente un número *y* elevado y calcula
Y = *g*<sup>y</sup>mód *n*.
4. A y B se intercambian los resultados sin desvelar los exponentes que ha utilizado cada uno.
5. A calcula *k* = Y<sup>x</sup>mód *n*.
6. B calcula *k'* = X<sup>y</sup>mód *n*.

De esta forma, *k* y *k'* son exactamente iguales y es la clave que comparten ambos usuarios
aunque ha sido generada independientemente uno del otro (*k* == *k'* == *g*<sup>xy</sup>mód *n*).
Si se quisiera conseguir dicha clave *k* sería necesario poder calcular el logaritmo
discreto para extraer *x* e *y*. No obstante, no es fácil ni computacionalmente
viable calcular dicho logaritmo.

Es importante tener tres condiciones en cuenta a la hora de elegir *g* y *n*:

1. *n* debe ser un primo seguro, esto es, *n* es primo y (*n*-1)/2 debe ser primo.
2. El tamaño de *n* debe ser mayor de 512 bits (1024 incluso si es posible).
3. *g* es un elemento primitivo de *GF(n)* (un generador del grupo cíclico *GF(n)** ).

## Ejercicio 7.
**Explicación del criptosistema de ElGamal.**

El sistema criptográfico de ElGamal es un sistema de clave pública para generarl llaves que basa su seguridad en la 
dificultad del cálculo del logarimo discreto.

Actúa como sigue:

1. Se escoge un cuerpo finito con un cardinal muy elevado *GP(p)*, donde *p* es primo y *g* pertenece a *GF(p)** , preferiblemente *g* es un elemento primitivo. Además, suponemos que las unidades de texto plano estarán expresadas en números pertenecientes a *GF(p)*.
2. Cada usuario elige un *a* aleatorio tal que 0<*a*<*p*-1.
3. *a* será la llave privada (de descifrado) y *k*=*g*<sup>a</sup>mód *p* será la llave pública (de cifrado).

## Ejercicio 8.
**Explicación del algoritmo de firma estándar (DSA).**

La firma estándar fue establecida por el NIST del gobierno americano. Está basada en el logaritmo discreto y el concepto de
*función hash*, que transforma un input de valor elevado (de 10<sup>6</sup> bits) en una lista de 150 ó 200 bits.

Tiene tres fases:

1. Se generan las claves:
    + Se genera la clave pública.
    + Se genera la clave privada.
2. Se firma el archivo en cuestión.
3. Se verifica que la firma es correcta.

## Ejercicio 9.
**Rasgos esenciales de SSH: cifrado, funcionamiento, negociación de
cifrado para la sesión y autenticación del acceso del usuario al servidor.**

Se explicará por orden.

### Cifrado

SSH utiliza tres formas distintas de cifrado.

+ **Cifrado simétrico**

Se utiliza para cifrar todos los datos de la comunicación en la sesión. El cliente y el servidor derivan la clave privada 
mediante un algoritmo de intercambio de claves, de forma que esta nunca se transmite a través de la comunicación, ya que la 
calcula cada uno de forma independiente. Si alguien intenta captar los datos que el cliente y el servidor se están 
intercambiando no le será posible descifrarlos debido a la intratabilidad del algoritmo que ha generado la clave.

+ **Cifrade asimétrico**

Se utiliza durante el intercambio inicial de claves para el cifrado simétrico. Tanto el cliente como el servidor generan 
pares de claves pública-privada, se intercambian las públicas y cifran los datos de sesión para ponerse de acuerdo en la 
clave privada que utilizarán durante el cifrado simétrico.

Además, también se utiliza el cifrado asimétrico para la autenticación basada en claves. El cliente genera un par público-
privado y envia la clave pública al servidor, que se guarda en el archivo ```certified_keys``` del directorio de la cuenta 
del usuario en el servidor. Tras esto, el usuario puede acceder directamente con su clave privada sin tener que introducir 
los credenciales: la autenticación se hace automáticamente.

+ **Hashing**

Se utiliza principalmente para integridad y verificación de los mensajes enviados. Esto es, dado que las funciones hash 
generan un valor casi único dado un mensaje, cualquier modificación de dicho mensaje genera un hash distito, por lo que el 
usuario detectaría que el mensaje que le ha llegado ha sido modificado sin autorización.

El hashing está basado en la firma digital; los mensajes contienen un MAC (message authentication code) para que el receptor 
pueda verificar el mesnaje que le ha llegado y comprobar que es el correcto.

### Funcionamiento

El protocolo SSH usa un modelo cliente-servidor que cifra los datos de la comunicación.

El servidor se encuentra a la espera de recibir comunicaciones de un cliente en el puerto 22: negocia la conexión segura, 
autentica al cliente y genera el entorno para proporcionar las credenciales para autenticarse.

El cliente comienza la conexión con el servidor mediante paquetes enviados por TCP, negociar la conexión segura y enviar los credenciales para verificar sus credenciales.

El procedimiento es simple: mediante cifrado asimétrico se acuerda la clave para el cifrado simétrico. Tras esto, los mensajes que se envían se cifran con la clave simétrica previamente acordada y se firman con una función hash.

### Negociación de cifrado para la sesión

Antes que nada, cuando un cliente establece la conexión, el servidor responde con las versiones disponibles del protocolo 
que admite y el cliente debe elegir una. Además, el servidor envia su clave de host pública para que el cliente verifique 
que el servidor es el esperado.

Hecho esto, ambas partes de la comunicación utilizan el algoritmo de Diffie-Hellman para negociar una clave privada (o de 
sesión) con la que cifrar todo el tráfico que se enviará entre ellos mediante cifrado simétrico. Para ello:

1. Ambas partes acuerdan un primo alto que será el valor inicial.
2. Se acuerda un generador de cifrado (normalmente AES).
3. Cada parte obtiene otro número primo, esta vez secreto, de forma independiente. Este número será la clave privada.
4. Con la clave privada, el generadr de cifrado y el primo compartido se genera una clave pública que deriva directamente de la privada.
5. Ambas partes intercambian las claves públicas.
6. Cada parte utiliza su clave privada, la clave pública de la otra parte y el número primo compartido, para generar una clave privada o de sesión. Aunque cada parte lo hace de forma independiente, se genera la misma clave con este procedimiento ya que en la clave pública de la otra parte está contenido el primo secreto que había elegido, el cual no se puede extraer de la clave pública por la complejidad computacional que eso supone, pero sí permite generar una clave privada exactamente igual en ambas partes sin conocer dicho primo.

Esta clave secreta, privada o de sesión es la que se utiliza posteriormente para cifrar todos los datos que se intercambian 
entre las dos partes de la comunicación.

### Autenticación del acceso del usuario al servidor

Para autenticar al usuario en el servidor se pueden utilizar distintos métodos. El primero es el estándar, que se usa en la 
mayoría de servidores por la mayoría de usuarios, es el uso de una contraseña. No obstante, el uso de contraseñas no es el 
recomendado por los problemas de seguridad que puede conllevar elegir una contraseña no segura. El procedimiento es simple: 
el usuario se loguea y el servidor pide la contraseña que el usuario envía, cifrada mediante la clave de sesión negociada 
previamente.

Otro método es el uso de un par de claves pública-privada de SSH. La clave privada se mantiene solo bajo el conocimiento del 
cliente, mientras que la llave pública se envía al servidor y se almacena en el directorio del usuario. El prodecimiento es:

1. El cliente envía un ID para el par de claves con los que autenticarse.
2. El servidor verifica el archivo de claves con el ID enviado por el cliente.
3. Si hay una clave pública que coincide con el ID que se ha enviado, el servidor genera un número aleatorio y lo cifra con la clave pública asociada al ID.
4. Este número cifrado se envía al cliente, que utiliza la clave privada para descifrarlo.
5. Una vez descifrado, el cliente devuelve el hash del número (cifrado con la clave de sesión) al servidor; el servidor utiliza el número devuelto y la clave de sesión para calcular el hash y compararlo con el hash que el cliente ha enviado.
6. Si es correcto, el cliente queda autenticado.
