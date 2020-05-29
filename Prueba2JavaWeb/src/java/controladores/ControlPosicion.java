/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Posicion;

/**
 *
 * @author TheGixe
 */
@WebServlet(name = "ControlPosicion", urlPatterns = {"/ControlPosicion"})
public class ControlPosicion extends HttpServlet {

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
            response.sendRedirect("pagPosicion.jsp?mensaje=Complete todos los campos");
        }
    }
    
    
    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException{
        String idPosicion = request.getParameter("idPosicion").trim();
        String nombre = request.getParameter("nombre").trim();
        if(idPosicion.isEmpty()||nombre.isEmpty()){
            response.sendRedirect("pagPosicion.jsp?mensaje=Complete todos los campos");
        }else{
            Posicion p = new Posicion(idPosicion,nombre);
            response.sendRedirect("pagPosicion.jsp?mensaje="+p.registrar());
            
                
            }
    }
    
    private void modificar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            String idPosicion = request.getParameter("idPosicion").trim();
            String nombre = request.getParameter("nombre").trim();
            Posicion p = new Posicion(idPosicion,nombre);
            response.sendRedirect("pagPosicion.jsp?mensaje="+p.modificar());
         } catch (Exception e) {
                response.sendRedirect("pagPosicion.jsp?mensaje="+e.getMessage());
            }
    }
    
    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            String idPosicion = request.getParameter("idPosicion").trim();
            Posicion p = new Posicion();
            p.setIdPosicion(idPosicion);
            response.sendRedirect("pagPosicion.jsp?mensaje="+p.eliminar());
         } catch (Exception e) {
                response.sendRedirect("pagDivision.jsp?mensaje="+e.getMessage());
            }
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
