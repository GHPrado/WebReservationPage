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

<%@page import="java.util.List"%>
<%@page import="Logica.Huesped"%>
<%@page import="Logica.Controladora"%>

<jsp:include page="/encabezado.jsp"/>

<br>


<table>
    <thead>
    <h2>Listado de Huespedes</h2>
    <tr>
        <th>Apellido</th>
        <th>Nombre</th>
        <th>Direccion</th>
        <th>Eliminar</th>
        <th>Modificar</th>
    </tr>
</thead>
<tbody>
    <% Controladora control = new Controladora();
        List<Huesped> listHuesped = control.traerHuesped();
        for (int i = 0; i < listHuesped.size(); i++) {
            String apellido = listHuesped.get(i).getApellido();
            String nombre = listHuesped.get(i).getNombre();
            String direccion = listHuesped.get(i).getDireccion();%>
    <tr>
        <td><%=apellido%></td>
        <td><%=nombre%></td>
        <td><%=direccion%></td>
        <% int id = listHuesped.get(i).getId_huesped();%>

        <th>
            <form action="SvTPFinal_borrarHuesped" method="POST" style="display:inline">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" style="width: 80px; background-color: red; color: whitesmoke">Delete</button>
            </form>
        </th>
        <th>
            <form action="SvTPFinal_modifHuesped" method="POST" style="display:inline">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" style="width: 80px; ">Edit</button>
            </form>
        </th>

    </tr>
    <% }%> 
</tbody>
</table>
