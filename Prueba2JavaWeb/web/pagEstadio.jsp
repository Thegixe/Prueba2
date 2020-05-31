<%-- 
    Document   : pagEstadio
    Created on : 29-may-2020, 16:41:06
    Author     : TheGixe
--%>

<%@page import="modelos.Estadio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Ciudad"%>
<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Estadio</title>
    </head>
    <% if(session.getAttribute("usuario")!=null){ 
        Usuario u =(Usuario) session.getAttribute("usuario");%>
    <body>
    <center>
        
        <h2>Registrar Estadio</h2>
        <form action ="ControlEstadio" method="post">
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Capacidad</td>
                    <td>Ciudad</td>
                    
                </tr>
                <tr>
                    <td><input type="text" name="idEstadio" value=""/></td> 
                    <td><input type="text" name="nombre" value=""/></td>
                    <td><input type="text" name="capacidad" value=""/></td>
                    
                    
                    <% try{
                    Ciudad ciudad = new Ciudad(); 
                    ArrayList<Ciudad> ciudades = ciudad.obtenerCiudades(); 
                    %>
                <td>
                    <select name="idCiudad">
                        <% for(Ciudad ci:ciudades){%>
                        <option value="<%=ci.getIdCiudad()%>"> 
                            <%= ci.getNombre()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                    
                    
                            
                    <td><input type="submit" value="Agregar" /> </td>  
                   
                </tr>
            </table>
            <input type="hidden" name="accion" value="1"/>
        </form>
        <a href="intranet.jsp">Volver</a>
        
        
        
        <h2>Mantenedor de Estadios</h2>
        
        <table  >
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Ciudad</td>
                    <td>Capacidad</td>
                </tr>
                
        <% ArrayList<Estadio> estadios= new Estadio().obtenerEstadios();
               
            for(Estadio e:estadios){
            %>
            <tr border="1">
                <td><%= e.getIdEstadio()%></td>
                <td><%= e.getNombre()%></td>
                <td><%= e.getCiudad().getNombre() %></td>
                <td><%= e.getCapacidad()%></td>
                
                <td><a href="modificarEstadio.jsp?idEstadio=<%=e.getIdEstadio()%>">
                        <input type="button" value="Modificar" />
                    </a>
                        </td>
                        <td>
                    <a href="eliminarEstadio.jsp?idEstadio=<%=e.getIdEstadio()%>">
                        <input type="button" value="Eliminar" />
                    </a>
                </td>
            </tr>
            <% } %>
            
            </table>
        
        
        <% if(request.getParameter("mensaje")!=null){%>
        <%=request.getParameter("mensaje") %>
        <%}%>
    </center>
    </body>
     
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
