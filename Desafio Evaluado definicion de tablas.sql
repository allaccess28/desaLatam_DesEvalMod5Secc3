--creacion de tablas
CREATE TABLE public.peliculas (
	id int4 NULL,
	pelicula varchar(64) NULL,
	año_estreno int4 NULL,
	director varchar(50) NULL
);
CREATE TABLE public.reparto (
	id_pelicula int4 NULL,
	actor varchar(50) NULL
);

--importamos las tablas de los archivos peliculas y reparto.csv (modificamos los titulos a lowercase y underscore para espacios)


select * from peliculas;

--Obtener el ID de la película “Titanic”.
select id from peliculas where pelicula = 'Titanic';

--Listar a todos los actores que aparecen en la película "Titanic"
select actor from reparto inner join peliculas p  on reparto.id_pelicula = p.id where p.pelicula ='Titanic';

--Consultar en cuántas películas del top 100 participa Harrison Ford.
select count(pelicula) from peliculas inner join reparto r on r.id_pelicula = peliculas.id where r.actor ='Harrison Ford';
--cuales?
select pelicula, r.actor  from peliculas p inner join reparto r  on r.id_pelicula = p.id where r.actor ='Harrison Ford';

--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
select pelicula, año_estreno  from peliculas where año_estreno between 1990 and 1999 order by año_estreno asc;

--Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
select pelicula, length(pelicula) as longitud_titulo from peliculas;

--Consultar cual es la longitud más grande entre todos los títulos de las películas
select pelicula, length(pelicula) as longitud_titulo from peliculas order by longitud_titulo desc limit 1;