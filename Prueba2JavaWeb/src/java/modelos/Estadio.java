/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Estadio {
    private String idEstadio;
    private String nombre;
    private Ciudad ciudad;
    private String capacidad;
    private Conexion conexion;

    public Estadio() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
        ciudad = new Ciudad();
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
    
    public String registrar() throws SQLException{
        if(validarEstadio()){
            return "El estadio ya existe";
        }else{
        String sentencia = "insert into estadios values('"+idEstadio+"','"+nombre+"','"+ciudad.getIdCiudad()+"','"+capacidad+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Estadio registrado";
        }else{
            return "No se pudo registrar el Estadio";
        }
        }
    }
    
    public String eliminar() throws SQLException{
        if(validarEstadio()){
            String sentencia = "delete from estadios where id_estadio = '"+idEstadio+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Estadio eliminado";
        }else{
            return "No se pudo eliminar el estadio";
        }
        }else{
            return "El estadio no existe";
        }
    }
    public String modificar() throws SQLException{
        if(validarEstadio()){
            String sentencia = "update estadios set nombre = '"+nombre+"',id_ciudad = '"+ciudad.getIdCiudad()+"',"
                    + "capacidad="+capacidad+" "
                    + "where id_estadio = '"+idEstadio+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Estadio modificado";
        }else{
            return "No se pudo modificar el estadio";
        }
        }else{
            return "El estadio no existe";
        }
    }
    public boolean validarEstadio() throws SQLException{
        String sentencia = "select * from estadios where id_estadio='"+idEstadio+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    
    public ArrayList<Estadio> obtenerEstadios() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from estadios order by id_estadio";
        ArrayList<Estadio> estadios = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            estadios.add(new Estadio(rs.getString("id_estadio"),rs.getString("nombre"),
                    ciudad.obtenerCiudad(rs.getString("id_ciudad")),rs.getString("capacidad")));
        }
        return estadios;
    }
    public Estadio obtenerVehiculo(String idEstadio) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from estadios where id_estadio='"+idEstadio+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Estadio e = new Estadio();
        if(rs.next()){
            e.setIdEstadio(rs.getString("id_estadio"));
            e.setNombre(rs.getString("nombre"));
            e.setCiudad((ciudad.obtenerCiudad(rs.getString("id_ciudad"))));
            e.setCapacidad(rs.getString("capacidad"));
            
        }
        return e;
    }
    
    
    
    
    
}
