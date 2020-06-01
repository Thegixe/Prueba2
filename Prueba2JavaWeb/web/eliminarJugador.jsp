<%-- 
    Document   : eliminarJugador
    Created on : 01-jun-2020, 15:05:30
    Author     : TheGixe
--%>

<%@page import="modelos.Jugador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Jugador</title>
    </head>
    <body> <center>
        <h1>Cambie los datos a modificar</h1>
        <form action="ControlJugador" method="post">
            <% String idJugador = request.getParameter("idJugador");
               Jugador j = new Jugador().obtenerJugador(idJugador);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idJugador" value="<%= j.getIdJugador()%>"
                                   readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= j.getNombre()%>" readonly="true"  /></td>
                    </tr>
                    <tr>
                        <td>Apellido</td>
                        <td><input type="text" name="apellido" value="<%= j.getApellido()%>" readonly="true"  /></td>
                    </tr>
                    <tr>
                        <td>Edad</td>
                        <td><input type="text" name="edad" value="<%= j.getEdad()%>" readonly="true"  /></td>
                    </tr>
                   
                    <tr>
                        <td>Posicion</td>
                        <td><input type="text" name="posicion" value="<%= j.getPosicion().getNombre() %>" readonly="true"  /></td>
                    </tr>
                    <tr>
                        <td>Sueldo anual</td>
                        <td><input type="text" name="sueldo" value="<%= j.getSueldo()%>" readonly="true"   /></td>
                    </tr>
                    <tr>
                        <td>Equipo</td>
                        <td><input type="text" name="equipo" value="<%= j.getEquipo().getNombre() %>" readonly="true"  /></td>
                    </tr>
                            
                        
                    
                    <tr>
                        <td><a href="intranet.jsp">Volver</a></td>
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

