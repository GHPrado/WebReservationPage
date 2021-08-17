<%-- 
    Document   : huesped_modif
    Created on : 04/08/2021, 09:19:02
    Author     : horacio
--%>
<%@page import="Logica.Huesped"%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>

<jsp:include page="/encabezado.jsp"/>
<br>
<h2>Datos del huesped</h2>

<form action="SvTPFinal_modifHuesped" method="GET">
    <% Huesped huesp = (Huesped) misession.getAttribute("huesped");%>
    <label>Nombre:</label>
    <input type="text" name="nombre" value="<%=huesp.getNombre()%>">
    <br>
    <label>Apellido:</label>
    <input type="text" name="apellido" value="<%=huesp.getApellido()%>">
    <br>
    <label>Dni:</label>
    <input type="text" name="dni" value="<%=huesp.getDni()%>">
    <br>
    <label>Direccion:</label>
    <input type="text" name="direccion" value="<%=huesp.getDireccion()%>">
    <br>
    <label>Profesion:</label>
    <input type="text" name="profesion" value="<%=huesp.getProfesion()%>">
    <br>
    <label>Fecha Nacimiento:</label>
    <input type="text" name="nacimiento" value="<%=huesp.getFechaNacimiento()%>">
    <br>
    <input type="hidden" name="id" value="<%=huesp.getId_huesped()%>">
    <input class="boton" type="submit" value="Modificar">
</form>
</html>
