<%@page import="Modelo.CPersonal"%>
<%@page import="java.util.List"%>
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
        <title>Consulta Personal</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilDocenteAdmin.jsp">Perfil</a></li>
                </ul>
            </div>
            <div class="tabla11">
                <h1>Tecnicos</h1>
                <br>
                <table border="2">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<CPersonal> lista = AccionesAdministrador.BuscarAllPersonal();
                                for (CPersonal e : lista) {
                            %>
                            <tr>
                                <td> <%=e.getId_personal()%></td>
                                <td> <%=e.getNombre()%></td>
                                <td><a href="EditarPersonal.jsp?id_personal=<%=e.getId_personal()%>">Actualizar</a></td>
                                <td><a href="borrarPersonal?id_personal=<%=e.getId_personal()%>">Borrar</a></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>             
                <button type="button" onclick="location.href = 'InicioAdministrador.jsp'"><span></span>Regresar</button>
                <button type="button" onclick="location.href = 'RegistrarPersonal.jsp'"><span></span>Registrar otro Técnico</button>
            </div>
        </div>
    </body>
</html>
<%
    }
%>
