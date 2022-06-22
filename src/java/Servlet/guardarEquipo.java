/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.AccionesAlumno;
import Modelo.MEquipo;
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
public class guardarEquipo extends HttpServlet {

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
            
            int equipo, cpu, mouse,extra, tecla, mon, lab, usu;
            
            equipo = Integer.parseInt(request.getParameter("id equipo"));
            cpu = Integer.parseInt(request.getParameter("CPU"));
            mouse = Integer.parseInt(request.getParameter("Mouse"));
            extra = Integer.parseInt(request.getParameter("Acsessextra"));
            tecla = Integer.parseInt(request.getParameter("teclado"));
            mon = Integer.parseInt(request.getParameter("Monitor"));
            lab = Integer.parseInt(request.getParameter("lab"));
            usu = Integer.parseInt(request.getParameter("id_usu"));
            
            MEquipo eq = new MEquipo();
            
            eq.setId_equipo(equipo);
            eq.setId_cpu(cpu);
            eq.setId_mouse(mouse);
            eq.setId_extra(extra);
            eq.setId_teclado(tecla);
            eq.setId_mon(mon);
            eq.setId_lab(lab);
            eq.setId_usuario(usu);
            
            int estatus = AccionesAlumno.registro(eq);
            
            if(estatus > 0){
                response.sendRedirect("ConsultarEquipo.jsp");
            }else{
                response.sendRedirect("errorSesion.jsp");
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
