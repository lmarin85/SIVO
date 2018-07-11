function inicio_pagina(){	
	document.getElementById('habilitaCampo').value="deshabilitado";
	var inputs = document.all.tags("input");
    var i;
	for(i=0;i<inputs.length;i++)
	{
		if (inputs[i].type == "text") {			
			
			inputs[i].disabled = true;						
		}	
	}
	
	var retornoMOdificacion = document.getElementById('retornoMOdificacion').value;
	var localErrorFolio = document.getElementById('localErrorFolio').value;
	var mensaje = document.getElementById('mensaje').value;
	
	if("exito" == retornoMOdificacion){
		alert("El cambio de folio se realiz\u00F3 con \u00E9xito");	
	}else if("GUIA" == retornoMOdificacion){
		
		alert("El folio ingresado en las gu\u00EDas de despacho ya esta siendo utilizado en la tienda "+localErrorFolio+", ingrese otro folio");
		
	}else if("BOLETA" == retornoMOdificacion){
		
		alert("El folio ingresado en las boletas ya esta siendo utilizado en la tienda "+localErrorFolio+", ingrese otro folio");
		
	}else if("NOTA" == retornoMOdificacion){
		
		alert("El folio ingresado en las notas de credito ya esta siendo utilizado en la tienda "+localErrorFolio+", ingrese otro folio");
		
	}else if("error" == retornoMOdificacion){
		alert("Error en el cambio de folio");
	}else if("error_diferencia" == retornoMOdificacion){
		alert(mensaje);
	}
	
}

function habilitarCampos(){
	
	document.getElementById("estaGrabado").value = 0;
	document.getElementById('habilitaCampo').value="habilitado";
	var inputs = document.all.tags("input");
    var i;
	for(i=0;i<inputs.length;i++)
	{
		if (inputs[i].type == "text") {				
			inputs[i].disabled = false;						
		}	
	}	
	
}

function guardarFolio(){
	
	var habilitaCampo = document.getElementById('habilitaCampo').value;	
	var respuesta = false;
	
	var desdeGuia = document.getElementById('desdeGuia').value;
	var hastaGuia = document.getElementById('hastaGuia').value;	
	respuesta = validaDesdeHasta(desdeGuia, hastaGuia, "Guia");
	
	
	var desdeBoleta = document.getElementById('desdeBoleta').value;
	var desdeBoleta = document.getElementById('hastaBoleta').value;
	if(respuesta){
		respuesta = validaDesdeHasta(desdeGuia, hastaGuia, "Boleta");
	}
	
	
	var desdeNota = document.getElementById('desdeNota').value;
	var hastaNota = document.getElementById('hastaNota').value;	
	if(respuesta){
		respuesta = validaDesdeHasta(desdeNota, hastaNota, "Nota de credito");
	}
	
	if(respuesta){		
		if("habilitado" == habilitaCampo){
			document.getElementById('tipo').value="guardarFolio";
			var respuesta = confirm("¿Realmente desea modificar los folios?");
			if(respuesta){
				document.forms[0].submit();
			}
			
		}else{
			alert("Debe habilitar los Folios para ser modificados");
		}	
	}
}

function validaDesdeHasta(desde, hasta, texto){
	
	if(desde > hasta){
		alert("El inicio de "+texto+" no puede ser mayor al t\u00E9rmino.");
		return false;
	}else{
		var diferencia = hasta - desde;
		if(diferencia > 500){
			alert("La cantidad de Folios de "+texto+" no puede ser mayor a 500");
			return false
		}
	}	
	return true;
}
