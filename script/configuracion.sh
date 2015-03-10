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
# ----------------------------------------------------------------------------------------------------
# Instalar Ruby
# ----------------------------------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------------------------------
# Instalar y configurar Fuseki
# ----------------------------------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------------------------------
# Instalar y configurar MapServer
# ----------------------------------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------------------------------
# Crear y poblar Base de datos
# ----------------------------------------------------------------------------------------------------
#