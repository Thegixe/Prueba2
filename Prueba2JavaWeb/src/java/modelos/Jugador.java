
package modelos;

import java.sql.SQLException;


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
    
    
    
    
    
    
}
