/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    
    public String registrar() throws SQLException{
        if(validarDivision()){
            return "Esta División ya está registrada";
        }else{
        String sentencia = "insert into divisiones values('"+idDivision+"','"+nombre+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Division registrada";
        }else{
            return "No se pudo registrar la División";
        }
        }
    }
    
    public boolean validarDivision() throws SQLException{
        String sentencia = "select * from divisiones where id_division='"+idDivision+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    
    public ArrayList<Division> obtenerDivisiones() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from divisiones order by id_division";
        ArrayList<Division> division = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            division.add(new Division(rs.getString("id_division"),rs.getString("nombre")));
        }
        return division;
    }
    
    public Division obtenerDivision(String idDivision) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from divisiones where id_division='"+idDivision+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Division d = new Division();
        if(rs.next()){
            d.setIdDivision(rs.getString("id_division"));
            d.setNombre(rs.getString("nombre"));
                        
        }
        return d;
    }
    
    public String modificar() throws SQLException{
        if(validarDivision()){
            String sentencia = "update divisiones set nombre = '"+nombre+"'"
                    + "where id_division = '"+idDivision+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Division modificada";
        }else{
            return "No se pudo modificar la Division";
        }
        }else{
            return "La Division no existe";
        }
    }
    
     public String eliminar() throws SQLException{
        if(validarDivision()){
            String sentencia = "delete from divisiones where id_division = '"+idDivision+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Division eliminada";
        }else{
            return "No se pudo eliminar la Division";
        }
        }else{
            return "la Division no existe";
        }
    }
    
    
    
    
    
    
    
    
    
    
}
