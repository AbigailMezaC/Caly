/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.MUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ommyr
 */
public class AccionesUsuario {
   
    public static int registroUsuario(MUsuario mu){
       int estatus=0;
       
       try{
           //Establecemos la conexión con la BD
         Connection con=Conexion.getConnection();
         
         //Preparamos la sentencia
         String q="insert into musuario(id_usuario, nom_usu, appat_usu, apmat_usu, pass_usu, id_grupo, id_rol) values (?,?,?,?,?,?,?)";
         
         PreparedStatement ps=con.prepareStatement(q);
         
         ps.setInt(1,mu.getId_usuario());
         ps.setString(2,mu.getNom_usu());
         ps.setString(3,mu.getAppat_usu());
         ps.setString(4,mu.getApmat_usu());
         ps.setString(5,mu.getPass_usu());
         ps.setInt(6,mu.getGrupo());
         ps.setInt(7,mu.getId_rol());
         
         estatus=ps.executeUpdate();
         System.out.println("Registro Exitoso");
            con.close();
           
       }catch(Exception ex){
        System.out.println("Error al registrar el equipo");
        System.out.println(ex.getMessage());
           
       }
       return estatus;
    }
    
    
    public MUsuario verificarUsuario(int id_usuario, String contrasena)throws ClassNotFoundException{
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
            String q = "select * from musuario";
            ps = con.prepareStatement(q);
            //preparo la sentencia
            ps.setInt(1, id_usuario);
            ps.setString(2, contrasena);
            //ejecutamos la busqueda
            rs = ps.executeQuery();
            //Se busca el usuario
            while(rs.next()){
                usuario = new MUsuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNom_usu(rs.getString("nom_usu"));
                
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
    public static int actualizarAlumno(MUsuario mu){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConnection();
            
            String q = "update musuario set nom_usu=?, appat_usu=?, apmat_usu=?, pass_usu=?, id_grupo=? where id_usuario=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, mu.getNom_usu());
            ps.setString(2, mu.getAppat_usu());
            ps.setString(3, mu.getApmat_usu());
            ps.setString(4, mu.getPass_usu());
            ps.setInt(5, mu.getGrupo());
            ps.setInt(6, mu.getId_usuario());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se actualizo el Usuario");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al actualizar el usuario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static int actualizarDocenteAdmin(MUsuario mu){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConnection();
            
            String q = "update musuario set nom_usu=?, appat_usu=?, apmat_usu=?, pass_usu=? where id_usuario=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, mu.getNom_usu());
            ps.setString(2, mu.getAppat_usu());
            ps.setString(3, mu.getApmat_usu());
            ps.setString(4, mu.getPass_usu());
            ps.setInt(5, mu.getId_usuario());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se actualizo el Usuario");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al actualizar el usuario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
}

