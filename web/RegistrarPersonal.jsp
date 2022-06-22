<%-- 
    Document   : RegistrarPersonal
    Created on : 18/06/2022, 03:09:03 AM
    Author     : omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/style.css">
        <link rel="icon" href="./img/logo.jpg">
        <title>Registra Personal</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
            </div>
        </div>
        <div class="Chocolate">
            <br>
            <h1>Registrar Personal</h1>
            <br>
            <form action="registroPersonal" method="post" name="registro_personal" id="registro_personal">
                <label>Identificador del Técnico:</label>
                <input type="text" maxlength="15" name="id personal" required="true" id="id personal"
                       onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                <br>
                <br>
                <label>Nombre Completo:</label>
                <br>
                <input type="text" maxlength="30" name="nombre" required="true" id="nombre"
                       onkeypress="return(event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)">
                <input class="elefante" type="submit" value="Agregar tecnico">
                <br>
                <br>
                <button type="button" onclick="location.href = 'InicioAdministrador.jsp'"><span></span>Regresar</button>
                <button type="reset"><span></span>Borrar</button>
            </form>
        </div>
    </body>
</html>
