<%@page import="Modelo.ConsultarReporteA"%>
<%@page import="Controlador.AccionesAlumno"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controlador.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.MReporte"%>
<%@page import="Controlador.AccionesAdministrador"%>
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
        <title>Consultar</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilAlumno.jsp">Perfil</a></li>
                </ul>
            </div>
            <div class="tabla">
                <h1>Equipos Reportados</h1>
                <br>
                <table border="2">
                    <thead>
                        <tr>
                            <th>id Equipo</th>
                            <th>id Usuario</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Descripción</th>
                            <th>Hora</th>
                            <th>Fecha</th>
                            <th>Comentario</th>
                            <th>Laboratorio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int id_usuario = usuario;
                            List<ConsultarReporteA> lista = AccionesAlumno.BuscarReportebyID(id_usuario);
                            for (ConsultarReporteA ra : lista) {
                        %>
                        <tr>
                            <td> <%=ra.getId_equipo()%></td>
                            <td> <%=ra.getId_usuario()%></td>
                            <td> <%=ra.getNom_usu()%></td>
                            <td> <%=ra.getAppat_usu()%></td>
                            <td> <%=ra.getDes_reporte()%></td>
                            <td> <%=ra.getHora_reporte()%></td>
                            <td> <%=ra.getFecha_reporte()%></td>
                            <td> <%=ra.getComentario()%></td>
                            <td> <%=ra.getLab()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                    <button type="button" onclick="location.href = 'InicioAlumno.jsp'"><span></span>Regresar</button>
                    <button type="button" onclick="location.href = 'ReporteAlumno.jsp'"><span></span>Realizar otro Reporte</button>
            </div>
        </div>
    </body>
</html>
<%
    }
%>