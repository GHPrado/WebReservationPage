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
<h2>Listado de Ingresos</h2>
<br>
<form action="listIngresos2.jsp" style="display:inline;">
    <label>Desde(dd/mm/yyyy): </label>
    <input type="date" name="desde" required pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}">

    <br>
    <label>Hasta(dd/mm/yyyy): </label>
    <input type="date" name="hasta" required pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}">
<span class="validity"></span>
    <br>
    <br>
    <button type="submit" style="width: 100px; background-color: #558B2F">Buscar</button>
</form>
<br>

