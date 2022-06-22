<%-- 
    Document   : RegistrarCuentas
    Created on : 25/05/2022, 03:42:44 PM
    Author     : anaca
--%>

<%@page import="Modelo.MUsuario"%>
<%@page import="Controlador.AccionesAlumno"%>
<%@page import="Modelo.ConsultarDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%String  nombre;
int rol,usuario;
HttpSession sesionuser=request.getSession();
HttpSession sesionrol=request.getSession();
HttpSession sesionnombre=request.getSession();
if(sesionuser.getAttribute("user")==null){
%>
<jsp:forward page="RegistrarCuenta.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%  
    }else{
    usuario = (int)sesionuser.getAttribute("user");
    rol = (int)sesionrol.getAttribute("rol");
    nombre = (String)sesionnombre.getAttribute("nombre");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/style.css">
        <link rel="icon" href="./img/logo.jpg">
        <title>Editar Cuenta</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
            </div>
        </div>
        <div class="Chocolate">
            <h1>Editar Perfil</h1>
            <br>
            <form  method="post" name="editar_usuario" id="editar_usuario" action="actualizarCuenta">
                <%
                    int id_usuario=usuario;
                    
                    ConsultarDatos e = AccionesAlumno.buscarUsuarioID(id_usuario);
                    %>
                <label>Identificador:</label>
                <input type="text" readonly="readonly" maxlength="15" name="identificador" value="<%=e.getId_usuario()%>" required="true" id="id_usu"
                       onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                <br>
                <br>
                <label>Nombre:</label>
                <input type="text" maxlength="15" name="nombre" value="<%=e.getNom_usu()%>" required="true" id="nom_usu"
                       onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                <br>
                <br>
                <label>Apellido Paterno:</label>
                <input type="text" maxlength="15" name="paterno" value="<%=e.getAppat_usu()%>" required="true" id="appat_usu"
                       onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                <br>
                <br>
                <label>Apellido Materno:</label>
                <input type="text" maxlength="15" name="materno" value="<%=e.getApmat_usu()%>" required="true" id="apmat_usu"
                       onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                <br>
                <br>
                <label>Ingresar Contraseña:</label>
                <input type="password" maxlength="15" name="password" value="<%=e.getPass_usu()%>" required="true" id="pass_usu"
                       onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57">
                <br>
                <br>
                <label>Grupo:</label>
                <select class="garbanzo" id="grupo" value="<%=e.getGrupo()%>" name="grupo">
                    <option class="daylight" value="0">nulo </option>
                    <option class="daylight" value="1">3IM7</option>
                    <option class="daylight" value="2">3IM8</option>
                    <option class="daylight" value="3">3IM9</option>
                    <option class="daylight" value="4">3IM10</option>
                    <option class="daylight" value="5">4IM7</option>
                    <option class="daylight" value="6">4IM8</option>
                    <option class="daylight" value="7">4IM9</option>
                    <option class="daylight" value="8">4IM10</option>
                    <option class="daylight" value="9">5IM7</option>
                    <option class="daylight" value="10">5IM8</option>
                    <option class="daylight" value="11">5IM9</option>
                    <option class="daylight" value="12">5IM10</option>
                    <option class="daylight" value="13">6IM7</option>
                    <option class="daylight" value="14">6IM8</option>
                    <option class="daylight" value="15">6IM9</option>
                    <option class="daylight" value="16">6IM10</option>
                    <option class="daylight" value="17">3IV7</option>
                    <option class="daylight" value="18">3IV8</option>
                    <option class="daylight" value="19">3IV9</option>
                    <option class="daylight" value="20">3IV10</option>
                    <option class="daylight" value="21">4IV7</option>
                    <option class="daylight" value="22">4IV8</option>
                    <option class="daylight" value="23">4IV9</option>
                    <option class="daylight" value="24">4IV10</option>
                    <option class="daylight" value="25">5IV7</option>
                    <option class="daylight" value="26">5IV8</option>
                    <option class="daylight" value="27">5IV9</option>
                    <option class="daylight" value="28">5IV10</option>
                    <option class="daylight" value="29">6IV7</option>
                    <option class="daylight" value="30">6IV8</option>
                    <option class="daylight" value="31">6IV9</option>
                    <option class="daylight" value="32">6IV10</option>
                </select>
                <br>
                <input class="elefante" type="submit" value="Actualizar Datos">       
            <button type="button" onclick="location.href = 'PerfilDocenteAdmin.jsp'"><span></span>Regresar</button>
            <button type="reset"><span></span>Borrar</button>
               </form>
        </div>
    </body>
</html>