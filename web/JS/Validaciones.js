function validar(registro_usuario){
    if(registro_usuario.nombre.value.length < 3){
        alert("Escriba por lo menos 5 Caracteres para el nombre");
        registro_usuario.nombre.focus();
        return false;
    }
    
    if(registro_usuario.paterno.value.length < 3){
        alert("Escriba por lo menos 5 Caracteres para el Apellido");
        registro_usuario.paterno.focus();
        return false;
    }
    
    if(registro_usuario.materno.value.length < 3){
        alert("Escriba por lo menos 5 Caracteres para el Apellido");
        registro_usuario.materno.focus();
        return false;
    }

    var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+"abcdefghijklmnopqrstuvwxyz";
    var checkStr = registro_usuario.nombre.value;
    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }
        
    var checkStr2 = registro_usuario.paterno.value;
    
        for(var i = 0; i < checkStr2.length; i++){
        var ch = checkStr2.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }
        
        var checkSt3 = registro_usuario.materno.value;
    
        for(var i = 0; i < checkStr3.length; i++){
        var ch = checkStr3.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }   

    if(!allValido){
        alert("Escriba únicamente letras en el campo de Nombre");
        registro_usuario.nombre.focus();
        return false;
    }

    if(!allValido){
        alert("Escriba únicamente letras en el campo de Apellido Paterno");
        registro_usuario.paterno.focus();
        return false;
    }
    if(!allValido){
        alert("Escriba únicamente letras en el campo de Apellido Materno");
        registro_usuario.materno.focus();
        return false;
    }

    var checkOK = "123456789";
    var checkStr = registro_usuario.identificador.value;
    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba únicamente números en el campo de Edad");
        registro_usuario.identificador.focus();
        return false;
    }
}

function validarNum(){
    var checkOK = "123456789";
    var checkStr = reporteAlumno.identificador.value;
    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba únicamente números en el campo de Edad");
        reporteAlumno.identificador.focus();
        return false;
    }
}