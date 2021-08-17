<%-- 
    Document   : usuario
    Created on : 14/07/2021, 11:58:07
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
<h2>Datos del usuario</h2>

<form action="SvTPFinal_usuario" method="POST">
    <label>Empleado:</label>
    <select name="empleado" id="empleado">

        <option>Seleccionar</option>
        <% Controladora control = new Controladora();
            List<Usuario> listTipo = control.traerUsuario();
            for (int i = 0; i < listTipo.size(); i++) {
                String dato = listTipo.get(i).getApellido() + ", " + listTipo.get(i).getNombre();
                int id = listTipo.get(i).getId_usuario();
        %>
        <option value=<%=id%>><%=dato%></option>
        <% }%> 

    </select>
    <br>
    <label>Usuario:</label>
    <input type="text" name="usuario">
    <br>
    <label>Password:</label>
    <input type="text" name="password">
    <br>
    <input class="boton" type="submit" value="Alta">
</form>
</body>
</html>