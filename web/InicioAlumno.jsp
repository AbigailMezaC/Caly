<%-- 
    Document   : InicioAlumno
    Created on : 25/05/2022, 11:50:37 AM
    Author     : anaca
--%>
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
        <title>Inicio</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilAlumno.jsp">Perfil</a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <h1>Bienvenido Alumno/a, <%=nombre%> </h1>
            <p>Seleccione una opcion: </p>
            <div>
                <button type="button" onclick="location.href = './RegistroEquipo.jsp'"><span></span>Registrar Maquina</button>
                <button type="button" onclick="location.href = './ConsultarEquipo.jsp'"><span></span>Consultar Maquinas</button>                       
                <button type="button" onclick="location.href = './ReporteAlumno.jsp'"><span></span>Realizar Reporte</button>
                <button type="button" onclick="location.href = './ConsultarReporteA.jsp'"><span></span>Consultar Reportes</button> 
            </div>
        </div>
    </body>
</html>
<%
    }
%>