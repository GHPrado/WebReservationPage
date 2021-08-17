<%-- 
    Document   : listHuespedes
    Created on : 19/07/2021, 10:56:17
    Author     : horacio
--%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>

<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>

<jsp:include page="/encabezado.jsp"/>

<br>


<table>
    <thead>
    <h2>Listado de Usuarios</h2>
    <tr>
        <th>Usuario</th>
        <th>Eliminar</th>
        <th>Modificar</th>
    </tr>
</thead>
<tbody>
    <% Controladora control = new Controladora();
        List<Usuario> listUsuario = control.traerUsuario();
        for (int i = 0; i < listUsuario.size(); i++) {
            String usuario = listUsuario.get(i).getApellido()+", "+listUsuario.get(i).getNombre();%>
    <tr>
        <td><%=usuario%></td>
        <% int id = listUsuario.get(i).getId_usuario();%>

        <th>
            <form action="SvTPFinal_borrarUsuario" method="POST" style="display:inline">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" style="width: 80px; background-color: red; color: whitesmoke">Delete</button>
            </form>
        </th>
        <th>
            <form action="SvTPFinal_modifUsuario" method="POST" style="display:inline">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" style="width: 80px; ">Edit</button>
            </form>
        </th>
    </tr>
    <% }%> 
</tbody>
</table>
