<%-- 
    Document   : reserva
    Created on : 04/08/2021, 09:29:51
    Author     : horacio
--%>
<%@page import="Logica.Reserva"%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>

<%@page import="Logica.Controladora"%>
<%@page import="Logica.Huesped"%>
<%@page import="Persistencia.HuespedJpaController"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Habitacion"%>
<%@page import="Persistencia.HabitacionJpaController"%>
<jsp:include page="/encabezado.jsp"/>
<br>
<h2>Datos de la reserva</h2>

<form action="SvTPFinal_reserva" method="POST">
    <% 
        Controladora control = new Controladora();
        String habitacionNombre = null;
        String habitacionTipo = null;
        List<Habitacion> listHabitacion = control.traerHabitacion();
        String habitacion = String.valueOf(misession.getAttribute("habitacion"));
        String costo = String.valueOf(misession.getAttribute("costo"));
        for (int k = 0; k < listHabitacion.size(); k++) {
            int id = listHabitacion.get(k).getId_habitacion();
            if (id == Integer.parseInt(habitacion)) {
                habitacionNombre = listHabitacion.get(k).getNombre();
                habitacionTipo = listHabitacion.get(k).getTipo_habitacion();
            }
        }
        int capacidad=0;
        switch(habitacionTipo)
        {
            case "Single":
                capacidad=1;
                break;
            case "Doble":
                capacidad=2;
                break;
            case "Triple":
                capacidad=3;
                break;
            case "Multiple":
                capacidad=6;
                break;            
            default:
                capacidad=1;
        }
    %>
    <label>Habitacion:</label>
    <input type="text" name="habitacion" value="<%=habitacionNombre%>">
    <input type="hidden" name="id_habitacion" value="<%=misession.getAttribute("habitacion")%>">
    <br>
    <label>Tipo:</label>
    <input type="text" name="habitacion" value="<%=habitacionTipo%>">
    <br>
    <label>Fecha desde:</label>
    <input type="text" name="fechaDesde" value="<%=misession.getAttribute("fechaDesde")%>">
    <br>
    <label>Fecha hasta:</label>
    <input type="text" name="fechaHasta" value="<%=misession.getAttribute("fechaHasta")%>">
    <br>
    <br>
    <p style="font-size: 30px; color: red; margin-left: 50px""> IMPORTANTE!!</p>
    <p style="font-size: 25px; color: red; margin-left: 100px"> ADVERTIR AL HUESPED QUE EN ESTA HABITACION NO SE ADMITEN MAS DE <%=capacidad%> PERSONA/S</p>
    <p style="font-size: 25px; color: red; margin-left: 100px"> EL TOTAL A ABONAR POR LA ESTADIA SOLICITADA SERA DE $<%=costo%></p>
    <br>
    <label>Huesped:</label>
    <select name="huesped" id="huesped" type="Huesped">
        <option>Seleccionar</option>
        <% HuespedJpaController CHuesped = new HuespedJpaController(); %>
        <% List<Huesped> listHuesped = CHuesped.findHuespedEntities(); %>
        <% for (int i = 0; i < listHuesped.size(); i++) {
                int huespedId = listHuesped.get(i).getId_huesped();
                String dato =  listHuesped.get(i).getApellido() + ", " + listHuesped.get(i).getNombre();%>
        <option value=<%=huespedId%>><%=dato%></option>
        <% }
        %>          
    </select>                
    <br>

    <input class="boton" type="submit" value="Registrar">
</form>

</body>
</html>