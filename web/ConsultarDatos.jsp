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
        <link rel="icon" href="./img/logo.jpg">
        <title>Consultar Cuentas</title>
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
                <h1>Usuarios Registrados</h1>
                <br>
                <table border="2">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Contraseña</th>
                            <th>Grupo</th>
                            <th>Rol</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ConsultarDatos> lista = AccionesAdministrador.BuscarAllUsuarios();
                            for (ConsultarDatos e : lista) {
                        %>
                        <tr>
                            <td> <%=e.getId_usuario()%></td>
                            <td> <%=e.getNom_usu()%></td>
                            <td> <%=e.getAppat_usu()%></td>
                            <td> <%=e.getApmat_usu()%></td>
                            <td> <%=e.getPass_usu()%></td>
                            <td> <%=e.getGrupo()%></td>
                            <td> <%=e.getRol()%></td>
                            <td><a href="EditarCuentas.jsp?id_usuario=<%=e.getId_usuario()%>">Editar</a></td>
                            <td><a href="borrarDatos?id_usuario=<%=e.getId_usuario()%>">Borrar</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                    <button type="button" onclick="location.href = 'InicioAdministrador.jsp'"><span></span>Regresar</button>
            </div>
        </div>
    </body>
</html>