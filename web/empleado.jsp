<%-- 
    Document   : empleado
    Created on : 14/07/2021, 11:55:16
    Author     : horacio
--%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>
<jsp:include page="/encabezado.jsp"/>
<br>
<h2>Datos del empleado</h2>

<form action="SvTPFinal_empleado" method="POST">
    <label>Nombre:</label>
    <input type="text" name="nombre">
    <br>
    <label>Apellido:</label>
    <input type="text" name="apellido">
    <br>
    <label>Dni:</label>
    <input type="text" name="dni">
    <br>
    <label>Direccion:</label>
    <input type="text" name="direccion">
    <br>
    <label>Cargo:</label>
    <input type="text" name="cargo">
    <br>
    <label>Fecha Nacimiento:</label>
    <input type="text" name="nacimiento">
    <br>
    <input class="boton" type="submit" value="Registrar">
</form>


