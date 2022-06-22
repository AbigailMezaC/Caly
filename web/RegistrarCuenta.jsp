<%-- 
    Document   : RegistrarCuentas
    Created on : 25/05/2022, 03:42:44 PM
    Author     : anaca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/style.css">
        <link rel="icon" href="./img/logo.jpg">
        <script src="./JS/Validaciones.js" type="text/javascript"></script>
        <title>Registrar</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
            </div>
        </div>
        <div class="Chocolate">
            <br>
            <h1>Crea tu perfil</h1>
            <br>
            <form action="guardarUsuario2" method="post" name="registro_usuario" id="registro_usuario" onsubmit="return validar(this)">
                <label>Ingresa tu Identificador:</label>
                <input type="text" maxlength="10" name="identificador" required="true" id="id_usuario" placeholder="10 Dígitos"
                       onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                <br>
                <br>
                <label>Nombre:</label>
                <input type="text" maxlength="15" name="nombre" required="true" id="nom_usu"
                       onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                <br>
                <br>
                <label>Apellido Paterno:</label>
                <input type="text" maxlength="15" name="paterno" required="true" id="appat_usu"
                       onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                <br>
                <br>
                <label>Apellido Materno:</label>
                <input type="text" maxlength="15" name="materno" required="true" id="apmat_usu"
                       onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                <br>
                <br>
                <label>Crea tu contraseña:</label>
                <input type="password" maxlength="15" name="password" required="true" id="pass_usu"
                       onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57">
                <br>
                <br>
                <label>Grupo:</label>
                <select class="garbanzo" id="grupo" name="grupo">
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
                <br>
                <label>Rol:</label>
                <select class="garbanzo" id="rol" name="rol">
                    <option class="daylight" value="111">Administrador</option>
                    <option class="daylight" value="222">Docente</option>
                    <option class="daylight" value="333">Alumno</option>
                </select>
                <input class="elefante" type="submit" value="Crear cuenta">         
            <br>
            <button type="button" onclick="location.href = 'index.html'"><span></span>Regresar</button>
            <button type="reset"><span></span>Borrar</button>
               </form>
        </div>
    </body>
</html>