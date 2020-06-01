<%-- 
    Document   : intranet
    Created on : 28-may-2020, 19:12:13
    Author     : TheGixe
--%>

<%@page import="modelos.Jugador"%>
<%@page import="modelos.Equipo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Posicion"%>
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
            <td>
                    <a href="Salir">
                        <input type="button" value="Cerrar Sesion"/>
                    </a>
                </td>
        </table>
        
        <br>
        <hr>
        
        
        <h2>Registrar Jugador</h2>
        <form action ="ControlJugador" method="post">
            <table style="border: 1px; border-width: 1px; border-collapse: collapse; border-color:  black;">
                <tr>
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Nacimiento(ej: 1990-02-01)</td>
                    <td>Posición</td>
                    <td>Sueldo anual (Dolares)</td>
                    <td>Equipo</td>
                    
                </tr>
                <tr>
                    <td><input type="text" name="idJugador" value=""/></td> 
                    <td><input type="text" name="nombre" value=""/></td>
                    <td><input type="text" name="apellido" value=""/></td>
                    <td><input type="text" name="edad" value=""/></td>
                    
                    
                    <% try{
                    Posicion posicion = new Posicion(); 
                    ArrayList<Posicion> posiciones = posicion.obtenerPosiciones(); 
                    %>
                <td>
                    <select name="idPosicion">
                        <% for(Posicion po:posiciones){%>
                        <option value="<%=po.getIdPosicion()%>"> 
                            <%= po.getNombre()%>
                        </option>
                        <% }%>
                    </select>
                </td>
                <%
                            }catch(Exception e){ 
                                out.println(e.getMessage());
                            } %>
                            
                    <td><input type="text" name="sueldo" value=""/></td>        
                            
                    
                    <% try{
                    Equipo equipo = new Equipo(); 
                    ArrayList<Equipo> equipos = equipo.obtenerEquipos(); 
                    %>
                <td>
                    <select name="idEquipo">
                        <% for(Equipo eq:equipos){%>
                        <option value="<%=eq.getIdEquipo()%>"> 
                            <%= eq.getNombre()%>
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
        
        
        <h2>Mantenedor de Jugadores</h2>
        
        <table border="1"  >
                <tr boder ="2">
                    <td>ID</td>
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Edad</td>
                    <td>Posicion</td>
                    <td>Sueldo</td>
                    <td>Equipo</td>
                    <td>Estadio del equipo</td>
                </tr>
                
        <% ArrayList<Jugador> jugadores = new Jugador().obtenerJugadores();
               
            for(Jugador j:jugadores){
            %>
            <tr border="1">
                <td><%= j.getIdJugador()%></td>
                <td><%= j.getNombre()%></td>
                <td><%= j.getApellido()%></td>
                <td><%= j.getEdad()%></td>
                <td><%= j.getPosicion().getNombre() %></td>
                <td><%= j.getSueldo()%></td>
                <td><%= j.getEquipo().getNombre() %></td>
                <td><%= j.getEquipo().getEstadio().getNombre() %></td>
                
                
                <td><a href="modificarJugador.jsp?idJugador=<%=j.getIdJugador()%>">
                        <input type="button" value="Modificar" />
                    </a>
                        </td>
                        <td>
                    <a href="eliminarJugador.jsp?idJugador=<%=j.getIdJugador()%>">
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
