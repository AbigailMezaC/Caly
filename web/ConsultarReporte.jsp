<%@page import="Modelo.ConsultaReporte"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <script src="./JS/Buscador.js" type="text/javascript"></script>
        <link rel="icon" href="./img/logo.jpg">
        <title>Consultar Reportes</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilDocenteAdmin.jsp">Perfil</a></li>
                </ul>
            </div>
            <div class="tabla2">
                <h1>Equipos Reportados</h1>
                <br>
                <label>Buscar:</label>
                <input id="buscadorTxt" type="text" onkeyup="buscarDatos()">
                <br>
                <br>
                <table border="2" id="datosTabla">
                    <thead>
                        <tr>
                            <th>Descripcion</th>
                            <th>Hora</th>
                            <th>Fecha</th>
                            <th>Comentario</th>
                            <th>Equipo</th>
                            <th>Laboratorio</th>
                            <th>Prioridad</th>
                            <th>Tipo de reporte</th>
                            <th>Estado de reporte</th>
                            <th>Usuario</th>
                            <th>Materia</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ConsultaReporte> lista = AccionesAdministrador.BuscarAllReportes();
                            for (ConsultaReporte e : lista) {
                        %>
                        <tr>
                            <td><%=e.getDes_report()%></td>
                            <td><%=e.getHora_report()%></td>
                            <td><%=e.getFecha_report()%></td>
                            <td><%=e.getComentario()%></td>
                            <td><%=e.getId_equipo()%></td>
                            <td><%=e.getNom_lab()%></td>
                            <td><%=e.getPriori()%></td>
                            <td><%=e.getTipreport()%></td>
                            <td><%=e.getEstatus()%></td>
                            <td><%=e.getId_usuario()%></td>
                            <td><%=e.getMateria()%></td>
                            <td><a href="EditarReporte.jsp?id_usuario=<%=e.getId_usuario()%>">Editar</a></td>
                            <td><a href="borrarReporte?id_usuario=<%=e.getId_usuario()%>">Borrar</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
<%
    }
%>