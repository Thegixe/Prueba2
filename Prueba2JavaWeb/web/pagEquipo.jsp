<%-- 
    Document   : pagEquipo
    Created on : 29-may-2020, 16:41:16
    Author     : TheGixe
--%>

<%@page import="modelos.Equipo"%>
<%@page import="modelos.Division"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estadio"%>
<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Equipo</title>
    </head>
    <% if(session.getAttribute("usuario")!=null){ 
        Usuario u =(Usuario) session.getAttribute("usuario");%>
    <body>
    <center>
        
        <h2>Registrar Equipo</h2>
        <form action ="ControlEquipo" method="post">
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Procedencia</td>
                    <td>Estadio</td>
                    <td>Division</td>
                    
                </tr>
                <tr>
                    <td><input type="text" name="idEquipo" value=""/></td> 
                    <td><input type="text" name="nombre" value=""/></td>
                    <td><input type="text" name="procedencia" value=""/></td>
                    
                    
                    <% try{
                    Estadio estadio = new Estadio(); 
                    ArrayList<Estadio> estadios = estadio.obtenerEstadios(); 
                    %>
                <td>
                    <select name="idEstadio">
                        <% for(Estadio es:estadios){%>
                        <option value="<%=es.getIdEstadio()%>"> 
                            <%= es.getNombre()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                    
                    <% try{
                    Division division = new Division(); 
                    ArrayList<Division> divisiones = division.obtenerDivisiones(); 
                    %>
                <td>
                    <select name="idDivision">
                        <% for(Division di:divisiones){%>
                        <option value="<%=di.getIdDivision()%>"> 
                            <%= di.getNombre()%>
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
        
        
        
        <h2>Mantenedor de Equipos</h2>
        
        <table border="1"  >
                <tr boder ="2">
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Procedencia</td>
                    <td>Estadio</td>
                    <td>ubicacion estadio</td>
                    <td>Division</td>
                </tr>
                
        <% ArrayList<Equipo> equipos = new Equipo().obtenerEquipos();
               
            for(Equipo e:equipos){
            %>
            <tr border="1">
                <td><%= e.getIdEquipo()%></td>
                <td><%= e.getNombre()%></td>
                <td><%= e.getProcedencia()%></td>
                <td><%= e.getEstadio().getNombre() %></td>
                <td><%= e.getEstadio().getCiudad().getNombre() %></td>
                <td><%= e.getDivision().getNombre() %></td>
                
                <td><a href="modificarEquipo.jsp?idEquipo=<%=e.getIdEquipo()%>">
                        <input type="button" value="Modificar" />
                    </a>
                        </td>
                        <td>
                    <a href="eliminarEquipo.jsp?idEquipo=<%=e.getIdEquipo()%>">
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