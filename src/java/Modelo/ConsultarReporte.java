package Modelo;

public class ConsultarReporte {
     private int id_equipo,id_usuario;
    private String des_report;
    private String hora_report;
    private String fecha_report;
    private String comentario;
    private String nom_lab;
    private String priori;
    private String tipreport;
    private String estatus;
    private String materia;

    public int getId_equipo() {
        return id_equipo;
    }

    public void setId_equipo(int id_equipo) {
        this.id_equipo = id_equipo;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

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

    public String getFecha_report() {
        return fecha_report;
    }

    public void setFecha_report(String fecha_report) {
        this.fecha_report = fecha_report;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getNom_lab() {
        return nom_lab;
    }

    public void setNom_lab(String nom_lab) {
        this.nom_lab = nom_lab;
    }

    public String getPriori() {
        return priori;
    }

    public void setPriori(String priori) {
        this.priori = priori;
    }

    public String getTipreport() {
        return tipreport;
    }

    public void setTipreport(String tipreport) {
        this.tipreport = tipreport;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }
    
}
