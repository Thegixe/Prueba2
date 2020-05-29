/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Division {
    private String idDivision;
    private String nombre;
    private Conexion conexion;

    public Division() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Division(String idDivision, String nombre) throws ClassNotFoundException, SQLException {
        this.idDivision = idDivision;
        this.nombre = nombre;
        conexion = new Conexion();
        
    }

    public String getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(String idDivision) {
        this.idDivision = idDivision;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    
    
    
    
    
    
    
    
}
