# Ruby Eventos ULima Back MongoDB

### Antes de usar

    $ bundler install

### Rutas

+

### Estructura de las colecciones de la base de datos

Estructura de 'eventos':

```javascript
	{
     _id: autogenrado,
    nombre: String,
    descripcion: String,
    nombre_url: String,
    dia_inicio: Date,
    dia_fin: Date,
    hora_inicio: String,
    hora_fin: String,
    lugar String,
    direccion: String
  }
```

Estructura de 'externos':

```javascript
	{
    _id: autogenrado,
    dni : String,
    nombres : String,
    paterno : String,
    materno : String,
    correo : String,
    telefono : String
  }
```

### TODO

+ Validación para controlar error de que todos los campos llenos estén presentes para crear un evento, porque si no están completos no lo graba, pero tampoco muestra mensaje de error.
+ Cambiar Evento.destroy(array) por una interación donde se borre el documento siempre y cuando exista.
+ Cambiar Externo.destroy(array) por una interación donde se borre el documento siempre y cuando exista.

# Fuentes:

+ https://github.com/Wixel/Frank-Sinatra
+ https://stackoverflow.com/questions/6916626/sinatra-helper-in-external-file
+ http://www.railstips.org/blog/archives/2009/06/27/mongomapper-the-rad-mongo-wrapper/
+ https://github.com/rails/rails/issues/24558
+ http://mongomapper.com/documentation/plugins/querying.html#find
