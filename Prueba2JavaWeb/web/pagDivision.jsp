<%-- 
    Document   : pagDivision
    Created on : 29-may-2020, 16:40:30
    Author     : TheGixe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Division"%>
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
        
        <h2>Registrar Division</h2>
        <form action ="ControlDivision" method="post">
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                </tr>
                <tr>
                    <td><input type="text" name="idDivision" value=""/></td> 
                    <td><input type="text" name="nombre" value=""/></td>
                    <td><input type="submit" value="Agregar" /> </td>  
                   
                </tr>
            </table>
            <input type="hidden" name="accion" value="1"/>
        </form>
        <a href="intranet.jsp">Volver</a>
        
        <h2>Mantenedor de Divisiones</h2>
        
        <table  >
                <tr>
                    <td >ID</td>
                    <td>Nombre</td>
                </tr>
                
        <% ArrayList<Division> division= new Division().obtenerDivisiones(); %>  
                
        <%for(Division d: division){%> 
                <tr border="1">
                <td><%=d.getIdDivision()%></td>
                <td><%=d.getNombre() %></td>
               
                <td><a href="modificarDivision.jsp?idDivision=<%=d.getIdDivision()%>">
                        <input type="button" value="Modificar" />
                    </a>
                        </td>
                        <td>
                    <a href="eliminarDivision.jsp?idDivision=<%=d.getIdDivision()%>">
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
