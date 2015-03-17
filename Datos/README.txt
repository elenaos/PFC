El fichero datosClean.txt contiene los datos ya listos para cargarlos en la BD del proyecto
Descargar desde la siguiente url:
https://www.dropbox.com/s/mhi4ofua0lopinm/datosClean.txt?dl=0

En la carpeta appCleanDatos+CargaDatos se puede encontrar :
 1-la aplicación (crearCSVngbe.java) con la que se ha hecho la adaptación de los datos proporcionados en la BD original. 
 2-una aplicación (cargarDatosNGBE.java) que permite cargar los datos directamente en la BD del proyecto con el .txt generado al 
   exportar los datos de la BD NGBEv2013 
   
La BD NGBEv2013 que corresponde con el Noménclator Geográfico Básico de España se puede descargar en la siguiente url:

http://centrodedescargas.cnig.es/CentroDescargas/equipamiento.do;jsessionid=2C8DC70FED7FF40D493A1510677267CC?method=mostrarEquipamiento

El fichero crearPunto_3857.ktr es un proyecto de GeoKettle con el que se clasifican los registros almacenados en la tabla ngbev2013
de la base de datos, según su huso, y se hacen las transformaciones necesarias para crear la geometría en el sistema de referencias
utilizado.

El fichero  NGBE (backup) es una copia de seguridad de la base de datos utilizada en el proyecto.