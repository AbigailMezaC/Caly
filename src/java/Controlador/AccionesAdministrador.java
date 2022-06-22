/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.CPersonal;
import Modelo.ConsultaReporte;
import Modelo.ConsultarDatos;
import Modelo.ConsultarReporte;
import Modelo.ContarReportes;
import Modelo.MEquipo;
import Modelo.MReporte;
import Modelo.MUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mezac
 */
public class AccionesAdministrador {

    public static List<ConsultaReporte> BuscarAllReportes() {
        List<ConsultaReporte> lista = new ArrayList<ConsultaReporte>();

        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "select des_reporte, hora_reporte, fecha_reporte, comentario, id_equipo, lab, priori, "
                    + "tipreport, estatus, id_usuario, materia from mreporte natural join claboratorio "
                    + "natural join cpriori natural join ctipreport natural join cestatus natural join cmateria";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ConsultaReporte e = new ConsultaReporte();
                e.setDes_report(rs.getString(1));
                e.setHora_report(rs.getString(2));
                e.setFecha_report(rs.getString(3));
                e.setComentario(rs.getString(4));
                e.setId_equipo(rs.getInt(5));
                e.setNom_lab(rs.getString(6));
                e.setPriori(rs.getString(7));
                e.setTipreport(rs.getString(8));
                e.setEstatus(rs.getString(9));
                e.setId_usuario(rs.getInt(10));
                e.setMateria(rs.getString(11));
                lista.add(e);
            }

