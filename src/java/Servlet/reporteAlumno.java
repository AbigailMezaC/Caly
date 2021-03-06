/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.AccionesDocente;
import Modelo.MReporte;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ommyr
 */
public class reporteAlumno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
             String des, coment, hora, fecha;
            int equipo, priori, tiporeporte, estatus, usuario, mat, lab;
            
            des = request.getParameter("descripcion");
            hora = request.getParameter("hora");
            fecha = request.getParameter("fecha_reporte");
            coment = request.getParameter("comentario");
            equipo = Integer.parseInt(request.getParameter("id_equipo"));
            priori = Integer.parseInt(request.getParameter("prioridad"));
            tiporeporte = Integer.parseInt(request.getParameter("tipreport"));
            estatus = Integer.parseInt(request.getParameter("estado"));
            usuario = Integer.parseInt(request.getParameter("usu"));
            lab = Integer.parseInt(request.getParameter("laboratorio"));
            mat = Integer.parseInt(request.getParameter("materia"));
            
            MReporte eq = new MReporte();
            
            eq.setDes_report(des);
            eq.setHora_report(hora);
            eq.setFecha_report(fecha);
            eq.setComentario(coment);
            eq.setId_equipo(equipo);
            eq.setId_priori(priori);
            eq.setId_tipreport(tiporeporte);
            eq.setId_estatus(estatus);
            eq.setId_usuario(usuario);
            eq.setId_lab(lab);
            eq.setId_materia(mat);
            
            
            int estado = AccionesDocente.reportar(eq);
            
            if(estado > 0){
                response.sendRedirect("ConsultarReporteA.jsp");
            }else{
                response.sendRedirect("ReporteAlumno.jsp");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
