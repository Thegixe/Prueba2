<%-- 
    Document   : eliminarDivision
    Created on : 29-may-2020, 18:17:33
    Author     : TheGixe
--%>

<%@page import="modelos.Division"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Division</title>
    </head>
    <body> <center>
        <h1>Cambie los datos a modificar</h1>
        <form action="ControlDivision" method="post">
            <% String idDivision = request.getParameter("idDivision");
               Division d = new Division().obtenerDivision(idDivision);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idDivision" value="<%= d.getIdDivision()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= d.getNombre()%>"readonly="true"  /></td>
                    </tr>
                    <tr>
                        <td><a href="pagDivision.jsp">Volver</a></td>
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
