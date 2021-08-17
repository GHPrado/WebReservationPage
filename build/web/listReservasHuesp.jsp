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
<h2>Listado de Reservas por Huesped</h2>
<br>
<form action="listReservasHuesp2.jsp" style="display:inline">

<label>Huesped:</label>
<select name="huesped" id="huesped">

    <option>Seleccionar</option>
    <% Controladora control = new Controladora();
        List<Huesped> listHuesped = control.traerHuesped();
        for (int i = 0; i < listHuesped.size(); i++) {
            String dato = listHuesped.get(i).getApellido() + ", " + listHuesped.get(i).getNombre();
            int id = listHuesped.get(i).getId_huesped();
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

                    <button type="submit" style="margin-left: 300px; width: 100px; background-color: #558B2F">Buscar</button>
</form>
<br>
