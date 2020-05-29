/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.SQLException;


public class Ciudad {
    private String idCiudad;
    private String nombre;
    private Conexion conexion;

    public Ciudad() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Ciudad(String idCiudad, String nombre) throws ClassNotFoundException, SQLException {
        this.idCiudad = idCiudad;
        this.nombre = nombre;
        conexion = new Conexion();
    }

    public String getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(String idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    
    
}
