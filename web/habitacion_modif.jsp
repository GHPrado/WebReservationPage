<%-- 
    Document   : habitacion_modif
    Created on : 04/08/2021, 09:11:56
    Author     : horacio
--%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>

<%@page import="Logica.Controladora"%>
<%@page import="Logica.Habitacion"%>
<%@page import="java.util.List"%>

<jsp:include page="/encabezado.jsp"/>

<br>
<h2>Datos de la habitacion</h2>

<form action="SvTPFinal_modifHabitacion" method="GET">
    <% Habitacion habit = (Habitacion) misession.getAttribute("habitacion");%>
    <label>Nombre:</label>
    <input type="text" name="nombre" value="<%=habit.getNombre()%>">
    <br>
    <label>Precio:</label>
    <input type="value" name="precio" value="<%=habit.getPrecio()%>">
    <br>
    <label>Tipo de habitacion:</label>
    <input type="text" name="tipo" value="<%=habit.getTipo_habitacion()%>">
    <br>
    <input type="hidden" name="id" value="<%=habit.getId_habitacion()%>">
    <input class="boton" type="submit" value="Modificar">
</form>
</body>
</html>