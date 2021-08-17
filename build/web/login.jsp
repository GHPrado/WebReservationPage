<%-- 
    Document   : login
    Created on : 14/07/2021, 11:54:59
    Author     : horacio
--%>


<%@page import="Logica.Controladora"%>
<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Persistencia.UsuarioJpaController"%>
<jsp:include page="/encabezado.jsp"/>
<br>
<h2>Datos del login</h2>

<form action="SvTPFinal_login" method="POST">

    <label>Usuario:</label>
    <select name="usuario" id="usuario">
        <option>Seleccionar</option>
        <% Controladora control = new Controladora();
            List<Usuario> listTipo = control.traerUsuario();
            for (int i = 0; i < listTipo.size(); i++) {
                String dato = listTipo.get(i).getUsuario();%>
        <option value=<%=dato%>><%=dato%></option>
        <% }%>         
    </select>
    <br>
    <label>Password:</label>
    <input type="text" name="password">
    <br>
    <input class="boton" type="submit" value="Ingresar">
</form>
</body>
</html>