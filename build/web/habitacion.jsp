<%-- 
    Document   : habitacion
    Created on : 14/07/2021, 11:58:55
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

<form action="SvTPFinal_habitacion" method="POST">
    <label>Nombre:</label>
    <input type="text" name="nombre">
    <br>
    <label>Tipo de habitacion:</label>
    <select name="tipo" id="tipo" type="text">
        <option>Seleccionar</option>
        <option value='Single'>Single</option>
        <option value='Doble'>Doble</option>
        <option value='Triple'>Triple</option>
        <option value='Multiple'>Multiple</option>
    </select>     
    <br>
    <label>Piso:</label>
    <input type="text" name="piso">
    <br>
    <label>Precio:</label>
    <input type="value" name="precio">
    <br>
    <input class="boton" type="submit" value="Alta">
</form>
</body>
</html>