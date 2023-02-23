/* Seleccion del schema */
Use almacen;
/* Querys de consulta de cada tabla */
select*from clientes;
Select*from empleados;
Select*from precios;
Select*from mayoristas;
Select*from marcas;
Select*from categorias;
Select*from articulos;
Select*from pedidos;
Select*from entregas;
Select*from almacenage;
/* Estos 2 ultimos se encontraran vacios hasta la ejecucion de los triggers al insertar, modificar o updatear los datos de la tabla precios*/
Select*from auditorias_precios;
Select*from precios_viejos;

/* Querys para informes (modelos de utilizacion para el modelo de negocio) */
/* Query para visualizar la tabla de precios y de articulos */
select*from articulos as a
left join precios as b on a.id_precios=b.id_precios
group by a.id_precios;
/* Query para visualizar el ID con el Nombre y la cantidad de los articulos de los pedidos y el ID del empleado encargado de el*/
select a.num_pedidos, c.nombre_art, a.id_articulos ,a.cantidad_pedidos , b.id_empleados
from pedidos as a
left join entregas as b on a.num_pedidos=b.num_pedidos
left join articulos as c on a.id_articulos=c.id_articulos
group by a.num_pedidos;
/* utilizacion de vistas para lo que fueron creadas (para mas informacion consultar documento adjunto)*/
select*from vista_articulos_con_precios;
select*from vista_articulos_a_reponer;
select*from vista_articulos_con_marca_mayorista;
select*from vista_articulos_con_precios;
select*from comparar_precio;

/*funciones*/

select cal_pre_ven(52);

select direccion_ped(2);

/*SP*/
/*estos SP son para el mantenimiento y consulta de la tabla de precios viejos creados por los triggers
de no insertar nada el primero mostrara la tabla vacia y el segundo no borrara nada ya que no hay nada*/

call viejos_sp ();

call eliminar_hasta_sp(10);