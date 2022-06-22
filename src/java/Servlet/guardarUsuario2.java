/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.AccionesUsuario;
import Modelo.MUsuario;
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
public class guardarUsuario2 extends HttpServlet {

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
           int identifi,grupo,rol;
           String nombre,appat,apmat,contra; 
           
           identifi=Integer.parseInt(request.getParameter("identificador"));
           nombre=request.getParameter("nombre");
           appat=request.getParameter("paterno");
           apmat=request.getParameter("materno");
           contra=request.getParameter("password");
           grupo=Integer.parseInt(request.getParameter("grupo"));
           rol=Integer.parseInt(request.getParameter("rol"));
           
           MUsuario mu= new MUsuario();     
           
           mu.setId_usuario(identifi);
           mu.setNom_usu(nombre);
           mu.setAppat_usu(appat);
           mu.setApmat_usu(apmat);
           mu.setPass_usu(contra);
           mu.setGrupo(grupo);
           mu.setId_rol(rol);
           
           int status=AccionesUsuario.registroUsuario(mu);
           
           if(status>0){
               response.sendRedirect("index.html");
           }else{
               response.sendRedirect("errorRegistro.jsp");
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
