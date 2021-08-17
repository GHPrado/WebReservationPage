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

<form action="SvTPFinal_reserva" method="POST">
    <label>Habitacion:</label>
    <select name="habitacion" id="habitacion" type="text">
        <option>Seleccionar</option>
                <% Controladora control = new Controladora();
                    List<Habitacion> listTipo = control.traerHabitacion();
                    for (int i = 0; i < listTipo.size(); i++) {
                        String dato = listTipo.get(i).getNombre();
                        int habitId = listTipo.get(i).getId_habitacion();
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
    <input type="hidden" name="myHabitId" value="${habitacion}">
    <input class="boton" type="submit" value="Disponibilidad?">
</form>
<br>
<p style="font-size: 30px; color: red; margin-left: 50px""> IMPORTANTE!!</p>
<p style="font-size: 25px; color: red; margin-left: 100px"> ADVERTIR AL HUESPED QUE EN ESTA HABITACION NO SE ADMITEN MAS DE 2 HUESPEDES</p>
<p style="font-size: 25px; color: red; margin-left: 100px"> EL TOTAL A ABONAR POR LA ESTADIA SOLICITADA SERA DE $10.000.-</p>
<br>
<form action="SvTPFinal_reserva" method="POST">
    <label>Huesped:</label>
    <select name="huesped" id="huesped" type="Huesped">
        <option>Seleccionar</option>
        <% HuespedJpaController CHuesped = new HuespedJpaController(); %>
        <% List<Huesped> listHuesped = CHuesped.findHuespedEntities(); %>
        <% for (int i = 0; i < listHuesped.size(); i++) {
                        int huespedId = listHuesped.get(i).getId_huesped();
                        String dato = listHuesped.get(i).getNombre();%>
        <option value=<%=huespedId%>><%=dato%></option>
        <% }
        %>          
    </select>                
    <br>
        <input type="hidden" name="fechaDesde" value="fechaDesde">
    <input type="hidden" name="fechaDesde" value="fechaHasta">

    <input class="boton" type="submit" value="Registrar">
</form>

</body>
</html>