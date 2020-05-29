<%-- 
    Document   : modificarPosicion
    Created on : 29-may-2020, 18:30:46
    Author     : TheGixe
--%>

<%@page import="modelos.Posicion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Posicion</title>
    </head>
    <body> <center>
        <h1>Cambie los datos a modificar</h1>
        <form action="ControlPosicion" method="post">
            <% String idPosicion = request.getParameter("idPosicion");
               Posicion p = new Posicion().obtenerPosicion(idPosicion);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idPosicion" value="<%= p.getIdPosicion()%>" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= p.getNombre()%>" /></td>
                    </tr>
                    <tr>
                        <td><a href="pagPosicion.jsp">Volver</a></td>
                        <td><input type="submit" value="Modificar"/></td>
                    </tr>
                    <input type="hidden" name="accion" value="2"/>
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
