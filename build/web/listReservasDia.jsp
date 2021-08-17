<%-- 
    Document   : listReservasDia
    Created on : 19/07/2021, 10:54:53
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
<br>
<table>
    <thead>
    <h2>Habitaciones ocupadas el dia de hoy</h2>
    <tr>
        <th>Habitacion</th>
        <th>Desde</th>
        <th>Hasta</th>
        <th>Huesped</th>
    </tr>
</thead>
<tbody>
    <% Controladora control = new Controladora();
        Logica logic = new Logica();

        List<Huesped> listHuesped = control.traerHuesped();
        List<Habitacion> listHabitacion = control.traerHabitacion();

        List<Reserva> listReserva = control.traerReserva();
        String apellido = null;
        String nombre = null;
        String habitacionNombre = null;

        for (int i = 0; i < listReserva.size(); i++) {
            int huesped = listReserva.get(i).getHuesped().getId_huesped();
            for (int j = 0; j < listHuesped.size(); j++) {
                int id = listHuesped.get(j).getId_huesped();
                if (id == huesped) {
                    apellido = listHuesped.get(j).getApellido();
                    nombre = listHuesped.get(j).getNombre();
                }
            }
            int habitacion = listReserva.get(i).getHabitacion().getId_habitacion();
            for (int k = 0; k < listHabitacion.size(); k++) {
                int id = listHabitacion.get(k).getId_habitacion();
                if (id == habitacion) {
                    habitacionNombre = listHabitacion.get(k).getNombre();
                }
            }
            String desdeSTR = logic.Date_String(listReserva.get(i).getFechaDesde());
            String hastaSTR = logic.Date_String(listReserva.get(i).getFechaHasta());

if (logic.Verificar_diaActual(listReserva.get(i).getFechaDesde(), listReserva.get(i).getFechaHasta())){
    %>
    <tr>
        <td><%=habitacionNombre%></td>
        <td><%=desdeSTR%></td>
        <td><%=hastaSTR%></td>
        <td><%=apellido + ", " + nombre%></td>

        <% int id = listReserva.get(i).getId_reserva();%>

        

    </tr>
    <%} }%> 
    
    
    
    
    
</tbody>
</table>
    
    <br>
   

<table>
    <thead>
    <h2>Habitaciones que se ocupan el dia de hoy</h2>
    <tr>
        <th>Habitacion</th>
        <th>Desde</th>
        <th>Hasta</th>
        <th>Huesped</th>
    </tr>
</thead>
<tbody>
    <%
        for (int i = 0; i < listReserva.size(); i++) {
            int huesped = listReserva.get(i).getHuesped().getId_huesped();
            for (int j = 0; j < listHuesped.size(); j++) {
                int id = listHuesped.get(j).getId_huesped();
                if (id == huesped) {
                    apellido = listHuesped.get(j).getApellido();
                    nombre = listHuesped.get(j).getNombre();
                }
            }
            int habitacion = listReserva.get(i).getHabitacion().getId_habitacion();
            for (int k = 0; k < listHabitacion.size(); k++) {
                int id = listHabitacion.get(k).getId_habitacion();
                if (id == habitacion) {
                    habitacionNombre = listHabitacion.get(k).getNombre();
                }
            }
            String desdeSTR = logic.Date_String(listReserva.get(i).getFechaDesde());
            String hastaSTR = logic.Date_String(listReserva.get(i).getFechaHasta());

            if (logic.Verificar_ocupaHoy(listReserva.get(i).getFechaDesde())) {
    %>
    <tr>
        <td><%=habitacionNombre%></td>
        <td><%=desdeSTR%></td>
        <td><%=hastaSTR%></td>
        <td><%=apellido + ", " + nombre%></td>

        <% int id = listReserva.get(i).getId_reserva();%>



    </tr>
    <%}
        }%> 





</tbody>
</table>
        
<br>

<table>
    <thead>
    <h2>Habitaciones que se desocupan el dia de hoy</h2>
    <tr>
        <th>Habitacion</th>
        <th>Desde</th>
        <th>Hasta</th>
        <th>Huesped</th>
    </tr>
</thead>
<tbody>
    <%
        for (int i = 0; i < listReserva.size(); i++) {
            int huesped = listReserva.get(i).getHuesped().getId_huesped();
            for (int j = 0; j < listHuesped.size(); j++) {
                int id = listHuesped.get(j).getId_huesped();
                if (id == huesped) {
                    apellido = listHuesped.get(j).getApellido();
                    nombre = listHuesped.get(j).getNombre();
                }
            }
            int habitacion = listReserva.get(i).getHabitacion().getId_habitacion();
            for (int k = 0; k < listHabitacion.size(); k++) {
                int id = listHabitacion.get(k).getId_habitacion();
                if (id == habitacion) {
                    habitacionNombre = listHabitacion.get(k).getNombre();
                }
            }
            String desdeSTR = logic.Date_String(listReserva.get(i).getFechaDesde());
            String hastaSTR = logic.Date_String(listReserva.get(i).getFechaHasta());

            if (logic.Verificar_desocupaHoy(listReserva.get(i).getFechaHasta())) {
    %>
    <tr>
        <td><%=habitacionNombre%></td>
        <td><%=desdeSTR%></td>
        <td><%=hastaSTR%></td>
        <td><%=apellido + ", " + nombre%></td>

        <% int id = listReserva.get(i).getId_reserva();%>



    </tr>
    <%}
        }%> 





</tbody>
</table>
