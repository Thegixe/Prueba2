<%-- 
    Document   : modificarJugador
    Created on : 01-jun-2020, 15:01:28
    Author     : TheGixe
--%>

<%@page import="modelos.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Posicion"%>
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
                        <td><input type="text" name="nombre" value="<%= j.getNombre()%>" /></td>
                    </tr>
                    <tr>
                        <td>Apellido</td>
                        <td><input type="text" name="apellido" value="<%= j.getApellido()%>" /></td>
                    </tr>
                    <tr>
                        <td>Edad</td>
                        <td><input type="text" name="edad" value="<%= j.getEdad()%>" /></td>
                    </tr>
                    
                    <tr>
                    <% try{
                    Posicion posicion = new Posicion(); 
                    ArrayList<Posicion> posiciones = posicion.obtenerPosiciones(); 
                    %>
                    <td>Posición</td>
                    <td>
                    <select name="idPosicion">
                        <% for(Posicion po:posiciones){%>
                        <option value="<%=po.getIdPosicion()%>" <% if(po.getIdPosicion().equals(j.getPosicion().getIdPosicion()))
                        {out.print("selected='selected'");}%>> 
                            <%= po.getNombre()%>
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
                        <td>Sueldo anual</td>
                        <td><input type="text" name="sueldo" value="<%= j.getSueldo()%>" /></td>
                    </tr>
                            
                    <tr>
                    <% try{
                    Equipo equipo = new Equipo(); 
                    ArrayList<Equipo> equipos = equipo.obtenerEquipos(); 
                    %>
                    <td>Equipo</td>
                    <td>
                    <select name="idEquipo">
                        <% for(Equipo eq:equipos){%>
                        <option value="<%=eq.getIdEquipo()%>" <% if(eq.getIdEquipo().equals(j.getEquipo().getIdEquipo()))
                        {out.print("selected='selected'");}%>> 
                            <%= eq.getNombre()%>
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
                        <td><a href="intranet.jsp">Volver</a></td>
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
