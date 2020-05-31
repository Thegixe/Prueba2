
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Equipo {
    private String idEquipo;
    private String nombre;
    private String procedencia;
    private Estadio estadio;
    private Division division;
    private Conexion conexion;

    public Equipo() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
        estadio = new Estadio();
        division = new Division();
    }

    public Equipo(String idEquipo, String nombre, String procedencia, Estadio estadio, Division division) throws ClassNotFoundException, SQLException {
        this.idEquipo = idEquipo;
        this.nombre = nombre;
        this.procedencia = procedencia;
        this.estadio = estadio;
        this.division = division;
        conexion = new Conexion();
    }

    public String getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(String idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProcedencia() {
        return procedencia;
    }

    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }

    public Estadio getEstadio() {
        return estadio;
    }

    public void setEstadio(Estadio estadio) {
        this.estadio = estadio;
    }

    public Division getDivision() {
        return division;
    }

    public void setDivision(Division division) {
        this.division = division;
    }
    
    public String registrar() throws SQLException{
        if(validarEquipo()){
            return "El equipo ya existe";
        }else{
        String sentencia = "insert into equipos values('"+idEquipo+"','"+nombre+"','"+procedencia+"','"+estadio.getIdEstadio()+"','"+division.getIdDivision()+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Equipo registrado";
        }else{
            return "No se pudo registrar el Equipo";
        }
        }
    }
    
    public String eliminar() throws SQLException{
        if(validarEquipo()){
            String sentencia = "delete from equipos where id_equipo = '"+idEquipo+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Equipo eliminado";
        }else{
            return "No se pudo eliminar el equipo";
        }
        }else{
            return "El equipo no existe";
        }
    }
    public String modificar() throws SQLException{
        if(validarEquipo()){
            String sentencia = "update equipos set nombre = '"+nombre+"',procedencia = '"+procedencia+"',"
                    + "id_estadio = '"+estadio.getIdEstadio()+"', "
                    + "id_division = '"+division.getIdDivision()+"' "
                    + "where id_equipo = '"+idEquipo+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Equipo modificado";
        }else{
            return "No se pudo modificar el equipo";
        }
        }else{
            return "El equipo no existe";
        }
    }
    public boolean validarEquipo() throws SQLException{
        String sentencia = "select * from equipos where id_equipo='"+idEquipo+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    
    public ArrayList<Equipo> obtenerEquipos() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from equipos order by id_equipo";
        ArrayList<Equipo> equipos = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            equipos.add(new Equipo(rs.getString("id_equipo"),rs.getString("nombre"),rs.getString("procedencia"),
                    estadio.obtenerEstadio(rs.getString("id_estadio")),division.obtenerDivision(rs.getString("id_division"))));
        }
        return equipos;
    }
    public Equipo obtenerEquipo(String idEquipo) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from equipos where id_equipo='"+idEquipo+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Equipo e = new Equipo();
        if(rs.next()){
            e.setIdEquipo(rs.getString("id_equipo"));
            e.setNombre(rs.getString("nombre"));
            e.setProcedencia(rs.getString("procedencia"));
            e.setEstadio((estadio.obtenerEstadio(rs.getString("id_estadio"))));
            e.setDivision((division.obtenerDivision(rs.getString("id_division"))));            
        }
        return e;
    }
    
    
    
    
    
    
    
}
