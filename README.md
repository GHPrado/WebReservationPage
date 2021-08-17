# WebReservationPage

El sistema está diseñado para ser utilizado únicamente por los empleados del hotel.

la base de datos es MySql. se ha utilizado la librería mysql-connector 5.1.23, IDE Netbeans 8.2, librerias javax.persistence 2.0.0, y Eclipselink JPA2.1

el sistema da automáticamente de alta un usuario de nombre admin, y password admin. Este usuario inicial puede dar acceso a otros empleados/usuarios, y el usuario inicial y los autorizados luego, son los únicos que pueden acceder a todas las pantallas una vez se han logueado

se previeron habitaciones singles, dobles, triples y múltiples (estas últimas de hasta 6 huéspedes)

cada reserva cargada al sistema es asignada al usuario logueado en el momento de registro

sobre las fechas de reserva se controla:
  que se trate de una fecha válida de acuerdo al formato establecido
  que el periodo no sea anterior a la fecha actual
  que la fecha hasta no sea anterior a la fecha desde
  que haya disponibilidad en la habitación seleccionada

sobre la capacidad máxima de las habitaciones, ya que no se registran los ocupantes por cuestión de privacidad, se ha dispuesto que el operador comunique verbalmente la capacidad máxima de la habitación que está reservando. Al efecto aparece en pantalla de reserva todo lo que debe comunicarse al huesped.

permite ABML de todas las tablas, excepto la de reservas que no puede modificarse (en caso de necesidad se debe eliminar la reserva y dar de alta una nueva para que se controle la disponibilidad de habitaciones)

permite visualizar listados de usuarios, habitaciones, huespedes y reservas registradas

además prevé los siguientes informes:
  de reservas diarias (con información de las habitaciones ocupadas, de las que tienen ingresos de huéspedes, y de las que se desocupan en el dia de la fecha),
  de reservas con filtro por periodo mensual (habitaciones que se ocuparon durante el mes que se desee conocer), 
  de reservas por empleado y periodo (con información del total facturado por reservas registradas por el empleado buscado), 
  de habitaciones reservadas por cada huésped y período buscado
  informe de ingresos por periodo seleccionado
