<%-- 
    Document   : reserva
    Created on : 04/08/2021, 09:29:51
    Author     : horacio
--%>
<!-- control de incio de sesion-->
<% HttpSession misession = request.getSession();
    if ((misession.getAttribute("autotizacion")) == null) {
        response.sendRedirect("login.jsp");
    }%>

<%@page import="Logica.Controladora"%>
<%@page import="Logica.Huesped"%>
<%@page import="Persistencia.HuespedJpaController"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Habitacion"%>
<%@page import="Persistencia.HabitacionJpaController"%>
<jsp:include page="/encabezado.jsp"/>
<br>
<h2>Datos de la reserva</h2>

<form action="SvTPFinal_verifDispon" method="POST">
    <label>Habitacion:</label>
    <select name="habitacion" id="habitacion" type="text">
        <option>Seleccionar</option>
        <% Controladora control = new Controladora();
            List<Habitacion> listTipo = control.traerHabitacion();
            for (int i = 0; i < listTipo.size(); i++) {
                String dato = listTipo.get(i).getNombre();
                int habitId = listTipo.get(i).getId_habitacion();
                long precio = listTipo.get(i).getPrecio();
                request.getSession().setAttribute("precio", precio);
        %>
        <option value=<%=habitId%>><%=dato%></option>
        <% }%>          
    </select>
    <br>
    <label>Fecha desde:</label>
    <input type="text" name="fechaDesde" placeholder="dd/mm/yyyy">
    <br>
    <label>Fecha hasta:</label>
    <input type="text" name="fechaHasta" placeholder="dd/mm/yyyy">
    <br>
    <input class="boton" type="submit" value="Disponibilidad ?">
    <br>
    <br>



</form>

</body>
</html>