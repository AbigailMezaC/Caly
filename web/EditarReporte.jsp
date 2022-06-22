<%@page import="Modelo.ConsultarReporte"%>
<%@page import="Modelo.MReporte"%>
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
        <title>Editar Reporte</title>
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <img src="./img/Mi proyecto.png" class="logo">
                <ul>
                    <li><a href="./PerfilDocenteAdmin.jsp">Perfil</a></li>
                </ul>
            </div>
        </div>
        <div class="Chocolate2">
            <h1>Actualizar Reporte</h1>
            <br>
            <form method="post" action="editarReporte">
                <%
                int id_usuario=Integer.parseInt(request.getParameter("id_usuario"));
                
                ConsultarReporte cr=AccionesAdministrador.buscaridUsuario(id_usuario);
                

                %>
                <label>Tu identificador</label>
                <input type="text" readonly="readonly" name="usu" value="<%=cr.getId_usuario()%>"  id="usu">
                <br>
                <br>
                <label>ID equipo:</label>
                <input type="text" maxlength="15" readonly="readonly" name="id_equipo" value="<%=cr.getId_equipo()%>" required="true"  id="id_equipo">
                <br>
                <br>
                <label>Laboratorio</label>
                <select class="garbanzo" name="laboratorio" value="<%=cr.getNom_lab() %>" readonly="readonly">
                    <option class="daylight" value="123">LDS</option>
                    <option class="daylight" value="345">LNT</option>
                    <option class="daylight" value="567">LBD</option>
                    <option class="daylight" value="789">4.0</option>
                </select>
                <br>
                <br>
                <label>Materia</label>
                <select class="garbanzo" readonly="readonly" value="<%=cr.getMateria()%>"    name="materia"  id="materia">
                    <option class="daylight" value="31">Programación Orientada a Objetos</option>
                    <option class="daylight" value="32">Administración de Proy. de Tec. de la Información I</option>
                    <option class="daylight" value="33">Laboratorio de Proy. de Tec. de la Información I</option>
                    <option class="daylight" value="41">Programación y Servicios Web</option>
                    <option class="daylight" value="42">Base de Datos</option>
                    <option class="daylight" value="43">Laboratorio de Proy. de Tec. de la Información II</option>
                    <option class="daylight" value="44">Tecnicas de Programación Personal con Calidad</option>
                    <option class="daylight" value="45">Administración de Proy. de Tec. de la Info. II</option>
                    <option class="daylight" value="51">Seguridad web y aplicaciones</option>
                    <option class="daylight" value="52">Introduccion a la ingenieria de Pruebas</option>
                    <option class="daylight" value="53">Laboratorio de Proy. de Tec. de la Info. III</option>
                    <option class="daylight" value="54">Introducción a los Sistemas Distribuidos</option>
                    <option class="daylight" value="55">Automatizacion de Pruebas</option>
                    <option class="daylight" value="56">Desarrollo humano y personal</option>
                    <option class="daylight" value="61">Metodos Agiles de Programacion</option>
                    <option class="daylight" value="62">Soporte de Software</option>
                    <option class="daylight" value="63">Laboratorio de Proy. de Tec. de la Info. IV</option>
                    <option class="daylight" value="64">Ingenieria de Software Básica</option>
                    <option class="daylight" value="65">Plan de Negocios</option>
                    <option class="daylight" value="66">Proyecto Integrador</option>
                </select>
                <br>
                <br>
                <label>Descripción:</label>
                <input type="text" maxlength="100" readonly="readonly" name="descripcion" value="<%=cr.getDes_report() %>" required="true" id="des_report">
                <br>
                <br>
                <label>Hora:</label>
                <input type="text" maxlength="15" readonly="readonly" name="hora" required="true" value="<%=cr.getHora_report()%>" id="hora">
                <br>
                <br>
                <label>Fecha:</label>
                <input type="date" maxlength="15" readonly="readonly" name="fecha_reporte" value="<%=cr.getFecha_report() %>" required="true" id="fecha_report">
                <br>
                <br>
                <label>Comentario:</label>
                <input  type="text" maxlength="50" readonly="readonly" name="comentario" value="<%=cr.getComentario()%>"  required="false" id="comentario">
                <br>
                <br>
                <label>Tipo de reporte:</label>
                <select class="garbanzo" readonly="readonly" name="tipreport" value="<%=cr.getTipreport()%>"  id="tipreport">
                    <option class="daylight" value="7">Faltantes</option>
                    <option class="daylight" value="8">Hadware</option>
                    <option class="daylight" value="9">Software</option>
                </select>
                <br>
                <br>
                <label>Prioridad:</label>
                <select class="garbanzo" name="prioridad" readonly="readonly" value="<%=cr.getPriori()%>"  id="prioridad">
                    <option class="daylight" value="1">Urgente</option>
                    <option class="daylight" value="2">No urgente</option>
                </select>
                <br>
                <br>
                <label>Estado de reporte:</label>
                <select class="garbanzo" name="estado2" value="<%=cr.getEstatus()%>" id="estado">
                    <option class="daylight" value="10">Solucionado</option>
                    <option class="daylight" value="11">Sin solucionar</option>
                    <option class="daylight" value="12">En proceso</option>
                </select>
                <br>
                <br>
                <input class="elefante" type="submit" value="Actualizar Reporte">
                <br>
                <button type="button" onclick="location.href = 'InicioAdministrador.jsp'"><span></span>Regresar</button>
                <button type="reset"><span></span>Borrar</button>
            </form>
        </div>
    </div>
</body>
</html>
<%
    }
%>