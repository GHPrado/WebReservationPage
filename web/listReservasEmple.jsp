<%-- 
    Document   : listReservasEmple
    Created on : 19/07/2021, 10:55:18
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
<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>

<jsp:include page="/encabezado.jsp"/>
<br>
<h2>Listado de Reservas por Empleado</h2>
<br>
<form action="listReservasEmple2.jsp" style="display:inline;">

<label>Empleado:</label>
<select name="empleado" id="empleado">

    <option>Seleccionar</option>
    <% Controladora control = new Controladora();
        List<Usuario> listEmpleado = control.traerUsuario();
        for (int i = 0; i < listEmpleado.size(); i++) {
            String dato = listEmpleado.get(i).getApellido()+ ", " + listEmpleado.get(i).getNombre();
            int id = listEmpleado.get(i).getId_usuario();
    %>
    <option value=<%=id%>><%=dato%></option>
    <% }%> 

</select>
    <br>
    <label>Desde(dd/mm/yyyy): </label>
        <input type="date" name="desde" required pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}">

    <br>
    <label>Hasta(dd/mm/yyyy): </label>
    <input type="date" name="hasta" required pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}">

<br>
<br>
                    <button type="submit" style="width: 100px; background-color: #558B2F">Buscar</button>
</form>
<br>

