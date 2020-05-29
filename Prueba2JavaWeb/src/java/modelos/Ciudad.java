/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


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
    
    
    public String registrar() throws SQLException{
        if(validarCiudad()){
            return "Ciudad ya está registrada";
        }else{
        String sentencia = "insert into ciudades values('"+idCiudad+"','"+nombre+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Ciudad registrada";
        }else{
            return "No se pudo registrar la Ciudad";
        }
        }
    }
    
    public boolean validarCiudad() throws SQLException{
        String sentencia = "select * from ciudades where id_ciudad='"+idCiudad+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    
    public ArrayList<Ciudad> obtenerCiudades() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from ciudades order by id_ciudad";
        ArrayList<Ciudad> ciudad = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            ciudad.add(new Ciudad(rs.getString("id_ciudad"),rs.getString("nombre")));
        }
        return ciudad;
    }
    
    public Ciudad obtenerCiudad(String idCiudad) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from ciudades where id_ciudad='"+idCiudad+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Ciudad c = new Ciudad();
        if(rs.next()){
            c.setIdCiudad(rs.getString("id_ciudad"));
            c.setNombre(rs.getString("nombre"));
                        
        }
        return c;
    }
    
    public String modificar() throws SQLException{
        if(validarCiudad()){
            String sentencia = "update ciudades set nombre = '"+nombre+"'"
                    + "where id_ciudad = '"+idCiudad+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Ciudad modificada";
        }else{
            return "No se pudo modificar la Ciudad";
        }
        }else{
            return "La Ciudad no existe";
        }
    }
    
     public String eliminar() throws SQLException{
        if(validarCiudad()){
            String sentencia = "delete from ciudades where id_ciudad = '"+idCiudad+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Ciudad eliminada";
        }else{
            return "No se pudo eliminar la Ciudad";
        }
        }else{
            return "la Ciudad no existe";
        }
    }
    
    
    
}
