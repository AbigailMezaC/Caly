/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ConsultaEquipo;
import Modelo.ConsultarDatos;
import Modelo.ConsultarReporteA;
import Modelo.MEquipo;
import Modelo.MReporte;
import Modelo.MUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anaca
 */
public class AccionesAlumno extends Conexion {

    public static int registro(MEquipo eq) {
        int status = 0;

        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "insert into MEquipo (id_equipo, id_cpu, id_mouse,id_extra, id_teclado, "
                    + " id_lab, id_usuario,id_mon) values (?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, eq.getId_equipo());
            ps.setInt(2, eq.getId_cpu());
            ps.setInt(3, eq.getId_mouse());
            ps.setInt(4, eq.getId_extra());
            ps.setInt(5, eq.getId_teclado());
            ps.setInt(6, eq.getId_lab());
            ps.setInt(7, (eq.getId_usuario()));
            ps.setInt(8, eq.getId_mon());

            //Ejecutamos la sentencia
            status = ps.executeUpdate();
            System.out.println("Registro Exitoso");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al registrar el equipo");
            System.out.println(ex.getMessage());
        }
        return status;
    }

    public static List<ConsultaEquipo> BuscarEquiposbyID(int id_usuario) {
        List<ConsultaEquipo> lista = new ArrayList<ConsultaEquipo>();

        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "select id_usuario,nom_usu,appat_usu, lab,id_equipo from mequipo natural join claboratorio natural join musuario where id_usuario=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, id_usuario);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ConsultaEquipo e = new ConsultaEquipo();
                e.setId_usuario(rs.getInt(1));
                e.setNom_usu(rs.getString(2));
                e.setAppat_usu(rs.getString(3));
                e.setNom_lab(rs.getString(4));
                e.setId_equipo(rs.getInt(5));
                lista.add(e);

            }

            System.out.println("Consulta exitosa de equipo");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al consultar equipo");
            System.out.println(ex.getMessage());
        }
        return lista;
    }

    public static ConsultarDatos buscarUsuarioID(int id_usuario){
      
                ConsultarDatos e = new ConsultarDatos();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConnection();
            
            String q = "select id_usuario, nom_usu, appat_usu, apmat_usu, pass_usu, grupo, rol from musuario natural join cgrupo natural join crol where id_usuario = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_usuario);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
              e.setId_usuario(rs.getInt(1));
              e.setNom_usu(rs.getString(2));
              e.setAppat_usu(rs.getString(3));
              e.setApmat_usu(rs.getString(4));
              e.setPass_usu(rs.getString(5));
              e.setGrupo(rs.getString(6));
              e.setRol(rs.getString(7));
              
                
            }
            
            System.out.println("Se consulto el empleado");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar al empleado");
            System.out.println(ex.getMessage());
        }
        return e;
    }

    public static List <ConsultarReporteA> BuscarReportebyID(int id_usuario) {
        List<ConsultarReporteA> lista = new ArrayList<ConsultarReporteA>();
        
        
        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "select id_equipo, id_usuario,nom_usu,appat_usu,des_reporte,hora_reporte,fecha_reporte,comentario,lab from musuario natural join mreporte natural join claboratorio where id_usuario=?";

            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_usuario);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                ConsultarReporteA ra=new ConsultarReporteA();
                ra.setId_equipo(rs.getInt(1));
                ra.setId_usuario(rs.getInt(2));
                ra.setNom_usu(rs.getString(3));
                ra.setAppat_usu(rs.getString(4));
                ra.setDes_reporte(rs.getString(5));
                ra.setHora_reporte(rs.getString(6));
                ra.setFecha_reporte(rs.getString(7));
                ra.setComentario(rs.getString(8));
                ra.setLab(rs.getString(9));
                lista.add(ra);
                
            }
            
            System.out.println("Consulta exitosa de reporte");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al consultar reporte");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
}
