<%-- 
    Document   : pagPosicion
    Created on : 29-may-2020, 16:40:50
    Author     : TheGixe
--%>

<%@page import="modelos.Posicion"%>
<%@page import="java.util.ArrayList"%>
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
        
        <h2>Registrar Posiciones</h2>
        <form action ="ControlPosicion" method="post">
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                </tr>
                <tr>
                    <td><input type="text" name="idPosicion" value=""/></td> 
                    <td><input type="text" name="nombre" value=""/></td>
                    <td><input type="submit" value="Agregar" /> </td>  
                   
                </tr>
            </table>
            <input type="hidden" name="accion" value="1"/>
        </form>
        <a href="intranet.jsp">Volver</a>
        
        <h2>Mantenedor de Posiciones</h2>
        
        <table  >
                <tr>
                    <td >ID</td>
                    <td>Nombre</td>
                </tr>
                
        <% ArrayList<Posicion> posicion= new Posicion().obtenerPosiciones(); %>  
                
        <%for(Posicion p: posicion){%> 
                <tr border="1">
                <td><%=p.getIdPosicion()%></td>
                <td><%=p.getNombre() %></td>
               
                <td><a href="modificarPosicion.jsp?idPosicion=<%=p.getIdPosicion()%>">
                        <input type="button" value="Modificar" />
                    </a>
                        </td>
                        <td>
                    <a href="eliminarPosicion.jsp?idPosicion=<%=p.getIdPosicion()%>">
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

