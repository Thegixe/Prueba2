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
        
        
    </center>
        
        
        
    </body>
    <% }else{
    response.sendRedirect("index.jsp?mensaje=acceso denegado");
    }%>
</html>
