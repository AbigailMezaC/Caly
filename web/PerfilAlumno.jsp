<%-- 
    Document   : Perfil
    Created on : 31/05/2022, 03:35:27 AM
    Author     : anaca
--%>
<%@page import="Modelo.ConsultarDatos"%>
<%@page import="Controlador.AccionesAlumno"%>
<%@page import="Modelo.MUsuario"%>
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
        <title>Perfil</title>
        <link rel="stylesheet" href="./CSS/style.css">
        <link rel="icon" href="./img/logo.jpg">
    </head>
    <body oncopy="return false" onpaste="return false">
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
            </div>
            <div class="Chocolate">
                <h1>Perfil</h1>     
                <br>
                <br>
                <form>
                    <%
                    int id_usuario=usuario;
                    
                    ConsultarDatos e = AccionesAlumno.buscarUsuarioID(id_usuario);
                    %>
                    <label>Nombre:</label>
                    <input type="text" value="<%=e.getNom_usu()%>" readonly="readonly">
                    <br>
                    <br>
                    <label>Apellido Paterno:</label>
                    <input type="text" value="<%=e.getAppat_usu()%>" readonly="readonly">
                    <br>
                    <br>
                    <label>Apellido Materno:</label>
                    <input type="text" value="<%=e.getApmat_usu()%>" readonly="readonly">
                    <br>
                    <br>
                    <label>Grupo:</label>
                    <input type="text" value="<%=e.getGrupo()%>" readonly="readonly">
                    <br>
                    <br>
                    <label>Identificador:</label>
                    <input type="text" value="<%=e.getId_usuario()%>" readonly="readonly">
                    <br>
                    <br>
                    <input class="elefante" type="button" value="Cerrar Sesión" onclick="location.href = './index.html'">
                </form>
                <button type="button" onclick="location.href = 'InicioAlumno.jsp'"><span></span>Regresar</button>
            </div>
        </div>
    </body>
</html>
<%
    }
%>
