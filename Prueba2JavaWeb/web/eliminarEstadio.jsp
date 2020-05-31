<%-- 
    Document   : eliminarEstadio
    Created on : 30-may-2020, 18:56:33
    Author     : TheGixe
--%>

<%@page import="modelos.Estadio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Estadio</title>
    </head>
    <body> <center>
        <h1>Eliminar Datos</h1>
        <form action="ControlEstadio" method="post">
            <% String idEstadio = request.getParameter("idEstadio");
               Estadio e = new Estadio().obtenerEstadio(idEstadio);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idEstadio" value="<%= e.getIdEstadio()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= e.getNombre()%>" readonly="true" /></td>
                    </tr>
                    
                    <tr>
                        <td>Ciudad</td>
                        <td><input type="text" name="ciudad" value="<%= e.getCiudad().getNombre() %>" readonly="true" /></td>
                    </tr>
                    
                    <tr>
                        <td>Capacidad</td>
                        <td><input type="text" name="capacidad" value="<%= e.getCapacidad()%>" readonly="true" /></td>
                    </tr>
                    
                    
                    <tr>
                        <td><a href="pagEstadio.jsp">Volver</a></td>
                        <td><input type="submit" value="Eliminar"/></td>
                    </tr>
                    <input type="hidden" name="accion" value="3"/>
                </table> 
           <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
        </form></center>
    </body>
</html>
<% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
}%>

