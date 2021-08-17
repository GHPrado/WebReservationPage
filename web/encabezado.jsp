<%-- 
    Document   : index
    Created on : 14/07/2021, 11:48:08
    Author     : horacio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/general.css" rel="stylesheet">
        <title>HOME</title>
    </head>
    <body>
        <div>
            <div style="background-color: #558B2F">
            <table style="display:inline;  background-color: #558B2F"">
                <tbody style="background-color: #558B2F">
                    <tr >
                        <td style="background-color: #558B2F">
                            <form style="background-color: #558B2F" action="SvTPFinal_admin" method="POST">
                                <button type="submit" style="width: 120px; height: 30px;color: lightsalmon; background-color: #33691E; ">LOGIN</button>
                            </form>
                        </td>
                        <td style="background-color: #558B2F; color: white;">==> <%= session.getAttribute("autotizacion")%></td>
                    </tr>
                </tbody>
            </table>
            </div>
            <h1 >HOTEL PATAGONIA</h1>
            <div id="header">
                <nav>
                    <ul class="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a>Usuarios</a>
                            <ul>
                                <li><a href="empleado.jsp">Empleado</a></li>
                                <li><a href="usuario.jsp">Usuario</a></li>
                            </ul>
                        </li>
                        <li><a>Registracion</a>
                            <ul>
                                <li><a href="habitacion.jsp">Habitacion</a></li>
                                <li><a href="huesped.jsp">Huesped</a></li>
                            </ul>
                        </li>
                        <li><a>Reservas</a>
                            <ul>
                                <li><a href="reserva.jsp">por habitacion</a></li>
                            </ul>
                        </li>
                        <li><a>Listados</a>
                            <ul>
                                <li><a href="listUsuarios.jsp">Usuarios</a></li>
                                <li><a href="listHabitaciones.jsp">Habitaciones</a></li>
                                <li><a href="listHuespedes.jsp">Huespedes</a></li>
                                <li><a href="listReservas.jsp">Reservas</a></li>
                            </ul>
                        </li>
                        <li><a>Informes</a>
                            <ul>
                                <li><a href="listReservasDia.jsp">Reservas diarias</a></li>
                                <li><a href="listReservasMes.jsp">Reservas mensuales</a></li>
                                <li><a href="listReservasEmple.jsp">Reservas por empleado</a></li>
                                <li><a href="listReservasHuesp.jsp">Reservas por huesped</a></li>
                                <li><a href="listIngresos.jsp">Detalle de Ingresos</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <br>
        </div>
    </body>
</html>