<%-- 
    Document   : listReservasHuesp
    Created on : 19/07/2021, 10:55:48
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
<%
    Controladora control = new Controladora();
    List<Huesped> listHuesped = control.traerHuesped();

    String huespedBuscado = null;

    for (int j = 0; j < listHuesped.size(); j++) {
        int id = listHuesped.get(j).getId_huesped();
        if (id == Integer.valueOf(request.getParameter("huesped"))) {
            huespedBuscado = listHuesped.get(j).getApellido()+ ", " + listHuesped.get(j).getNombre();
        }
    }
    String desde = request.getParameter("desde");
    String hasta = request.getParameter("hasta");
%>
<h3 >Reservas del Huesped: <%=huespedBuscado%> </h3>
<br>
<table>
    <thead>
    <tr>
        <th>Habitacion</th>
        <th>Desde</th>
        <th>Hasta</th>
    </tr>
</thead>
<tbody>
    <% 
                Logica logic = new Logica();

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

            Date desdeDate = logic.String_Fecha(desde);
            Date hastaDate = logic.String_Fecha(hasta);
            
if(huespedBuscado.equals(apellido + ", " + nombre)&&listReserva.get(i).getFechaHasta().after(desdeDate)&&listReserva.get(i).getFechaDesde().before(hastaDate)){

    %>
    <tr>
        <td><%=habitacionNombre%></td>
        <td><%=desdeSTR%></td>
        <td><%=hastaSTR%></td>

        <% int id = listReserva.get(i).getId_reserva();%>

        
    </tr>
    <%} }%> 
</tbody>
</table>
