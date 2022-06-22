/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function buscarDatos(){
    var registros = document.getElementById('datosTabla');
    var buscadorText = document.getElementById('buscadorTxt').value.toLowerCase();
    var celdasFila = " ";
    var anchoTabla = " ";
    var encontrar = false;
    
    //Recorremos todas las filas con contenido de la tabla
    for(var i = 1; i < registros.rows.length; i++){
        celdasFila = registros.rows[i].getElementsByTagName('td');
        encontrar = false;
        
        //Recorremos todas las celdas
        for(var j = 0; j < celdasFila.length && !encontrar; j++){
            anchoTabla = celdasFila[j].innerHTML.toLowerCase();
            
            //Buscamos el texto en el contenido de la celda
            if(buscadorText.length === 0 || (anchoTabla.indexOf(buscadorText) > -1)){
                encontrar = true;
            }
        }
        
        if(encontrar){
            registros.rows[i].style.display = '';
        }else{
            //Si no ha encontrado conincidencias, esconde la fila de la tabla
            registros.rows[i].style.display = 'none';
        }
    }
}
