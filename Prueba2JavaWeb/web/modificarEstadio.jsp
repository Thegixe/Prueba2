<%-- 
    Document   : modificarEstadio
    Created on : 30-may-2020, 18:56:19
    Author     : TheGixe
--%>

<%@page import="modelos.Ciudad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estadio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Estadio</title>
    </head>
    <body> <center>
        <h1>Cambie los datos a modificar</h1>
        <form action="ControlEstadio" method="post">
            <% String idEstadio = request.getParameter("idEstadio");
               Estadio e = new Estadio().obtenerEstadio(idEstadio);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idEstadio" value="<%= e.getIdEstadio()%>"
                                   readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= e.getNombre()%>" /></td>
                    </tr>
                    
                    <tr>
                    <% try{
                    Ciudad ciudad = new Ciudad(); 
                    ArrayList<Ciudad> ciudades = ciudad.obtenerCiudades(); 
                    %>
                    <td>Ciudad</td>
                    <td>
                    <select name="idCiudad">
                        <% for(Ciudad ci:ciudades){%>
                        <option value="<%=ci.getIdCiudad()%>" <% if(ci.getIdCiudad().equals(e.getCiudad().getIdCiudad()))
                        {out.print("selected='selected'");}%>> 
                            <%= ci.getNombre()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception ex){ 
                                out.println(ex.getMessage());
                            } %>
                            </tr>
                    
                    <tr>
                        <td>Capacidad</td>
                        <td><input type="text" name="capacidad" value="<%= e.getCapacidad()%>"/></td>
                    </tr>
                    
                    
                    <tr>
                        <td><a href="pagEstadio.jsp">Volver</a></td>
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
