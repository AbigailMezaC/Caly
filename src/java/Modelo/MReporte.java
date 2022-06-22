/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author aly
 */
public class MReporte {
    private String des_report; 
    private String hora_report;
    private String fecha_report;  
    private String comentario;  
    private int id_equipo;    
    private int id_priori;   
    private int id_lab;
    private int id_tipreport;
    private int id_estatus ;
    private int id_usuario;
    private int id_materia;

    public String getDes_report() {
        return des_report;
    }

    public void setDes_report(String des_report) {
        this.des_report = des_report;
    }

    public String getHora_report() {
        return hora_report;
    }

    public void setHora_report(String hora_report) {
        this.hora_report = hora_report;
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

    public int getId_priori() {
        return id_priori;
    }

    public void setId_priori(int id_priori) {
        this.id_priori = id_priori;
    }

    public int getId_tipreport() {
        return id_tipreport;
    }

    public void setId_tipreport(int id_tipreport) {
        this.id_tipreport = id_tipreport;
    }

    public int getId_estatus() {
        return id_estatus;
    }

    public void setId_estatus(int id_estatus) {
        this.id_estatus = id_estatus;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getFecha_report() {
        return fecha_report;
    }

    public void setFecha_report(String fecha_report) {
        this.fecha_report = fecha_report;
    }

    public int getId_lab() {
        return id_lab;
    }

    public void setId_lab(int id_lab) {
        this.id_lab = id_lab;
    }
        
}