            System.out.println("Consulta exitosa");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return lista;
    }

    public static List<ConsultarDatos> BuscarAllUsuarios() {
        List<ConsultarDatos> lista = new ArrayList<ConsultarDatos>();

        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "select id_usuario, nom_usu, appat_usu, apmat_usu, pass_usu, "
                    + "grupo, rol from musuario natural join cgrupo natural join crol";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ConsultarDatos e = new ConsultarDatos();
                e.setId_usuario(rs.getInt(1));
                e.setNom_usu(rs.getString(2));
                e.setAppat_usu(rs.getString(3));
                e.setApmat_usu(rs.getString(4));
                e.setPass_usu(rs.getString(5));
                e.setGrupo(rs.getString(6));
                e.setRol(rs.getString(7));
                lista.add(e);
            }

            System.out.println("Consulta exitosa");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return lista;
    }

    public static int editarUsuario(MUsuario mu) {

        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;

        try {
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

        } catch (Exception ex) {
            System.out.println("Error al actualizar el usuario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }

    public static int editarReporte(MReporte mr) {

        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;

        try {
            //establecer es la conexion
            Connection con = Conexion.getConnection();

            String q = "update mreporte set id_estatus=? where id_usuario=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, mr.getId_estatus());
            ps.setInt(2, mr.getId_usuario());

            estatus = ps.executeUpdate();

            System.out.println("Se actualizo el Reporte");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al actualizar el usuario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }

    public static int borrarUsuario(int id_usuario) {
        int estatus = 0;
        try {
            Connection con = Conexion.getConnection();
            String q = "delete from musuario where id_usuario=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, id_usuario);

            estatus = ps.executeUpdate();

            System.out.println("Se borró el Usuario");
            con.close();

        } catch (Exception ex) {
            System.out.println("No se pudo borrar el usuario");
            System.out.println(ex.getMessage());

        }
        return estatus;
    }

    public static ConsultarReporte buscaridUsuario(int id_usuario) {
        ConsultarReporte me = new ConsultarReporte();

        try {
            Connection con = Conexion.getConnection();
            String q = "select des_reporte, hora_reporte, fecha_reporte, comentario, id_equipo, lab, priori, tipreport, estatus, id_usuario, materia from mreporte natural join claboratorio "
                    + "natural join cpriori natural join ctipreport natural join cestatus natural join cmateria where id_usuario=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, id_usuario);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                me.setDes_report(rs.getString(1));
                me.setHora_report(rs.getString(2));
                me.setFecha_report(rs.getString(3));
                me.setComentario(rs.getString(4));
                me.setId_equipo(rs.getInt(5));
                me.setNom_lab(rs.getString(6));
                me.setPriori(rs.getString(7));
                me.setPriori(rs.getString(8));
                me.setEstatus(rs.getString(9));
                me.setId_usuario(rs.getInt(10));
            }

        } catch (Exception ex) {
            System.out.println("No se pudo consultar al reporte");
            System.out.println(ex.getMessage());

        }
        return me;
    }

    public static List<ConsultarDatos> buscarUsuarioA() {
        List<ConsultarDatos> lista = new ArrayList<ConsultarDatos>();

        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "select id_usuario, nom_usu, appat_usu, apmat_usu, grupo, id_equipo, lab "
                    + "from musuario natural join cgrupo natural join mequipo natural join "
                    + "claboratorio";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ConsultarDatos cd = new ConsultarDatos();
                cd.setId_usuario(rs.getInt(1));
                cd.setNom_usu(rs.getString(2));
                cd.setAppat_usu(rs.getString(3));
                cd.setApmat_usu(rs.getString(4));
                cd.setGrupo(rs.getString(5));
                cd.setId_equipo(rs.getInt(6));
                cd.setLab(rs.getString(7));
                lista.add(cd);
            }

            System.out.println("Consulta exitosa");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return lista;
    }

    public static int borrarReporte(int id_usuario) {
        int estatus = 0;

        try {
            Connection con = Conexion.getConnection();
            String q = "delete from mreporte where id_usuario=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, id_usuario);

            estatus = ps.executeUpdate();

            System.out.println("Se borró el Reporte");
            con.close();

        } catch (Exception ex) {
            System.out.println("No se pudo borrar el reporte");
            System.out.println(ex.getMessage());

        }
        return estatus;
    }

    public static int registroPersonal(CPersonal c) {
        int estatus = 0;

        try {
            //Establecemos la conexión con la BD
            Connection con = Conexion.getConnection();

            //Preparamos la sentencia
            String q = "insert into cpersonal(id_personal,nombre) values (?,?)";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, c.getId_personal());
            ps.setString(2, c.getNombre());

            estatus = ps.executeUpdate();
            System.out.println("Registro Exitoso");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al registrar el Personal");
            System.out.println(ex.getMessage());

        }
        return estatus;
    }

    public static List<CPersonal> BuscarAllPersonal() {
        List<CPersonal> lista = new ArrayList<CPersonal>();

        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "select * from cpersonal";

            PreparedStatement ps = con.prepareStatement(q);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CPersonal e = new CPersonal();
                e.setId_personal(rs.getInt(1));
                e.setNombre(rs.getString(2));
                lista.add(e);
            }

            System.out.println("Consulta exitosa");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al consultar");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static int editarPersonal(CPersonal p) {
        int estatus = 0;

        try {
            Connection con = Conexion.getConnection();

            String q = "update cpersonal set nombre=? where id_personal=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setString(1, p.getNombre());
            ps.setInt(2, p.getId_personal());

            estatus = ps.executeUpdate();

            System.out.println("Se actualizo el Personal");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al actualizar el personal");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }

    public static int borrarPersonal(int id_personal) {
        int estatus = 0;

        try {
            Connection con = Conexion.getConnection();
            String q = "delete from cpersonal where id_personal=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, id_personal);

            estatus = ps.executeUpdate();

            System.out.println("Se borró el Personal");
            con.close();

        } catch (Exception ex) {
            System.out.println("No se pudo borrar el personal");
            System.out.println(ex.getMessage());

        }
        return estatus;
    }

    public static CPersonal BuscarPersonalbyID(int id_personal) {
        CPersonal e = new CPersonal();
        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "select * from cpersonal where id_personal=?";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setInt(1, id_personal);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                e.setId_personal(rs.getInt(1));
                e.setNombre(rs.getString(2));
            }

            System.out.println("Consulta exitosa de personal");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al consultar personal");
            System.out.println(ex.getMessage());
        }
        return e;
    }
        
    
}
