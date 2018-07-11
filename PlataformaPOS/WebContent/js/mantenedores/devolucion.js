
function deshabilitarCamposAlbaran(){
	
				var inputs = document.all.tags("input");
			    var i;
				for(i=0;i<inputs.length;i++)
				{
					if (inputs[i].type == "text") {	
						if(inputs[i].id=="codigo1" || inputs[i].id=="codigo2" || inputs[i].id=="numero_boleta_guia"){
							inputs[i].disabled = false;								
						}else{
							inputs[i].disabled = true;
						}
												
					}	
				}
				
				var selects = document.all.tags("select");
			    for(i=0;i<selects.length;i++)
			    {
			    	selects[i].disabled = true;
			    }
			    
			    var checkbox = document.all.tags("checkbox");
			    for(i=0;i<checkbox.length;i++)
			    {
			    	checkbox[i].disabled = true;
			    }
			    
			}
			
			function reiniciarCamposAlbaran(){
				
				var inputs = document.all.tags("input");
			    var i;
				for(i=0;i<inputs.length;i++)
				{
					if (inputs[i].type == "text") {						
						inputs[i].value= "";						
					}	
				}
				
				var selects = document.all.tags("select");
			    for(i=0;i<selects.length;i++)
			    {
			    	selects[i].value = 0;
			    }
			    
			    var checkbox = document.all.tags("checkbox");
			    for(i=0;i<checkbox.length;i++)
			    {
			    	checkbox[i].disabled = true;
			    }
			    
			}

			function inicio_pagina(){
				
        	    var existeBoleta = document.getElementById('existeBoleta').value;
        	    var respuestaDevo = document.getElementById('respuestaDevolucion').value;
        	    var mensajeRetornoSp = document.getElementById('mensajeRetornoSp').value;
        	    var respuestaValidaMultiofertas = document.getElementById("respuestaValidaMultiofertas").value;
        	    
        	    if(existeBoleta == "TRUE" || existeBoleta == "true"){
        	    	alert(mensajeRetornoSp);
        	    	document.getElementById('existeBoleta').value="";
        	    }else if(existeBoleta == "NO"){
        	    	alert("La boleta no esta asociada a una venta");
        	    	document.getElementById('existeBoleta').value="";
        	    }   	
        		
        	    if("TRUE" == respuestaDevo){
        	    	alert("La devoluci\u00F3n se realiz\u00F3 de forma exitosa");
        	    	deshabilitarCamposAlbaran();
        	    	document.getElementById("codigo1").disabled=true;
        	    	document.getElementById("codigo2").disabled=true;
        	    	document.getElementById("numero_boleta_guia").disabled=true;
        	    	document.getElementById("nif").disabled=true;
        	    	document.getElementById("dvnif").disabled=true;
        	    	document.getElementById('idpagos').style.display = 'none';
        	    	
        	    	document.getElementById("buscarRapido").style.display = 'none';
        	    	document.getElementById("buscarBoleta").style.display = 'none';
        	    	document.getElementById("idbuscar").style.display = 'none';
        	    	document.getElementById('respuestaDevolucion').value="";
        	    	
        	    }else if("FALSE" == respuestaDevo){
        	    	alert("Error en el ingreso de la devoluci\u00F3n, cargue nuevamente el albaran e intente devolver nuevamente");
        	    	document.getElementById("buscarRapido").style.display = 'none';
        	    	document.getElementById("buscarBoleta").style.display = 'none';
        	    	document.getElementById("idbuscar").style.display = 'none';
        	    	document.getElementById('respuestaDevolucion').value="";
        	    }
        	    
        	    var estadoCaja = document.getElementById("elimina_albaran").value;
        	    if("true" == estadoCaja){
        	    	document.getElementById('delete').style.display = '';
        	    }else{
        	    	document.getElementById('delete').style.display = 'none';
        	    }
        	    
        	    var mostrarIconos = document.getElementById("mostrarIconos").value;
        	    var tipo_albaran = document.getElementById("tipo_albaran").value;        	    
        	    var albaranDevolcionPago = document.getElementById("albaranDevolcionPago").value;
        	    
        	    if("DIRECTA" == tipo_albaran){
        	    	deshabilitarCamposAlbaran();
	        	    if("true" == mostrarIconos){
	        	    	document.getElementById('idpagos').style.display = '';
	        	    	document.getElementById('idlista').style.display = '';  
	        	    	document.getElementById('idcobrar').style.display = ''; 
	        	    }else{
	        	    	document.getElementById('idpagos').style.display = 'none';
	        	    	document.getElementById('idlista').style.display = 'none';
	        	    	document.getElementById('idcobrar').style.display = 'none'; 
	        	    }
        	    }else if("ENTREGA" == tipo_albaran){
        	    	deshabilitarCamposAlbaran();
        	    	if("true" == mostrarIconos){
	        	    	document.getElementById('idpagos').style.display = 'none';
	        	    	document.getElementById('idlista').style.display = '';        	    	
	        	    }else{
	        	    	document.getElementById('idpagos').style.display = 'none';
	        	    	document.getElementById('idlista').style.display = 'none';
	        	    }        	    	
        	    }else if("DEVOLUCION" == tipo_albaran && "OK" == albaranDevolcionPago){
        	    	deshabilitarCamposAlbaran();
	        	    if("true" == mostrarIconos){
	        	    	document.getElementById('idpagos').style.display = '';
	        	    	document.getElementById('idlista').style.display = '';  
	        	    	document.getElementById('idcobrar').style.display = ''; 
	        	    }else{
	        	    	document.getElementById('idpagos').style.display = 'none';
	        	    	document.getElementById('idlista').style.display = 'none';
	        	    	document.getElementById('idcobrar').style.display = 'none'; 
	        	    }
        	    }else if("DEVOLUCION" == tipo_albaran){
        	    	
        	    	var devolver_vta = document.getElementById("devolver_vta").value;
        	    	//document.getElementById('botondevolucion').style.display = '';
        	    	if("true" == devolver_vta){
        	    		if("TRUE" == respuestaDevo){
        	    			document.getElementById('idcobrar').style.display = 'none'; 
        	    		}else{
        	    			document.getElementById('idcobrar').style.display = '';
        	    		}
        	    		
        	    		document.getElementById('buscar_rapido_cliente').style.display = '';
            	    	document.getElementById('buscar_cliente').style.display = '';   
        	    	}else{
        	    		document.getElementById('idcobrar').style.display = 'none';
        	    		alert("Debe hacer apertura de caja, para realizar una devoluci\u00F3n");
        	    	}
        	    	
        	    	
        	    	//ESTOS NO SE UTILIZAN PARA DEVOLUCION NUNCA
        	    	document.getElementById('idpagos').style.display = 'none';
        	    	document.getElementById('idlista').style.display = 'none';
        	    	document.getElementById('idbuscar').style.display = 'none';
        	    	
        	    }else{
        	    	if("true" == mostrarIconos){
	        	    	document.getElementById('idpagos').style.display = '';
	        	    	document.getElementById('idlista').style.display = '';   
	        	    	document.getElementById('idcobrar').style.display = '';
	        	    	document.getElementById('idbuscar').style.display = '';
	        	    	
	        	    }else{
	        	    	document.getElementById('idpagos').style.display = 'none';
	        	    	document.getElementById('idlista').style.display = 'none';
	        	    	document.getElementById('idcobrar').style.display = 'none';	     
	        	    	//document.getElementById('idbuscar').style.display = 'none';//busqueda siempre activa  	    	
	        	    }
        	    	
        	    	if("buscar" == mostrarIconos){
        	    		document.getElementById('idbuscar').style.display = '';
        	    	}
        	    }
        	    
        	    var respuestaPagoAlbaran = document.getElementById("respuestaPagoAlbaran").value;
        	    var cdg_venta = document.getElementById("cdg_venta").value;     
        	    if("OKPago"==respuestaPagoAlbaran){
        	    	alert("El pago del albaran "+cdg_venta+" se realiz\u00F3 exitosamente.");
        	    	document.getElementById("respuestaPagoAlbaran").value="";
        	    	document.getElementById('idpagos').style.display = 'none';
        	    	document.getElementById('idlista').style.display = 'none';
        	    	document.getElementById('idcobrar').style.display = 'none';	
        	    	document.getElementById('delete').style.display = 'none';
        	    	document.getElementById('idbuscar').style.display = 'none';
        	    	document.getElementById('codigo1').disabled=true;
        	    	document.getElementById('codigo2').disabled=true;
        	    }
        	    
        	    var inicio_pagina = document.getElementById("inicio_pagina").value;
        	    if("inicio"== inicio_pagina){
        	    	deshabilitarCamposAlbaran();
        	    	reiniciarCamposAlbaran();        	    	     	    	
        	    }
        	    
        	    var validaCliente = document.getElementById("validaCliente").value;
        	    if("false"== validaCliente){
        	    	var mensaje1="El cliente seleccionado debe tener ingresado un Tipo V�a, V�a, N�mero V�a y Provincia.\n";
        	    	var mensaje2="No puede ser modificado por este cliente";
        	    	var mensaje = mensaje1 + mensaje2;
        	    	alert(mensaje);
        	    	document.getElementById("validaCliente").value="";
        	    }
        	    
        	    if("TRUE" == respuestaDevo){
        	    	//se valida nuevamente la respuesta de la devolocion ya que 
        	    	//se debe ocultar la imagen de pagos de albaranes        	    	
        	    	document.getElementById('idpagos').style.display = 'none';
        	    	
        	    }
        	    
        	    var respuestaEliminaAlbaran = document.getElementById("respuestaEliminaAlbaran").value;
        	    
        	    if("true" == respuestaEliminaAlbaran){
        	    	alert("El albar�n fue eliminado de forma exitosa.");
        	    	document.getElementById("respuestaEliminaAlbaran").value="";
        	    	document.getElementById("buscarRapido").style.display = 'none';
        	    	document.getElementById("buscarBoleta").style.display = 'none';
        	    	document.getElementById("idbuscar").style.display = 'none';
        	    }else if("false" == respuestaEliminaAlbaran){
        	    	alert("Error en la eliminaci�n del albar�n, cargue nuevamente el albar�n e intente eliminar");
        	    	document.getElementById("buscarRapido").style.display = 'none';
        	    	document.getElementById("buscarBoleta").style.display = 'none';
        	    	document.getElementById("respuestaEliminaAlbaran").value="";
        	    	document.getElementById("idbuscar").style.display = 'none';
        	    }else if("error_pago" == respuestaEliminaAlbaran){
        	    	alert("Error en la eliminaci�n del albar�n, tiene asociado formas de pago o boletas");
        	    	document.getElementById("buscarRapido").style.display = 'none';
        	    	document.getElementById("buscarBoleta").style.display = 'none';
        	    	document.getElementById("respuestaEliminaAlbaran").value="";
        	    	document.getElementById("idbuscar").style.display = 'none';
        	    }
        	    
        	    if("genera_cobros" == respuestaValidaMultiofertas){
        	    	cobrar_albaran_validaCaja();
        	    }else if("" != respuestaValidaMultiofertas){
        	    	alert(respuestaValidaMultiofertas);
        	    }
        	    
        	}
        	
        	function cargarDatos(){
        		
        		var enviar=true;
        		var tipoAlabaran = document.getElementById("tipoAlbaran").value;
        		var numero_boleta_guia = document.getElementById('numero_boleta_guia').value;
        		var boleta_guia = document.getElementById('boleta_guia');
        		var resp = getRadioButtonSelected(boleta_guia);
        		
        		//if("D" == tipoAlabaran){
	    		if(("" == numero_boleta_guia) ||("" ==numero_boleta_guia)){
	    			alert("Debe Ingresar un N\u00FAmero de Boleta");
	    			enviar = false;
	    		}
	    		
	    		if((null ==resp) || (false == boleta_guia)){
	    			alert("Debe Seleccionar Boleta o Gu\u00EDa");
	    			enviar = false;
	    		}
	    		if(enviar == true){
	    			//20180209 VALIDO FECHA BOLETA , DEBE SER MENOR A UN AÑO 
		    		$j.ajax({
						  type: "POST",
						  url: 'Devolucion.do?method=validaFechaNC',
						  dataType: "text",
						  data:"numero_boleta_guia="+numero_boleta_guia,
						  asycn:false,
						  success: function(data){
						  		switch(data){
						  			case "1":
						  				$j(".pantalla2,#load_gif").css("display","block");
										alert("Cargando datos ,favor  espere un momento por favor....");
										setTimeout(function(){  
											 $j(".pantalla2,#load_gif").css("display","NONE");
										}, 4000);						
										
						  				
						  				document.getElementById("tipoAlbaran").value="D";
					        			document.getElementById('accion').value = 'cargarDatos';
					        			document.getElementById("tipoAlbaran").disabled=false;
					        			document.forms[0].submit();		  				 												  								  					
						  			break;				  			
						  			case "2":
						  				enviar = false;	
						  				alert("No se pueden anular boletas con uno o m\u00E1s a\u00F1os de antiguedad.");
						  			break;
						  			default:
						  				enviar = false;	
						  				alert("No se puede realizar la devoluci\u00F3n, favor comunicarse con mesa de ayuda.");
						  			break;				  			
						  		}													  												  		
					 	  }
				 	});	
		    		
		    		
	    		}	
        		
        	}
        	
        	function getRadioButtonSelected(ctrl)
			{
        		var i;
   				 for(i=0;i<ctrl.length;i++){
        			if(ctrl[i].checked){ 
        				return true;
        			}
        		}
        		return false;
			}
			
			function devolucion(){
				
				document.getElementById('accion').value = 'devolucion';				
				var cargado = document.getElementById('cargado').value;
				var motivo = document.getElementById('motivo').value;
				
				if(cargado == "true"){
					if(0 == motivo){
						alert("Dese seleccionar un motivo de devoluci\u00F3n");
					}else{
						document.forms[0].submit();
					}
				}else{
					alert("Debe Ingresar una Boleta y Cargar los Datos");
				}
        						
			}
			
			function cargaClienteDevolucion(cliente)
			{			
				document.getElementById("codigo_cliente").value = cliente[0];
				document.getElementById("nif").value = cliente[1];           	
            	document.getElementById("dvnif").value = cliente[4];
            	document.getElementById('accion').value = "agregarCliente";	
            	document.forms[0].submit();
			}
			
			
			//LMARIN 20150602 NOTA DE CREDITO
			
			function estado_boleta(boleta){
				
				var $j = jQuery.noConflict();
				
				var tmp = boleta.split("_");
				
				var tipoimpresion = $j("#tipoimp").val() == "1" ? "Carta": "Termica";
				
				var rut = tmp[3];
				
				var nota = tmp[1]+".pdf"; 
								
				var urlbol = "http://10.216.4.16/NC/61 "+rut+" "+nota;				
				
				if(tmp[0] == "0" || tmp[2] =="true"){
					alert("Error: No se pudo generar la boleta");
					
				}else if(tmp[0] == "1" && tmp[2] =="false"){
					
					$j(".pantalla2,#load_gif").css("display","block");
					alert("Generando Nota de Cr\u00e9dito, espere un momento por favor....");
					setTimeout(function(){  
						window.open(urlbol); $j(".pantalla2,#load_gif").css("display","NONE");
					}, 4000);						
					
				}else if(tmp[0] == "2" && tmp[2] =="false"){
					alert("!ATENCI\u00d3N¡ AGREGAR MAS FOLIOS, SE ESTAN AGOTANDO");
				}
				
			}