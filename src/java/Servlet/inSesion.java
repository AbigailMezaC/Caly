/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Modelo.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ommyr
 */
public class inSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String pass_usu;
            int id_usuario;
            
            id_usuario= Integer.parseInt(request.getParameter("Identificador"));
            pass_usu = request.getParameter("Contra");
            
            MUsuario usuario = new MUsuario();
            
            usuario = usuario.verificarUsuario(id_usuario, pass_usu);
            
            //verificar al usuario
            if(usuario != null){
                //si existe en la BD
                //se crea la sesion de la bd
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", usuario);
                
                //otra sesion que obtendra solo el parametro
                HttpSession sesionUser = request.getSession();
                sesionUser.setAttribute("user", usuario.getId_usuario());
                
                HttpSession sesionRol = request.getSession();
                sesionRol.setAttribute("rol", usuario.getId_rol());
                
                HttpSession sesionNombre = request.getSession();
                sesionNombre.setAttribute("nombre", usuario.getNom_usu());
                
                //saber el privilegio switch
                if(usuario.getId_rol()==111){
                    response.sendRedirect("InicioAdministrador.jsp");
                }else if(usuario.getId_rol()==222){
                    response.sendRedirect("InicioDocente.jsp");
                } else if(usuario.getId_rol()==333){
                    response.sendRedirect("InicioAlumno.jsp");
                }
            }else{
                response.sendRedirect("RegistrarCuenta.jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(inSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(inSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
