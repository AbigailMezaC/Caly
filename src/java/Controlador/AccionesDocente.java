/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.MReporte;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AccionesDocente {

    public static int reportar(MReporte eq) {
        int status = 0;

        try {
            //Establecer la conexión con la BD
            Connection con = Conexion.getConnection();

            String q = "insert into MReporte (des_reporte,hora_reporte ,fecha_reporte, comentario, "
                    + "id_equipo,id_lab, id_priori,id_tipreport, id_estatus, id_usuario, id_materia)"
                    + "values (?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setString(1, eq.getDes_report());
            ps.setString(2, eq.getHora_report());
            ps.setString(3, eq.getFecha_report());
            ps.setString(4, eq.getComentario());
            ps.setInt(5, eq.getId_equipo());
            ps.setInt(6, eq.getId_lab());
            ps.setInt(7, eq.getId_priori());
            ps.setInt(8, eq.getId_tipreport());
            ps.setInt(9, eq.getId_estatus());
            ps.setInt(10, eq.getId_usuario());
            ps.setInt(11, eq.getId_materia());

            //Ejecutamos la sentencia
            status = ps.executeUpdate();
            System.out.println("Reporte Exitoso");
            con.close();

        } catch (Exception ex) {
            System.out.println("Error al reportar el equipo");
            System.out.println(ex.getMessage());
        }
        return status;
    }

  
}
