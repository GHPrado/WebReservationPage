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

<%@page import="Logica.Habitacion"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>

<jsp:include page="/encabezado.jsp"/>

<br>


<table>
    <thead>
    <h2>Listado de Habitaciones</h2>
    <tr>
        <th>Nombre</th>
        <th>Tipo</th>
        <th>Precio</th>
        <th>Eliminar</th>
        <th>Modificar</th>    </tr>
</thead>
<tbody>
    <% Controladora control = new Controladora();
        List<Habitacion> listHabitacion = control.traerHabitacion();
        for (int i = 0; i < listHabitacion.size(); i++) {
            String nombre = listHabitacion.get(i).getNombre();
            String tipo = listHabitacion.get(i).getTipo_habitacion();
            int precio = listHabitacion.get(i).getPrecio();%>
    <tr>
        <td><%=nombre%></td>
        <td><%=tipo%></td>
        <td><%=precio%></td>
        <% int id = listHabitacion.get(i).getId_habitacion();%>

        <th>
            <form action="SvTPFinal_borrarHabitacion" method="POST" style="display:inline">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" style="width: 80px; background-color: red; color: whitesmoke; align-self: center ">Delete</button>
            </form>
        </th>
        <th>
            <form action="SvTPFinal_modifHabitacion" method="POST" style="display:inline">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" style="width: 80px; align-self: center ">Edit</button>
            </form>
        </th>
    </tr>
    <% }%> 
</tbody>
</table>
