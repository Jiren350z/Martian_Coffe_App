Alumno: Diego Morales
Docente: Manuel Moscoso

link a github del proyecto: 
https://github.com/Jiren350z/Martian_Coffe_App/tree/main

nota: dentro de lib estan los widgets y dentro de models estan las clases

link a video del proyecto: 
https://www.youtube.com/watch?v=zF5_wSwvJE8&ab_channel=DiegoMorales



La presente aplicación tiene como objetivo ser una maqueta base en cuanto a la interfaz para una aplicación de café. 

En general, la aplicación cuenta con una pantalla de productos (tienda), un apartado de publicaciones para la comunidad (post),
un apartado para buscar (explorar/descubrir) y un apartado para ver el perfil de usuario, 
todos accesibles a través de una barra de navegación inferior.

Si bien estas pantallas ya contienen información de ejemplo, tanto productos como publicaciones tienen un botón para añadir nuevos elementos.
En el futuro, esto se usará para realizar una publicación o añadir un producto.

En el apartado de publicaciones se encuentran contenidos como publicaciones comunes con una imagen,
publicaciones sobre ingredientes, recetas o métodos de preparación. 
La interfaz presenta detalles para añadir a favoritos, ir al foro de comentarios o compartir, además de una barra de comentarios.

Cada apartado contiene la funcionalidad para ver los detalles correspondientes.
Por ejemplo, al presionar sobre un producto, se accede a los detalles del mismo.
Lo mismo ocurre con los ingredientes, métodos de preparación y recetas.
En estas pantallas de detalles, también habrá opciones para calificar, añadir a favoritos, comentar, entre otras funcionalidades propias de cada apartado.
Al seleccionar la opción de calificar, se abrirá una pestaña que permite realizar la valoración,
aunque esta pantalla es solo una representación visual y no tiene funcionalidad activa.

Además, en la sección de perfil de usuario, aparte de los datos básicos, se muestran diferentes apartados de información,
como publicaciones creadas, productos, ingredientes, métodos de preparación y recetas favoritas,
así como recetas y métodos de preparación creados por el usuario. También se incluyen apartados para acceder a esos listados de favoritos y creados.
Actualmente, solo los listados de favoritos contienen información de ejemplo,
pero en el futuro la funcionalidad de los listados de apartados creados será la misma que la de los favoritos.

Por último, en el perfil se encuentran secciones de configuraciones, ayuda y editar perfil.
Estos tres apartados llevan a pantallas que no son funcionales, sirviendo únicamente como representación visual.

Cabe destacar que el objetivo del proyecto es contar con una maqueta visual. No se requiere que sea necesariamente funcional,
ya que esta maqueta servirá como base para implementar futuras funcionalidades, añadir nuevos widgets o mejorar los widgets ya existentes.

a continuacion se muestran los requerimientos que debia tener la aplicacion.

Requerimientos:

-pantalla de inicio que represente la aplicación:
 pantalla por defecto al iniciar, en este caso la pantalla de publicaciones
-necesidad de contar con herramientas que permitan a los aficionados y baristas gestionar, compartir y descubrir recetas de café de manera eficiente
-conocer, crear, explorar y compartir preparaciones(metodos de preparacion)
-mantener una lista personalizada de recetas favoritas.
 gestionar diferentes métodos de preparación y explorar una amplia variedad de preparaciones de café.
-crear y seguir guías predefinidas para diferentes tipos de café
-Cada usuario podría establecer preferencias personalizadas.
-personalización de recetas.
-Permitir a los usuarios compartir sus recetas o experiencias de preparación con la comunidad
-integrar productos relacionados con el café.
-la aplicación puede ser utilizada desde distintas plataformas.

implementacion: solo se mencionaran las clases y widgets que se consideraron para la solucion,
si se requiere detallar en algun lugar se dira de forma resumida:

Clases:

-ingredient(ingrediente).
-post(publicacion).
-preparation_method(metodo de preparacion).
-product(producto).
-recipe(receta).
-shop(tienda).
-users(usuarios).

Widgets:

-browser:widget del buscador.
-favorites_ingredients:
widget que almacena una lista de ingredientes favoritos del usuario.

-favorites_preparation_metodos:
widget que almacena una lista de metodos de preparacion favoritos del usuario.

-favorites_products:
widget que almacena una lista de productos favoritos del usuario.

-favorites_recipes:
widget que almacena una lista de recetas favoritas del usuario.

-help:
widget que abre la ventana de dudas y consultas del usuario.

-home_page: 
widget principal desde el cual se accede a la mayoria de opciones,
ademas de ser el lugar donde se crean las instancias de ejemplo para la app.

-ingedient_detail_page:
pantalla de detalles del ingrediente, en la cual se muestra informacion
relevante relacionado al ingrediente.

-perfil_edit:
pantalla con opciones de perzonalizacion del perfil del  usuario.

-post:
pantalla de publicaciones que puede hacer el usuario.

-preparation_metod_details:
pantalla de detalles del metodos de preparacion,
en la cual se muestra informacion
relevante relacionado a las preparaciones.

-product_detail_page:
pantalla de detalles del producto,
en la cual se muestra informacion
relevante relacionado a los productos.

-rate:
pantalla para añadir estrellas(calificar)
algun apartado que requiera calificacion.

-recipe_detail_page:
pantalla de detalles de la receta,
en la cual se muestra informacion
relevante relacionado a las recetas.

-settings: 
apartado de preferencias del usuario.

-shop: 
tienda de productos relacionados al cafe.

-users:
pantalla del usuario en general.

-main: 
pantalla donde se ejecuta la solucion