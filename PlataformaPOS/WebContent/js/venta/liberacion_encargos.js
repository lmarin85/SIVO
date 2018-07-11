var estado = "";	

function mensajeError(mensaje){
		
		if("GRADUACION"==mensaje){
			alert("El encargo no posee una graduaci�n asociada, favor revisar el encargo y volver a intentar la liberaci�n");
		}
		if("TRIO"==mensaje){
			alert("El encargo no posee un tr�o optico  bien armado, favor revisar el encargo y volver a intentar la liberaci�n");
		}
		
		if("GRADUACION_L"==mensaje){
			alert("El lente de contacto asociado al encargo no posee una graduaci�n asociada, favor revisar el encargo y volver a intentar la liberaci�n");
		}
		if("OJO_L"==mensaje){
			alert("El lente de contacto asociado al encargo no tiene determinado ojo derecho o izquierdo, favor revisar el encargo y volver a intentar la liberaci�n");
		}
	}



	function inicio_pagina_liberacion(){
		
		var pagina = document.getElementById("pagina_status").value;
		
		/*if("inicio" == pagina){
			document.getElementById("").style.display="none";
			document.getElementById("scrolling_liberacion").style.display="none";
			document.getElementById("id_detalle_liberacion").style.display="none";
			document.getElementById("scroll_encargo_detalle").style.display="none";
			document.getElementById("scroll_suplemento").style.display="none";	
		}else{
			document.getElementById("id_tabla1").style.display="none";
		}*/
	}
	
	function busar_liberacion(){
		
		document.getElementById("accion").value='buscar';
		document.busquedaLiberacionesForm.submit();	
		
	}

	function selecciona(codigo)
		{	
			document.getElementById("accion").value='detalles';
			document.busquedaLiberacionesForm.submit();			
		}
	function deshabilitaCantidadCdd(indice, control)
		{
			if (control.checked == true){
				document.getElementById('cdd_' + indice).value = 0;
			}
			else
			{
				document.getElementById('cdd_' + indice).value = "";
				document.getElementById('cdd_' + indice).focus();
			}
				
		}
	function seleccionaDetalle(codigo,grupo, index, linea)
		{
			document.getElementById("accion").value='detalles';
			document.getElementById("codigoDetalle").value=codigo;
			document.getElementById("grupoDetalle").value=grupo;
			document.getElementById("poscroll").value=document.getElementById("scrolling_liberacion").scrollTop;			
			document.getElementById('indexForm').value=index;
			document.getElementById('lineaDetalle').value=linea;
			document.busquedaLiberacionesForm.submit();			
		}	
	function detalle_suplemento(codigo,index2)
		{
			document.getElementById("accion").value='suplemento';
			document.getElementById("identPedtv").value=codigo;	
			document.getElementById('index2').value=index2;
			document.busquedaLiberacionesForm.submit();
		}
	function liberacion_pedidod()
		{
			var pagina_status = document.getElementById("pagina_status").value;
			if("inicio"==pagina_status){
				alert("Debe realizar una busqueda de los pedidos a liberar");
			}else{
				if (estado == "") {
					estado = "liberando";
					document.getElementById("accion").value='liberacion';
					document.busquedaLiberacionesForm.submit();
				}
				else
				{
					alert("Se estan liberando los encargos seleccionados. espere un momento");
				}
				
			}
			
		}
		
	function carga_inicial(){
		
		var posicion = document.getElementById("poscroll").value;
		var index = document.getElementById('indexForm').value;
		var index2 = document.getElementById('index2').value;
		document.getElementById("scrolling_liberacion").scrollTop =posicion;		
		colordeTabla(document.getElementById('contenido'));
		colordeTabla(document.getElementById('contenido2'));
		
		if("" != index && null != index){
			ele = document.getElementById(index);
			
	 		ele.style.background = '#FFFE82';
		}
		index2 = "detalle"+index2;
		
		if("" != index2 && null != index2){
			ele2 = document.getElementById(index2);
			if("" != ele2 && null != ele2){
		 		ele2.style.background = '#FFFE82';		 		
			}
		}
		
		if (document.getElementById('mensaje').value != "") {
			alert(document.getElementById('mensaje').value);
		}
		
		if (document.getElementById('respuestaLiberacion').value == "OK") {			
			alert("La liberacion se realizo de forma exitosa");
			document.getElementById('respuestaLiberacion').value="";
		}else if(document.getElementById('respuestaLiberacion').value != "" && document.getElementById('respuestaLiberacion').value != "OK"){
			alert(document.getElementById('respuestaLiberacion').value);
			document.getElementById('respuestaLiberacion').value="";
		}
		
	}