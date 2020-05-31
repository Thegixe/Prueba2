<%-- 
    Document   : modificarEquipo
    Created on : 31-may-2020, 16:20:27
    Author     : TheGixe
--%>

<%@page import="modelos.Division"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Estadio"%>
<%@page import="modelos.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(session.getAttribute("usuario")!=null){%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Equipo</title>
    </head>
    <body> <center>
        <h1>Cambie los datos a modificar</h1>
        <form action="ControlEquipo" method="post">
            <% String idEquipo = request.getParameter("idEquipo");
               Equipo e = new Equipo().obtenerEquipo(idEquipo);
            %>
           
           
                <table style="border: 1; ">
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="idEquipo" value="<%= e.getIdEquipo()%>"
                                   readonly="true" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre" value="<%= e.getNombre()%>" /></td>
                    </tr>
                    <tr>
                        <td>Procedencia</td>
                        <td><input type="text" name="procedencia" value="<%= e.getProcedencia()%>" /></td>
                    </tr>
                    
                    <tr>
                    <% try{
                    Estadio estadio = new Estadio(); 
                    ArrayList<Estadio> estadios = estadio.obtenerEstadios(); 
                    %>
                    <td>Estadio</td>
                    <td>
                    <select name="idEstadio">
                        <% for(Estadio es:estadios){%>
                        <option value="<%=es.getIdEstadio()%>" <% if(es.getIdEstadio().equals(e.getEstadio().getIdEstadio()))
                        {out.print("selected='selected'");}%>> 
                            <%= es.getNombre()%>
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
                    <% try{
                    Division division = new Division(); 
                    ArrayList<Division> divisiones = division.obtenerDivisiones(); 
                    %>
                    <td>Division</td>
                    <td>
                    <select name="idDivision">
                        <% for(Division di:divisiones){%>
                        <option value="<%=di.getIdDivision()%>" <% if(di.getIdDivision().equals(e.getDivision().getIdDivision()))
                        {out.print("selected='selected'");}%>> 
                            <%= di.getNombre()%>
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
                        <td><a href="pagEquipo.jsp">Volver</a></td>
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

