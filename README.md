# AMD64-INTEL

Este es un ejercicio que servirá de repaso de ensamblador. Implementa un programa passwddump.s  para Linux/AMD64 que escriba por su salida estándar el contenido del fichero /etc/passwd.

El programa debe estar implementado para el ensamblador GNU assembler. En una distribución Ubuntu está instalado por omisión. Si no es así, pertenece al paquete bin-utils.

El programa debe realizar las llamadas al sistema necesarias para volcar el fichero completo en su salida estándar. Las llamadas se deben realizar directamente (usando la instrucción syscall), no se puede hacer uso de la librería estándar de C (glibc).

Es importante realizar un bucle de lectura para leer el fichero completo, independientemente de su tamaño.

No se puede ejecutar un shell ni ningún otro programa externo para realizar el programa, hay que usar las llamadas al sistema open, read y close.

Puedes encontrar los números de las llamadas al sistema de Linux en: https://filippo.io/linux-syscall-table/

Aquí tienes un resumen con algunas de las instrucciones más usadas de la arquitectura: https://www.cs.tufts.edu/comp/40/docs/x64_cheatsheet.pdf

Aquí un listado completo: https://www.felixcloutier.com/x86/

Aquí tienes un ejemplo muy comentado de GNU AS y un enlace al manual: https://www-ug.eecg.toronto.edu/msl/assembler.html

Para compilar y enlazar el programa (el $ es el prompt del sistema):

$ as passwddump.s -o passwddump.o
$ ld passwddump.o -o passwddump



Debe entregar únicamente un fichero, el fuente  (passwddump.s).

Un ejemplo de ejecución:

$ ./passwddump
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
... (todas las líneas del fichero, que puede ser de cualquier tamaño) ...
