<%-- 
    Document   : usuario_modif
    Created on : 03/08/2021, 21:39:08
    Author     : horacio
--%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>

<%@page import="Logica.Controladora"%>
<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Persistencia.UsuarioJpaController"%>
<jsp:include page="/encabezado.jsp"/>
<br>
<h2>Datos del empleado</h2>

<form action="SvTPFinal_modifUsuario" method="GET">
    <% Usuario usur = (Usuario) misession.getAttribute("empleado");%>
    <label>Nombre:</label>
    <input type="text" name="nombre" value="<%=usur.getNombre()%>">
    <br>
    <label>Apellido:</label>
    <input type="text" name="apellido" value="<%=usur.getApellido()%>">
    <br>
    <label>Dni:</label>
    <input type="text" name="dni" value="<%=usur.getDni()%>">
    <br>
    <label>Direccion:</label>
    <input type="text" name="direccion" value="<%=usur.getDireccion()%>">
    <br>
    <label>Cargo:</label>
    <input type="text" name="cargo" value="<%=usur.getCargo()%>">
    <br>
    <label>Fecha Nacimiento:</label>
    <input type="text" name="nacimiento" value="<%=usur.getFechaNacimiento()%>">
    <br>
    <label>Usuario:</label>
    <input type="text" name="usuario" value="<%=usur.getUsuario()%>">
    <br>
    <label>Password:</label>
    <input type="text" name="password" value="<%=usur.getPassword()%>">
    <br>
    <input type="hidden" name="id" value="<%=usur.getId_usuario()%>">
    <input class="boton" type="submit" value="Modificar">
</form>
</body>
</html>