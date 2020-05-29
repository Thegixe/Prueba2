
package modelos;

import java.sql.SQLException;


public class Equipo {
    private String idEquipo;
    private String nombre;
    private String procedencia;
    private Estadio estadio;
    private Division division;
    private Conexion conexion;

    public Equipo() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
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
    
    
    
    
    
}
