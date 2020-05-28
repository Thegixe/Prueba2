/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;
import modelos.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;



public class Usuario {
    
    private String usuario;
    private String nombre;
    private String apellido;
    private String password;
    private Conexion conexion;

    public Usuario() throws ClassNotFoundException, SQLException {
        conexion = new Conexion();
    }

    public Usuario(String usuario, String nombre, String apellido, String password) throws ClassNotFoundException, SQLException {
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.password = password;
        conexion = new Conexion();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
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
    
    public String registrar() throws SQLException{
        if(validarUsuario()){
            return "El usuario ya existe";
        }else{
        String sentencia = "insert into usuario values('"+usuario+"','"+nombre+"',"
                + "'"+apellido+"','"+password+"')";
        if(conexion.ejecutarSQL(sentencia)==1){
            return "Usuario registrado";
        }else{
            return "No se pudo registrar el usuario";
        }
        }
    }
    public boolean validarUsuario() throws SQLException{
        String sentencia = "select * from usuario where usuario='"+usuario+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        return rs.next();
    }
    public boolean iniciarSesion() throws SQLException{
        String sentencia = "select * from usuario where usuario ='"+usuario+"' "
                + " and password = '"+password+"'";
        ResultSet rs = conexion.consultarSQL(sentencia);
        boolean respuesta = false;
        if(rs.next()){
            respuesta = true;
            setNombre(rs.getString("nombre"));
            setApellido(rs.getString("apellido"));
        }
        return respuesta;
    }
    
}
    
    
