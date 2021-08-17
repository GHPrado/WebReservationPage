    <%-- 
    Document   : listReservas
    Created on : 06/08/2021, 17:06:45
    Author     : horacio
--%>
<%@page import="Logica.Habitacion"%>
<%@page import="Logica.Huesped"%>
<%@page import="Logica.Logica"%>
<%@page import="java.util.Date"%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>

<%@page import="Logica.Reserva"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>

<jsp:include page="/encabezado.jsp"/>

<br>


<table>
    <thead>
    <h2>Listado de Reservas</h2>
    <tr>
        <th>Habitacion</th>
        <th>Desde</th>
        <th>Hasta</th>
        <th>Huesped</th>
        <th>Eliminar</th>
    </tr>
</thead>
<tbody>
    <% Controladora control = new Controladora();
        Logica logic = new Logica();

        List<Reserva> listReserva = control.traerReserva();
        String apellido = null;
        String nombre = null;
        String habitacionNombre = null;

        for (int i = 0; i < listReserva.size(); i++) {
            int huesped = listReserva.get(i).getHuesped().getId_huesped();
            apellido = control.buscarHuesped(huesped).getApellido();
            nombre = control.buscarHuesped(huesped).getNombre();

            int habitacion = listReserva.get(i).getHabitacion().getId_habitacion();
            habitacionNombre = control.buscarHabitacion(habitacion).getNombre();
            
            String desdeSTR = logic.Date_String(listReserva.get(i).getFechaDesde());
            String hastaSTR = logic.Date_String(listReserva.get(i).getFechaHasta());

    %>
    <tr>
        <td><%=habitacionNombre%></td>
        <td><%=desdeSTR%></td>
        <td><%=hastaSTR%></td>
        <td><%=apellido + ", " + nombre%></td>

        <% int id = listReserva.get(i).getId_reserva();%>

        <th>
            <form action="SvTPFinal_borrarReserva" method="POST" style="display:inline">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" style="width: 80px; background-color: red; color: whitesmoke">Delete</button>
            </form>
        </th>

    </tr>
    <% }%> 
</tbody>
</table>
