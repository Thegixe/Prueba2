/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.SQLException;


public class Estadio {
    private String idEstadio;
    private String nombre;
    private Ciudad ciudad;
    private String capacidad;
    private Conexion conexion;

    public Estadio() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Estadio(String idEstadio, String nombre, Ciudad ciudad, String capacidad) throws ClassNotFoundException, SQLException {
        this.idEstadio = idEstadio;
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.capacidad = capacidad;
        conexion = new Conexion();
    }

    public String getIdEstadio() {
        return idEstadio;
    }

    public void setIdEstadio(String idEstadio) {
        this.idEstadio = idEstadio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    public String getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(String capacidad) {
        this.capacidad = capacidad;
    }
    
    
    
    
    
    
    
}
