<%-- 
    Document   : EditarPersonal
    Created on : 18/06/2022, 04:33:14 PM
    Author     : anaca
--%>

<%@page import="Controlador.AccionesAdministrador"%>
<%@page import="Modelo.CPersonal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String nombre;
    int rol, usuario;
    HttpSession sesionuser = request.getSession();
    HttpSession sesionrol = request.getSession();
    HttpSession sesionnombre = request.getSession();
    if (sesionuser.getAttribute("user") == null) {
%>
<jsp:forward page="EditarCuentas.jsp" >
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
        <title>Actualizar Personal</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilDocenteAdmin.jsp">Perfil</a></li>
                </ul>
            </div>

            <div class="chocolate">
                <div class="tabla44">
                    <form method="post" action="actualizarPersonal" name="actualizar">
                        <%
                            int id = Integer.parseInt(request.getParameter("id_personal"));
                            CPersonal e = AccionesAdministrador.BuscarPersonalbyID(id);
                        %>
                        <h1>Actualizar Datos</h1>
                        <br>
                        <table border="2">
                            <tr>
                                <td>ID</td>
                                <td><input readonly="readonly" type="text" name="id2" value="<%=e.getId_personal()%>"></td>
                            </tr>
                            <tr>
                                <td>Nombre</td>
                                <td><input type="text" name="nombre2" value="<%=e.getNombre()%>" onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)"></td>
                            </tr>
                        </table>
                        <button type="submit" value="Actualizar">Actualizar</button>
                        <button type="button" onclick="location.href = 'ConsultarPersonal.jsp'"><span></span>Regresar</button>
                        <button type="reset"><span></span>Borrar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    }
%>
