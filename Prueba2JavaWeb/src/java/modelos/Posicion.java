/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Posicion {
    private String idPosicion;
    private String nombre;
    private Conexion conexion;

    public Posicion() throws ClassNotFoundException, SQLException {
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
    
    
    
    public String registrar() throws SQLException{
        if(validarPosicion()){
            return "Esta Posicion ya está registrada";
        }else{
        String sentencia = "insert into posiciones values('"+idPosicion+"','"+nombre+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Posicion registrada";
        }else{
            return "No se pudo registrar la Posicion";
        }
        }
    }
    
    public boolean validarPosicion() throws SQLException{
        String sentencia = "select * from posiciones where id_posicion='"+idPosicion+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    
    public ArrayList<Posicion> obtenerPosiciones() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from posiciones order by id_posicion";
        ArrayList<Posicion> posicion = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            posicion.add(new Posicion(rs.getString("id_posicion"),rs.getString("nombre")));
        }
        return posicion;
    }
    
    public Posicion obtenerPosicion(String idPosicion) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from posiciones where id_posicion='"+idPosicion+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Posicion p = new Posicion();
        if(rs.next()){
            p.setIdPosicion(rs.getString("id_posicion"));
            p.setNombre(rs.getString("nombre"));
                        
        }
        return p;
    }
    
    public String modificar() throws SQLException{
        if(validarPosicion()){
            String sentencia = "update posiciones set nombre = '"+nombre+"'"
                    + "where id_posicion = '"+idPosicion+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Posicion modificada";
        }else{
            return "No se pudo modificar la Posicion";
        }
        }else{
            return "La Posicion no existe";
        }
    }
    
     public String eliminar() throws SQLException{
        if(validarPosicion()){
            String sentencia = "delete from posiciones where id_posicion = '"+idPosicion+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Posicion eliminada";
        }else{
            return "No se pudo eliminar la Posicion";
        }
        }else{
            return "la Posicion no existe";
        }
    }
    
    
    
    
    
    
}
