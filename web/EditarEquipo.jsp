<%-- 
    Document   : EditarEquipo
    Created on : 9/06/2022, 01:19:36 AM
    Author     : anaca
--%>
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
        <title>Editar Equipo</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./Perfil.jsp">Perfil</a></li>
                </ul>
            </div>
            <div class="Chocolate">
                <h1>Editar los datos del Equipo</h1>
                <br>
                <form method="post" action="editarEquipo">
                    <label>ID Equipo</label>
                    <input type="text" maxlength="20" name="id_equipo2" required="true" id="id_equipo"
                           onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57" >
                    <br>
                    <br>
                    <label>Teclado</label>
                    <input type="text" maxlength="15" name="teclado2" required="true" id="id_tecla"
                           onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57">
                    <br>
                    <br>
                    <label>Mouse</label>
                    <input  type="text" maxlength="15" name="mouse2" required="true" id="id_mouse"
                            onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57">
                    <br>
                    <br>
                    <label>Accesorio</label>
                    <input type="text" maxlength="15" name="extra2" required="true" id="id_acsessextra"
                           onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57">
                    <br>
                    <br>
                    <label>CPU</label>
                    <input type="text" maxlength="15" name="cpu2" required="true" id="id_cpu"
                           onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57">
                    <br>
                    <br>
                    <label>Monitor</label>
                    <input type="text" maxlength="15" name="monitor2" required="true" id="id_mon"
                           onkeypress="return(event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32) || event.charCode >= 48 && event.charCode <= 57">
                    <br>
                    <br>
                    <label>Laboratorio</label>
                    <select class="garbanzo" name="lab2" id="lab">
                        <option class="daylight" value="123">LDS</option>
                        <option class="daylight" value="345">LNT</option>
                        <option class="daylight" value="567">LBD</option>
                        <option class="daylight" value="789">4.0</option>
                    </select>
                    <br>
                    <br>
                    <label>Tu identificador</label>
                    <input type="text" name="id_usu2">
                    <br>
                    <br>
                    <input class="elefante" type="submit" value="Editar Equipo">
                </form>
                    <br>
                    <br>
                    <button type="button" onclick="location.href = 'InicioAlumno.jsp'"><span></span>Regresar</button>
                    <button type="reset"><span></span>Borrar</button>
            </div>
        </div>
    </body>
</html>
