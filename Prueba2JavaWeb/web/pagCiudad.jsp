<%-- 
    Document   : pagCiudad
    Created on : 29-may-2020, 16:39:52
    Author     : TheGixe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Ciudad"%>
<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Ciudad</title>
    </head>
    <% if(session.getAttribute("usuario")!=null){ 
        Usuario u =(Usuario) session.getAttribute("usuario");%>
    <body>
    <center>
        
        <h2>Registrar Ciudad</h2>
        <form action ="ControlCiudad" method="post">
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                </tr>
                <tr>
                    <td><input type="text" name="idCiudad" value=""/></td> 
                    <td><input type="text" name="nombre" value=""/></td>
                    <td><input type="submit" value="Agregar" /> </td>  
                   
                </tr>
            </table>
            <input type="hidden" name="accion" value="1"/>
        </form>
        <a href="intranet.jsp">Volver</a>
        
        <h2>Mantenedor de Ciudades</h2>
        
        <table  >
                <tr>
                    <td >ID</td>
                    <td>Nombre</td>
                </tr>
                
        <% ArrayList<Ciudad> ciudad= new Ciudad().obtenerCiudades(); %>  
                
        <%for(Ciudad c:ciudad){%> 
                <tr border="1">
                <td><%=c.getIdCiudad()%></td>
                <td><%=c.getNombre() %></td>
               
                <td><a href="modificarCiudad.jsp?idCiudad=<%=c.getIdCiudad()%>">
                        <input type="button" value="Modificar" />
                    </a>
                        </td>
                        <td>
                    <a href="eliminarCiudad.jsp?idCiudad=<%=c.getIdCiudad()%>">
                        <input type="button" value="Eliminar" />
                    </a>
                </td>
            </tr>
                <%}%> 
            
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
