<%@page import="Modelo.ConsultaReporte"%>
<%@page import="Modelo.ConsultarDatos"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.MUsuario"%>
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
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/style.css">
        <script src="./JS/Buscador.js" type="text/javascript"></script>
        <link rel="icon" href="./img/logo.jpg">
        <title>Consultar Alumnos</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilDocenteAdmin.jsp">Perfil</a></li>
                </ul>
            </div>
            <div class="tabla">
                <div class="tabla2">
                <h1>Alumnos</h1>
                <br>
                <label>Buscar:</label>
                <input id="buscadorTxt" type="text" onkeyup="buscarDatos()">
                </div>
                <br>
                <table border="2" id="datosTabla">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Grupo</th>
                            <th>Máquina Registrada</th>
                            <th>Laboratorio</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ConsultarDatos> lista = AccionesAdministrador.buscarUsuarioA();
                            for (ConsultarDatos cd : lista) {
                        %>
                        <tr>
                            <td><%=cd.getId_usuario()%></td>
                            <td><%=cd.getNom_usu()%></td>
                            <td><%=cd.getAppat_usu()%></td>
                            <td><%=cd.getApmat_usu()%></td>
                            <td><%=cd.getGrupo()%></td>
                            <td><%=cd.getId_equipo()%></td>
                            <td><%=cd.getLab()%></td>
                            <td><a href="EditarCuentasA.jsp?id_usuario=<%=cd.getId_usuario()%>">Editar</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <button type="button" onclick="location.href = 'InicioDocente.jsp'"><span></span>Regresar</button>
            </div>
        </div>
    </body>
</html>