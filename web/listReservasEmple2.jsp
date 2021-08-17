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
    List<Usuario> listUsuario = control.traerUsuario();

    String usuarioBuscado = null;

    for (int j = 0; j < listUsuario.size(); j++) {
        int id = listUsuario.get(j).getId_usuario();
        if (id == Integer.valueOf(request.getParameter("empleado"))) {
            usuarioBuscado = listUsuario.get(j).getApellido() + ", " + listUsuario.get(j).getNombre();
        }
    }
    String desde = request.getParameter("desde");
    String hasta = request.getParameter("hasta");
%>
<h3>Reservas del Empleado: <%=usuarioBuscado%> - Periodo: <%=desde%>-<%=hasta%></h3>
<br>
<table>
    <thead>
    <tr>
        <th>Habitacion</th>
        <th>Desde</th>
        <th>Hasta</th>
        <th>Huesped</th>
        <th>Precio</th>
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
        String apellidoUsur = null;
        String nombreUsur = null;
        String habitacionNombre = null;
        int habitacionPrecio=0;
        long precioAcumulado=0;
        long costo=0;

        for (int i = 0; i < listReserva.size(); i++) {
            String usuario = listReserva.get(i).getUsuario().getUsuario();
            for (int l = 0; l < listUsuario.size(); l++) {
                String usur1 = listUsuario.get(l).getUsuario();
                if (usuario.equals(usur1)) {
                    
                    apellidoUsur = listUsuario.get(l).getApellido();
                    nombreUsur = listUsuario.get(l).getNombre();
                }
            }
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
                        habitacionPrecio = listHabitacion.get(k).getPrecio();

                        long costoDiario = listHabitacion.get(k).getPrecio();
                        long diff = listReserva.get(i).getFechaHasta().getTime() - listReserva.get(i).getFechaDesde().getTime();
                        TimeUnit time = TimeUnit.DAYS;
                        long dias = time.convert(diff, TimeUnit.MILLISECONDS);
                        costo = costoDiario * dias;

                    }
                }
            String desdeSTR = logic.Date_String(listReserva.get(i).getFechaDesde());
            String hastaSTR = logic.Date_String(listReserva.get(i).getFechaHasta());
            
            Date desdeDate = logic.String_Fecha(desde);
            Date hastaDate = logic.String_Fecha(hasta);
            
            if (usuarioBuscado.equals(apellidoUsur + ", " + nombreUsur)&&listReserva.get(i).getFechaHasta().after(desdeDate)&&listReserva.get(i).getFechaDesde().before(hastaDate)){ 
                precioAcumulado = precioAcumulado + costo;

    %>
    <tr>
        <td><%=habitacionNombre%></td>
        <td><%=desdeSTR%></td>
        <td><%=hastaSTR%></td>
        <td><%=apellidoHuesp + ", " + nombreHuesp%></td>
        <td style="text-align: right; padding-right: 20px; ><%=habitacionPrecio%></td>


    </tr>
    <%}
        }%> 
</tbody>
</table>

<br>
<h3>Total de reservas registradas por el empleado $<%=precioAcumulado%></h3>
