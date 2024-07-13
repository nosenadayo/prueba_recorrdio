# Configuración del Entorno para la Aplicación

### Exportar Variables de Entorno para la Base de Datos Postgres

Antes de iniciar la aplicación, asegúrate de exportar las siguientes variables de entorno para configurar la base de datos Postgres:

```bash
export DB_USER=___TU_PG_USER___
export DB_PASSWORD=___TU_PG_PASSWORD___
export DB_HOST=___TU_HOST___
export DB_PORT=___TU_PUERTO___
```

### Instalación de Ruby
La aplicación está desarrollada con Ruby versión 2.7.6. Para instalar y usar esta versión, ejecuta los siguientes comandos:
```bash
rvm install 2.7.6
rvm use 2.7.6@recorrido --create
```

### Instalación de Dependencias
Una vez que hayas configurado la versión correcta de Ruby, instala las dependencias listadas en el Gemfile:
```bash
bundle install
```

### Configuración de la Base de Datos
Para crear la base de datos, ejecuta:
```bash
rails db:create
```

### Aplicar Migraciones
Ejecuta las migraciones para configurar el esquema de la base de datos:

```bash
rails db:migrate
```
### Poblar la Base de Datos
Para poblar la base de datos con datos de prueba, ejecuta:
```bash
rails db:seed
```

### Iniciar el Servidor
Finalmente, levanta el servidor de Rails:
#### levantar el servidor de rails
```bash
rails s
```
