<%-- 
    Document   : intranet
    Created on : 28-may-2020, 19:12:13
    Author     : TheGixe
--%>

<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% if(session.getAttribute("usuario")!=null){ 
        Usuario u =(Usuario) session.getAttribute("usuario");%>
    <body>
    <center>
        <h1>Bienvenido <%= u.getNombre()+" "+u.getApellido() %></h1>
        <hr>
        <h3>Ingresar a:</h3>
        <table border="1">
            
            <tr>
                <td align="center"><p><a href="pagCiudad.jsp"><button>Ciudad</button></a></p></td>
                <td align="center"><p><a href="pagDivision.jsp"><button>División</button></a></p></td>
                <td align="center"><p><a href="pagPosicion.jsp"><button>Posición</button></a></p></td>
                <td align="center"><p><a href="pagEstadio.jsp"><button>Estadio</button></a></p></td>
            </tr>
        </table>
        <table border="1">
            <tr>
                <td align="center"><p><a href="pagEquipo.jsp"><button>Equipo</button></a></p></td>
            </tr>
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
