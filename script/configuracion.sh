#!/bin/bash
# Configuración en  Turnkey postgreSQL  13.0 amd64 (Debian 7.2 Wheezy)
# Turnkey postgreSQL tiene preinstalao Postgres.
# 1. Descargar http://www.turnkeylinux.org/download?file=turnkey-postgresql-13.0-wheezy-amd64-vmdk.zip
# 2. Descompirmir el fichero. Se crea la carpeta turnkey-postgresql-13.0-wheezy-amd64 que contiene el
#	 fichero . 
#    - turnkey-postgresql-13.0-wheezy-amd64.vmdk
# 3. Iniciar Virtual Box
# 4. Click en Nueva
# 5. Ponemos el nombre a la máquina vitual
# 6. Seleccionar como sistema operativo Linux
# 7. Seleccionar versión Ubuntu
# 8. Asignar 256MB de memoria
# 9. Seleccionar opción "Usar un disco duro existente", ahí ponemos la ruta donde hemos descomprimido
#	 el archivo en el paso 2.
# 10. Click en crear.
# 11. Click con botón derecho sobre la máquina y seleccionamos configurar.
# 12. Seleccionar redes, crear nuevo adaptador de red de tipo "Solo-Anfitrión"
# 13. Aceptar y guardar cambios.
# 11. Click en Iniciar
# ----------------------------------------------------------------------------------------------------
# First run
# ----------------------------------------------------------------------------------------------------
# 1. Pide la contraseña para el usuario root, y el usuario postgres.
# 2. Aparece un menú en el que permite seleccionar la instalación o entrar en modo recovery
#    seleccionamos la primera opción (es la que selecciona por defecto si no marcamos nada)
# 3. Instala actualizaciones de seguridad
# 4. Una vez arranacada por defecto aparece la IP en el modo DHCP, tenemos que configurar la IP estática.
#	 (esto se hace mediante el nuevo acceso de red creado en el punto 12 de la configuración).
# 5. Navegamos por el menú Advance,entramos a Networking
# 6. Seleccionamos IP Static.
# 7. Seleccionamos por defecto el adaptador que hemos añadido.
# 8. Después reiniciamos la máquina (Reboot) y ya tenemos las direcciones de acceso.
# PHPgAdmin:  http://192.168.56.*
# Web shell:  https://192.168.56.*:12320
# Webmin:     https://192.168.56.*:12321
# SSH/SFTP:   root@http://192.168.56.* (port 22)
# PostgreSQL: psql -U postgres -h http://192.168.56.*
# 9. Ya tenemos configurada la máquina para acceder desde el navegador web.ç
# ----------------------------------------------------------------------------------------------------
# Instalar y configurar Java
# ----------------------------------------------------------------------------------------------------
# 1. Descargamos la versión 7 de java para linux x64
# http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
# 2. Subir el fichero descargado a la máquina a la carpeta /home/java
#    En este paso marcar la opción que los descomprime al subir, sino descomprimir una vez subido
#	 con la orden tar xvzf jdk-7u75-linux-x64.tar.gz (o el nombre con el que aparezca el fichero)
# 3. Modificar el PATH, para añadir/modificar la variable JAVA_HOME
#	  nano /etc/profile
#	  JAVA_HOME=/usr/local/java/jdk1.7.0_21
#	  PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
#     export JAVA_HOME
#     export PATH
# 4. Indicar localización de JRE/JDK
#    update-alternatives --install "/home/java" "java" "/home/java/jdk1.7.0_75/bin/java" 1 
update-alternatives --install "/home/java" "java" "/home/java/jdk1.7.0_75/bin/java" 1 
# 5. Indica java listo
# 	 update-alternatives --install "/home/javac" "javac" "/home/java/jdk1.7.0_75/bin/javac" 1
update-alternatives --install "/home/javac" "javac" "/home/java/jdk1.7.0_75/bin/javac" 1
# 6. Indica java web listo
# 	 update-alternatives --install "/home/javaws" "javaws" "/home/java/jdk1.7.0_75/bin/javaws" 1 
update-alternatives --install "/home/javaws" "javaws" "/home/java/jdk1.7.0_75/bin/javaws" 1
# 7. Seleccionar java por defecto
#	 update-alternatives --set java /home/java/jdk1.7.0_75/bin/java 
#	 update-alternatives --set javac /home/java/jdk1.7.0_75/bin/javac 
#    update-alternatives --set javaws /home/java/jdk1.7.0_75/bin/javaws
update-alternatives --set java /home/java/jdk1.7.0_75/bin/java 
update-alternatives --set javac /home/java/jdk1.7.0_75/bin/javac 
update-alternatives --set javaws /home/java/jdk1.7.0_75/bin/javaws 
# 8. Reargar el PATH
# 	 . /etc/profile
. /etc/profile
# 9. Comprobar que la isntalación ha sido correcta
# 	 java -version  (debe salir la información correspondiente a la versión que hemos instalado)
java -version
# ----------------------------------------------------------------------------------------------------
# Instalar Ruby
# ----------------------------------------------------------------------------------------------------
# 1. Instalar Ruby para el correcto funcionamiento de Fuseki
# 	 apt-get install ruby-full
apt-get install ruby-full
# ----------------------------------------------------------------------------------------------------
# Instalar y configurar Fuseki
# ----------------------------------------------------------------------------------------------------
# 1. Descargar la versión de Fuseki (Si el enlace no lleva a la descarga directa buscar en
# http://jena.apache.org/documentation/serving_data/)
# https://repository.apache.org/content/repositories/snapshots/org/apache/jena/jena-fuseki1/1.1.2-SNAPSHOT/jena-fuseki1-1.1.2-20150305.163207-1-distribution.zip
# 2. Subir el fichero descargado a la máquina a la carpeta /home/
#    En este paso marcar la opción que los descomprime al subir, sino descomprimir una vez subido
#	 con la orden tar xvzf jena-fuseki-1.1.2-20150305.163207-1-distribution.zip (o el nombre con el que aparezca el fichero)
# 3. Dar permiso de ejecución
# 	 chmod +x fuseki-server s-*
chmod +x fuseki-server s-*
# 4. Ejecutar el servidor
# 	 ./fuseki-server --update --mem /ds
./fuseki-server --update --mem /ds
# 5. Cargar el fichero RDF
# 	 s-put http://localhost:3030/ds/data default salida.rdf ---------COMPROBAR NOMBRE Y RUTA FINAL!!1
# 6. Instrucción para ver e fichero RDF cargado
#	 s-get http://localhost:3030/ds/data default
# 7. Función para interrogar con SPARQL sobre el ficheor RDF cargado en memoria
#    s-query --service http://localhost:3030/ds/query 'query a realizar'
# 8.Función para borrar el RDF cargado en memoria
#    s-update --service http://localhost:3030/ds/update 'CLEAR DEFAULT'
#----------------------------------------------------------------------------------------------------
# Instalar y configurar MapServer
# ----------------------------------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------------------------------
# Crear y poblar Base de datos
# ----------------------------------------------------------------------------------------------------
#