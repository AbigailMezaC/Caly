<%-- 
    Document   : RegistroEquipo
    Created on : 25/05/2022, 05:39:12 PM
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

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/style.css">
        <link rel="icon" href="./img/logo.jpg">
        <title>Registrar Equipo</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilAlumno.jsp">Perfil </a></li>
                </ul>
            </div>
            <div class="Chocolate">
                <h1>Registro</h1>
                <br>
                <form method="post" action="guardarEquipo">
                    <label>ID Equipo:</label>
                    <input type="text" maxlength="20" name="id equipo" required="true" id="id_equipo" onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                    <br>
                    <br>
                    <label>ID CPU:</label>
                    <input type="text" maxlength="15" name="CPU" required="true" id="id_cpu"
                           onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                    <br>
                    <br>
                    <label>ID Mouse:</label>
                    <input  type="text" maxlength="15" name="Mouse" required="true" id="id_mouse"
                            onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                    <br>
                    <br>
                    <label>ID Accesorio:</label>
                    <input type="text" maxlength="15" name="Acsessextra" required="true" id="id_acsessextra"
                           onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                    <br>
                    <br>
                    <label>ID Teclado:</label>
                    <input type="text" maxlength="15" name="teclado" required="true" id="id_tecla"
                           onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                    <br>
                    <br>
                    <label>ID Monitor:</label>
                    <input type="text" maxlength="15" name="Monitor" required="true" id="id_mon"
                           onkeypress="return(event.charCode >= 48 && event.charCode <= 57)">
                    <br>
                    <br>
                    <label>Laboratorio:</label>
                    <select class="garbanzo" name="lab" id="lab">
                        <option class="daylight" value="123">LDS</option>
                        <option class="daylight" value="345">LNT</option>
                        <option class="daylight" value="567">LBD</option>
                        <option class="daylight" value="789">4.0</option>
                    </select>

                    <input type="hidden" name="id_usu" id="id_usu" value="<%=usuario%>">
                    <br>
                    <br>
                    <input class="elefante" type="submit" value="Registrar Equipo">
                    <button type="button" onclick="location.href = 'InicioAlumno.jsp'"><span></span>Regresar</button>
                    <button type="reset"><span></span>Borrar</button>
                </form>  
            </div>
        </div>
    </body>
</html>
<%
    }
%>