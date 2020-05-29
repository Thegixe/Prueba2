/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.SQLException;


public class Posicion {
    private String idPosicion;
    private String nombre;
    private Conexion conexion;

    public Posicion(Conexion conexion) throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Posicion(String idPosicion, String nombre) throws ClassNotFoundException, SQLException {
        this.idPosicion = idPosicion;
        this.nombre = nombre;
        conexion = new Conexion();
    }

    public String getIdPosicion() {
        return idPosicion;
    }

    public void setIdPosicion(String idPosicion) {
        this.idPosicion = idPosicion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    
    
    
    
    
    
    
}
