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
<h2>Listado de Reservas del Mes</h2>
<br>
<form action="listReservasMes2.jsp" style="display:inline">
    <label>Periodo (mm/yyyy):</label>
    <input type="date" name="mesBuscar"  required pattern="[0-9]{2}/[0-9]{4}">
                <button type="submit" style="width: 100px; background-color: #558B2F">Buscar</button>
</form>

<br>



