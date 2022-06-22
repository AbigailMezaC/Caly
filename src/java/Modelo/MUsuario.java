/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author aly
 */
public class MUsuario {
    private int id_usuario;
    private String nom_usu;
    private String appat_usu; 
    private String apmat_usu;
    private String pass_usu;
    private int grupo;
    private int id_rol;


    public MUsuario() {
        }
    
    public MUsuario verificarUsuario(int id_usuario, String pass_usu)throws ClassNotFoundException{
        //objeto de la persona
        MUsuario usuario = null;
        //objeto de conexion
        Connection con = null;
        //Preparacion de la sentencia
        PreparedStatement ps = null;
        //Consultas
        ResultSet rs = null;
        
        try{
            //establecemos la conexion
            con = Conexion.getConnection();
            String q = "select * from musuario where id_usuario=? and pass_usu=?";
            ps = con.prepareStatement(q);
            //preparo la sentencia
            ps.setInt(1, id_usuario);
            ps.setString(2, pass_usu);
            //ejecutamos la busqueda
            rs = ps.executeQuery();
            //Se busca el usuario
            while(rs.next()){
                usuario = new MUsuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNom_usu(rs.getString("nom_usu"));
                usuario.setAppat_usu(rs.getString("appat_usu"));
                usuario.setApmat_usu(rs.getString("apmat_usu"));
                usuario.setPass_usu(rs.getString("pass_usu"));
                usuario.setGrupo(rs.getInt("id_grupo"));
                usuario.setId_rol(rs.getInt("id_rol"));
                
                
                break;
            }
        
        }catch(SQLException e){
            System.out.println("No conecto con la tabla");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            usuario = null;
        }finally{
            try{
                //cerrar conexiones
                rs.close();
                ps.close();
                con.close();
            }catch(Exception ex){

            System.out.println(ex.getMessage());
            }
        }
        return usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNom_usu() {
        return nom_usu;
    }

    public void setNom_usu(String nom_usu) {
        this.nom_usu = nom_usu;
    }

    public String getAppat_usu() {
        return appat_usu;
    }

    public void setAppat_usu(String appat_usu) {
        this.appat_usu = appat_usu;
    }

    public String getApmat_usu() {
        return apmat_usu;
    }

    public void setApmat_usu(String apmat_usu) {
        this.apmat_usu = apmat_usu;
    }

    public String getPass_usu() {
        return pass_usu;
    }

    public void setPass_usu(String pass_usu) {
        this.pass_usu = pass_usu;
    }

    public int getGrupo() {
        return grupo;
    }

    public void setGrupo(int grupo) {
        this.grupo = grupo;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }
}
