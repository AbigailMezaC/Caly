<%-- 
    Document   : ConsultarEquipo
    Created on : 9/06/2022, 01:19:36 AM
    Author     : Omar
--%>

<%@page import="Modelo.MEquipo"%>
<%@page import="Controlador.AccionesAlumno"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.AccionesAlumno"%>
<%@page import="Modelo.ConsultaEquipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%String nombre;
    int rol, usuario;
    HttpSession sesionuser = request.getSession();
    HttpSession sesionrol = request.getSession();
    HttpSession sesionnombre = request.getSession();
    if (sesionuser.getAttribute("user") == null) {
%>
<jsp:forward page="RegistrarCuenta.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%
} else {
    usuario = (int) sesionuser.getAttribute("user");
    rol = (int) sesionrol.getAttribute("rol");
    nombre = (String) sesionnombre.getAttribute("nombre");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/style.css">
        <link rel="icon" href="./img/logo.jpg">
        <title>Equipos</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilDocenteAdmin.jsp">Perfil</a></li>
                </ul>
            </div>

            <div class="tabla3">
                <h1>Equipos Registrados</h1>
                <br>
                <table border="2">
                    <thead>
                        <tr>
                            <th>Identificador</th>
                            <th>Nombre Usuario</th>
                            <th>Apellido Paterno</th>
                            <th>Laboratorio</th>
                            <th>Id equipo</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%                        int id_usuario = usuario;
                            List<ConsultaEquipo> lista = AccionesAlumno.BuscarEquiposbyID(usuario);
                            for (ConsultaEquipo e : lista) {
                        %>
                        <tr>
                            <td><%=e.getId_usuario()%></td>
                            <td><%=e.getNom_usu()%></td>
                            <td><%=e.getAppat_usu()%></td>
                            <td><%=e.getNom_lab()%></td>
                            <td><%=e.getId_equipo()%></td>

                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <button type="button" onclick="location.href = 'InicioAlumno.jsp'"><span></span>Regresar</button>
                <button type="button" onclick="location.href = 'RegistroEquipo.jsp'"><span></span>Registrar otra Máquina</button>
            </div>
        </div>
    </body>
</html>
<%  
    }
%>