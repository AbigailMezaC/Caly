<%-- 
    Document   : IniciarSesion
    Created on : 29/05/2022, 02:15:14 PM
    Author     : anaca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/style.css">
        <link rel="icon" href="./img/logo.jpg">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>                  
                    <li><a href="./index.html">Inicio</a></li>
                </ul>
            </div>
            <div class="login-box">
                <img class="carita" src="./img/logo.jpg">
                <h1>Iniciar sesion</h1>
                <form action="inSesion" method="post">
                    <label>Identificador:</label>
                    <input type="text" maxlength="10" name="Identificador" required="true" id="id"
                           onkeypress="return(event.charCode >= 48 && event.charCode <= 57)" placeholder="Ingresa Identificador">
                    <label>Contraseña:</label>
                    <input type="password" maxlength="15" name="Contra" required="true" id="contraseña"
                           onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57"
                           placeholder="Ingresa Contraseña">
                    <input type="submit" value="Iniciar Sesion">
                    <input type="reset" value="Borrar Registro">
                </form>
            </div>
        </div>
    </body>
</html>
