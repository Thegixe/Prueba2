/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Equipo;
import modelos.Jugador;
import modelos.Posicion;

/**
 *
 * @author TheGixe
 */
@WebServlet(name = "ControlJugador", urlPatterns = {"/ControlJugador"})
public class ControlJugador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        String accion = request.getParameter("accion");
        switch(accion){
            case "1": registrar(request,response);
            break;
            case "2": modificar(request,response);
            break;
            case "3": eliminar(request,response);
            break;
        }
        }
        catch(Exception e){
            response.sendRedirect("index.jsp?mensaje=Complete todos los campos");
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try{
            Posicion p = new Posicion();
            Equipo e = new Equipo();
            Jugador j = new Jugador(getString("idJugador",request),
                                    getString("nombre",request),
                                    getString("apellido",request),
                                    getString("edad",request),
                                    p.obtenerPosicion(getString("idPosicion",request)),
                                    getString("sueldo",request),
                                    e.obtenerEquipo(getString("idEquipo",request)));
             response.sendRedirect("intranet.jsp?mensaje="+j.registrar());
        
         } catch (Exception e) {
                response.sendRedirect("intranet.jsp?mensaje="+e.getMessage());
            }
    }
    
    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            Posicion p = new Posicion();
            Equipo e = new Equipo();
            Jugador j = new Jugador(getString("idJugador",request),
                                    getString("nombre",request),
                                    getString("apellido",request),
                                    getString("edad",request),
                                    p.obtenerPosicion(getString("idPosicion",request)),
                                    getString("sueldo",request),
                                    e.obtenerEquipo(getString("idEquipo",request)));
             response.sendRedirect("intranet.jsp?mensaje="+j.modificar());
         } catch (Exception e) {
                response.sendRedirect("intranet.jsp?mensaje="+e.getMessage());
            }
    }
    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            Jugador j = new Jugador();
            j.setIdJugador(getString("idJugador",request));
            response.sendRedirect("intranet.jsp?mensaje="+j.eliminar());
         } catch (Exception e) {
                response.sendRedirect("intranet.jsp?mensaje="+e.getMessage());
            }
    }
    
    private String getString(String nombre,HttpServletRequest request){
        return request.getParameter(nombre);
    }
    
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
