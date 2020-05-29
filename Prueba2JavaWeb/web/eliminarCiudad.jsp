<%-- 
    Document   : eliminarCiudad
    Created on : 29-may-2020, 17:26:22
    Author     : TheGixe
--%>

<%@page import="modelos.Ciudad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Ciudad</title>
    </head>
    <body> <center>
        <h1>Eliminar datos</h1>
        <form action="ControlCiudad" method="post">
            <% String idCiudad = request.getParameter("idCiudad");
               Ciudad c = new Ciudad().obtenerCiudad(idCiudad);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idCiudad" value="<%= c.getIdCiudad()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= c.getNombre()%>" readonly="true"  /></td>
                    </tr>
                    <tr>
                        <td><a href="pagCiudad.jsp">Volver</a></td>
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

