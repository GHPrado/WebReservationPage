<%-- 
    Document   : listReservasEmple
    Created on : 19/07/2021, 10:55:18
    Author     : horacio
--%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="Logica.Usuario"%>
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

<br >
<%
    Controladora control = new Controladora();
    
    String desde = request.getParameter("desde");
    String hasta = request.getParameter("hasta");
%>
<h3>Ingresos por Reservas comenzadas entre: <%=desde%>-<%=hasta%></h3>
<table>
    <thead>
        <tr>
            <th>Habitacion</th>
            <th>Desde</th>
            <th>Hasta</th>
            <th>Huesped</th>
            <th>Ingresos</th>
        </tr>
    </thead>
    <tbody>
        <%
            Logica logic = new Logica();
        
            List<Habitacion> listHabitacion = control.traerHabitacion();
            List<Reserva> listReserva = control.traerReserva();
            List<Huesped> listHuesped = control.traerHuesped();
        
            String apellidoHuesp = null;
            String nombreHuesp = null;
            String habitacionNombre = null;
            long ingresoAcumulado = 0;
            long ingresoEstadia = 0;
        
            for (int i = 0; i < listReserva.size(); i++) {
                int huesped = listReserva.get(i).getHuesped().getId_huesped();
                for (int j = 0; j < listHuesped.size(); j++) {
                    int id = listHuesped.get(j).getId_huesped();
                    if (id == huesped) {
                        apellidoHuesp = listHuesped.get(j).getApellido();
                        nombreHuesp = listHuesped.get(j).getNombre();
                    }
                }
                int habitacion = listReserva.get(i).getHabitacion().getId_habitacion();
                for (int k = 0; k < listHabitacion.size(); k++) {
                    int id = listHabitacion.get(k).getId_habitacion();
                    if (id == habitacion) {
                        habitacionNombre = listHabitacion.get(k).getNombre();
                        long ingresoDia = listHabitacion.get(k).getPrecio();
                        long diff = listReserva.get(i).getFechaHasta().getTime() - listReserva.get(i).getFechaDesde().getTime();
                        TimeUnit time = TimeUnit.DAYS;
                        long dias = time.convert(diff, TimeUnit.MILLISECONDS);
                        ingresoEstadia = ingresoDia * dias;
                    }
                }
                String desdeSTR = logic.Date_String(listReserva.get(i).getFechaDesde());
                String hastaSTR = logic.Date_String(listReserva.get(i).getFechaHasta());
            
                Date desdeDate = logic.String_Fecha(desde);
                Date hastaDate = logic.String_Fecha(hasta);
            
                if (listReserva.get(i).getFechaDesde().equals(desdeDate) || (listReserva.get(i).getFechaDesde().before(hastaDate) && listReserva.get(i).getFechaDesde().after(desdeDate))) {                
                    ingresoAcumulado = ingresoEstadia + ingresoAcumulado;

        %>
        <tr>
            <td><%=habitacionNombre%></td>
            <td><%=desdeSTR%></td>
            <td><%=hastaSTR%></td>
            <td><%=apellidoHuesp + ", " + nombreHuesp%></td>
            <td style="text-align: right; padding-right: 20px; "><%=ingresoEstadia%></td>
            <% int id = listReserva.get(i).getId_reserva();%>


        </tr>
        <%}
        }%> 
    </tbody>
</table>

<br>
<h3>Total de ingresos del periodo $<%=ingresoAcumulado%></h3>
