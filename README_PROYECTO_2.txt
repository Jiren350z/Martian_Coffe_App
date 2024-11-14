Alumno: Diego Morales
Docente: Manuel Moscoso


NOTA: las recetas se guardan al ser creadas y editadas, sin embargo para reflejar el cambio se debe 
recargar el widget de mis recetas, llendo a otro widget y volviendo a mis recetas por ejemplo. 

link a github del proyecto: 
https://github.com/Jiren350z/Martian_Coffe_App

link a video del proyecto: 


Instalacion:
para instalar y ejecutar el proyecto localmente:


Martian Cofee: aplicacion creada en flutter, esta enfocada
a que los usuarios puedan descubrir, crear, gestionar y compartir diferentes recetas de cafe.
la aplicacion esta diseñada para aficionados al cafe y gente que se quiera iniciar en el tema.

Diagrama UML:

Diagrama de Arquitectura de informacion:

Diagrama de Flujo:


tras los periodos de prueba del antiguo prototipo enfocado a ser una maqueta funcional, se sacaron conclusiones
y se decidio tomar lo mas importante e implementarlo de forma funcional.
decidiendo implementar la gestion de recetas de un usuario.

la aplicacion debe trabajar con informacion persistente, 
uso de imagenes tanto locales como por fotografias y
compartir informacion, tanto de las recetas como de la opinion del usuario que 
prueba la aplicacion. Tambien se ussara informacion de tipo json para precargar informacion



a continuacion se muestran los requerimientos que debia tener la aplicacion.

Requerimientos:

-el usuario debe poder ver una lista de recetas de cafe ya disponibles en la aplicacion. 

-el usuario debe tener un espacio para crear y gestionar sus propias recetas de cafe.

-el usuario debe poder gestionar y editar las recetas ya disponibles en la aplicacion,
editando los diferentes atributos que la receta tiene.

-el usuario debe de poder guardar la receta editada en sus propias recetas

-el usuario debe tener la capacidad de agregar fotos a las recetas de cafe creadas por el.

-el usuario debe poder compartir sus recetas a traves de redes sociales y otras apps.

-el usuario debe poder enviar una retroalimentacion al equipo de desarrollo por correo.

Elementos que confoman la solucion:

Clases:

-recipe(receta): esta clase contiene todos los atributos que la componen y trabaja con metodos
relacionados a una base e datos.

Widgets:

-add_recipe: 
pantalla encargada de crear una receta y guardarla en la base de datos.

-home_page: 
widget principal desde el cual se accede a la mayoria de opciones.

-my_barist: pantalla en la cual se cargan las recetas de cafe precargadas.

-my_recipes: pantalla en la cual el usuario crea sus recetas y donde se guardan las recetas
traidas desde mi barista

-opinion: pantalla que carga las preguntas precargadas desde un json

-recipe_detail_page:
pantalla de detalles de la receta,
en la cual se muestra informacion
relevante relacionado a las recetas.


utils:

-colors: archivo donde se guarda la paleta de colores de la app

-datebase_helper: archivo donde se almacena la base de datos de la aplicacion, es la encargada de tener
los metodos para la gestion de la informacion persistente.

json:

-questions: archivo que contiene las preguntas que se usaran para la pantalla de opinion del usuario

-recipes: archivo que contiene las recetas de cafe precargadas que se usaran en la pantalla de mi barista.

main: 
pantalla donde se ejecuta la solucion