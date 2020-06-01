
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Jugador {
    private String idJugador;
    private String nombre;
    private String apellido;
    private String edad;
    private Posicion posicion;
    private String sueldo;
    private Equipo equipo;
    private Conexion conexion;

    public Jugador() throws SQLException, ClassNotFoundException {
        conexion = new Conexion();
        posicion = new Posicion();
        equipo = new Equipo();
    }

    public Jugador(String idJugador, String nombre, String apellido, String edad, Posicion posicion, String sueldo, Equipo equipo) throws ClassNotFoundException, SQLException {
        this.idJugador = idJugador;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.posicion = posicion;
        this.sueldo = sueldo;
        this.equipo = equipo;
        conexion = new Conexion();
    }

    public String getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(String idJugador) {
        this.idJugador = idJugador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public Posicion getPosicion() {
        return posicion;
    }

    public void setPosicion(Posicion posicion) {
        this.posicion = posicion;
    }

    public String getSueldo() {
        return sueldo;
    }

    public void setSueldo(String sueldo) {
        this.sueldo = sueldo;
    }

    public Equipo getEquipo() {
        return equipo;
    }

    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }
    
    public String registrar() throws SQLException{
        if(validarJugador()){
            return "El jugador ya existe";
        }else{
        String sentencia = "insert into jugadores values('"+idJugador+"','"+nombre+"','"+apellido+"','"+edad+"','"+posicion.getIdPosicion()+"','"+sueldo+"','"+equipo.getIdEquipo()+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Jugador registrado";
        }else{
            return "No se pudo registrar el Jugador";
        }
        }
    }
    
    public String eliminar() throws SQLException{
        if(validarJugador()){
            String sentencia = "delete from jugadores where id_jugador = '"+idJugador+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Jugador eliminado";
        }else{
            return "No se pudo eliminar el Jugador";
        }
        }else{
            return "El Jugador no existe";
        }
    }
    public String modificar() throws SQLException{
        if(validarJugador()){
            String sentencia = "update jugadores set nombre = '"+nombre+"',apellido = '"+apellido+"',edad = '"+edad+"', "
                    + "id_posicion = '"+posicion.getIdPosicion()+"',"
                    + "sueldo anual = '"+sueldo+"',"
                    + "id_equipo = '"+equipo.getIdEquipo()+"' "
                    + "where id_jugador = '"+idJugador+"'";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Jugador modificado";
        }else{
            return "No se pudo modificar el Jugador";
        }
        }else{
            return "El Jugador no existe";
        }
    }
    public boolean validarJugador() throws SQLException{
        String sentencia = "select * from jugadores where id_jugador='"+idJugador+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    
    public ArrayList<Jugador> obtenerJugadores() throws SQLException, ClassNotFoundException{
        String sentencia = "select * from jugadores order by id_jugador";
        ArrayList<Jugador> jugadores = new ArrayList();
        ResultSet rs = conexion.consultarSQL(sentencia);
        while(rs.next()){
            jugadores.add(new Jugador(rs.getString("id_jugador"),rs.getString("nombre"),rs.getString("apellido"),rs.getString("edad"),
                    posicion.obtenerPosicion(rs.getString("id_posicion")),rs.getString("sueldo anual"),equipo.obtenerEquipo(rs.getString("id_equipo"))));
        }
        return jugadores;
    }
    public Jugador obtenerJugador(String idJugador) throws SQLException, ClassNotFoundException{
        String sentencia = "select * from jugadores where id_jugador='"+idJugador+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        Jugador j = new Jugador();
        if(rs.next()){
            j.setIdJugador(rs.getString("id_jugador"));
            j.setNombre(rs.getString("nombre"));
            j.setApellido(rs.getString("apellido"));
            j.setEdad(rs.getString("edad"));
            j.setPosicion((posicion.obtenerPosicion(rs.getString("id_posicion"))));
            j.setSueldo(rs.getString("sueldo anual"));
            j.setEquipo((equipo.obtenerEquipo(rs.getString("id_equipo"))));            
        }
        return j;
    }
    
    
    
    
}
