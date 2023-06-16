Descripción del Proyecto:
 
Ofrece una amplia selección de títulos de libros, opciones personalizadas y funciones adicionales para
mejorar la experiencia general del usuario, Además, la aplicación también puede ofrecer
recomendaciones personalizadas basadas en los intereses y las lecturas anteriores del usuario.

Contexto del Proyecto:

Innovar un sistema de Librerías para mejorar la experiencia del cliente. Para ello, utilizaremos Alexa
como asistente virtual de Amazon, estará integrado en las diferentes áreas de la librería para que los
clientes puedan interactuar con el asistente virtual. Se tendrá en cuenta una conexión a internet y
asegurarse de que se tenga actualizado
Alexa estará programada para que responda preguntas frecuentes sobre horarios de apertura,
recomendaciones de libros, búsqueda de autores, años que se lanzó el libro, entre otras.
Con ayuda de Alexa puede mejorar la experiencia del cliente en una librería física al proporcionar
respuestas rápidas y personalizadas a las preguntas frecuentes y recomendaciones precisas de un
historial ya creado.

Objetivos de bookfash

1. Proporcionar a los usuarios una amplia selección de libros electrónicos en diferentes géneros y
temas.
2. Facilitar la lectura de libros electrónicos en dispositivos.
3. Ofrecer una plataforma para que los autores y editores publiquen y distribuyan sus obras.
4. Permitir a los usuarios comprar, descargar y leer libros electrónicos de manera fácil y conveniente.
5. Proporcionar herramientas para que los usuarios puedan personalizar su experiencia de lectura,
como ajustar el tamaño del texto, cambiar el color de fondo y agregar marcadores.
6. Ofrecer recomendaciones personalizadas basadas en las preferencias de lectura del usuario.
7. Proporcionar una plataforma para que los usuarios puedan compartir sus opiniones sobre los libros
que han leído y descubrir nuevas obras recomendadas por otros usuarios.

Requerimientos

Catálogo de libros: La aplicación debe contar con un catálogo completo de los libros disponibles en la
biblioteca, incluyendo información detallada sobre cada uno, como título, autor, editorial, año de
publicación, número de páginas, género literario y sinopsis.
Búsqueda avanzada: La aplicación debe contar con una función de búsqueda avanzada que permita a
los usuarios buscar libros por diferentes criterios, como autor, título o género literario.
Integración con redes sociales: La aplicación debe permitir a los usuarios compartir información sobre
los libros que han leído o están leyendo en sus redes sociales.
Seguridad: La aplicación debe contar con medidas adecuadas para garantizar la seguridad y privacidad
de la información personal y financiera de los usuarios.
Interfaz intuitiva: La aplicación debe contar con una interfaz intuitiva y fácil de usar para que los
usuarios puedan navegar por ella sin dificultad.

MODELO RELACIONAL DE BOOKFASH
1. Determinar las entidades de BOOKFASH.
Libros
Autores
Vistas
Recomendaciones

2. Identificar las relaciones de BOOKFASH.
Libros Autores
Autores Libros
Vistas Recomendaciones
Recomendaciones Vistas

3. Identificar los atributos de cada una de las tablas.
Libros
ID_Libro
NombreLibro
NombreAutor
DescripciónLibro

Vistas
Id_Libro
NombreLibro
NombreAutor
ID_Vistas

Autores
ID_Autor
NombreAutor
NombreLibro
DescripciónAutor

Recomendaciones
NombreLibro
NombreAutor
ID_Recomencaciones


4. Modelo entidad relación de BOOKFASH
