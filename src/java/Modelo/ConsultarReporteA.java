/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author ommyr
 */
public class ConsultarReporteA {
    private int id_usuario;
    private String nom_usu;
    private String appat_usu;
    private String des_reporte;
    private String hora_reporte;
    private String fecha_reporte;
    private String comentario;
    private int id_equipo;
    private String lab;

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

    public String getDes_reporte() {
        return des_reporte;
    }

    public void setDes_reporte(String des_reporte) {
        this.des_reporte = des_reporte;
    }

    public String getHora_reporte() {
        return hora_reporte;
    }

    public void setHora_reporte(String hora_reporte) {
        this.hora_reporte = hora_reporte;
    }

    public String getFecha_reporte() {
        return fecha_reporte;
    }

    public void setFecha_reporte(String fecha_reporte) {
        this.fecha_reporte = fecha_reporte;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getId_equipo() {
        return id_equipo;
    }

    public void setId_equipo(int id_equipo) {
        this.id_equipo = id_equipo;
    }

    public String getLab() {
        return lab;
    }

    public void setLab(String lab) {
        this.lab = lab;
    }
    
}
