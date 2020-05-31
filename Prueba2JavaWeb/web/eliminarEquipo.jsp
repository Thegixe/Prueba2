<%-- 
    Document   : EliminarEquipo
    Created on : 31-may-2020, 16:20:39
    Author     : TheGixe
--%>

<%@page import="modelos.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Equipo</title>
    </head>
    <body> <center>
        <h1>Eliminar Datos</h1>
        <form action="ControlEquipo" method="post">
            <% String idEquipo = request.getParameter("idEquipo");
               Equipo e = new Equipo().obtenerEquipo(idEquipo);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idEquipo" value="<%= e.getIdEquipo()%>"
                                   readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= e.getNombre()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Procedencia</td>
                        <td><input type="text" name="procedencia" value="<%= e.getProcedencia()%>" readonly="true" /></td>
                    </tr>
                     
                    
                                       
                      
                    
                    <tr>
                        <td><a href="pagEquipo.jsp">Volver</a></td>
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

