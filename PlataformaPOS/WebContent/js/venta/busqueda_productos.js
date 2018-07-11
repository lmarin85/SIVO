
			var busqueda = "";
			var returnVal = "";
			
			var alto = "380";
			var ancho = "320";

        	function combo(){
        	
        	 tipo = busquedaProductosForm.tipo.value;
        	 
        	 if(tipo=="familia"){
        	   		document.busquedaProductosForm.familia.disabled=false;
                 	document.busquedaProductosForm.subFamilia.disabled=false;
                 	document.busquedaProductosForm.grupo.disabled=true;
                }
                else if(tipo=="subfamilia"){
               		document.busquedaProductosForm.subFamilia.disabled=false;
                	document.busquedaProductosForm.grupo.disabled=false;
                }else{                               	
                	document.busquedaProductosForm.subFamilia.disabled=true;
                	document.busquedaProductosForm.grupo.disabled=true;
                }
        	 
        	 
        	}
            function Seleccion(tipo)
            {           	
             	var busqueda_avanzada = document.getElementById('busqueda_avanzada').value;
             	var busqueda_avanzada_lentilla = document.getElementById('busqueda_avanzada_lentilla').value;
             	document.busquedaProductosForm.tipo.value = tipo;
            	if (tipo == 'buscar') { 
					if (busqueda_avanzada == 'true') {
						if(!document.getElementById("ojo_derecho").checked && !document.getElementById("ojo_izquierdo").checked)
						{
							alert("Debe seleccionar un ojo, para realizar la busqueda.");
							document.busquedaProductosForm.tipo.value = "error";
						}
						else
						{
							document.busquedaProductosForm.tipo.value = "busqueda_graduada";
						}
					}
					if (busqueda_avanzada_lentilla == 'true') {
						if(!document.getElementById("ojo_derecho").checked && !document.getElementById("ojo_izquierdo").checked)
						{
							alert("Debe seleccionar un ojo, para realizar la busqueda.");
							document.busquedaProductosForm.tipo.value = "error";
						}
					}
					
				}
                document.busquedaProductosForm.submit();
            }
            function SeleccionEnter(tipo)
            {            	
           		if(event.keyCode == 13){
           		 	document.busquedaProductosForm.tipo.value = tipo;
                	document.busquedaProductosForm.submit();
           		}				
            }
            function seleccionaProducto(codigo)
            {
                //tabla = document.getElementById('tablaSeleccion');
                //tabla.style.display = 'block';
                //document.getElementById('producto').value = codigo;
                //document.getElementById('cantidad').value = 1;      
            	var $q = jQuery.noConflict();
                producto = codigo;
	            cantidad = 1;
	            var busqueda_avanzada = document.getElementById('busqueda_avanzada').value;
	            var busqueda_avanzada_lentilla = document.getElementById('busqueda_avanzada_lentilla').value;
	            if(busqueda_avanzada == 'true')
	            {	            	
		             ojo = document.getElementById('ojo').value;
		             var check = document.getElementById('chk_cerca');
	                    	var tipo = "";
	                    	if (check.checked) {
								tipo = "Cerca";
							}
							else
							{
								tipo = "Lejos";
							}
	                    	returnVal = new Array(producto, cantidad, ojo, tipo);
	            }
	            else if(busqueda_avanzada_lentilla == 'true'){
	            	ojo = document.getElementById('ojo').value;
	                returnVal = new Array(producto, cantidad, ojo);
	            }
	            else
	            {
	             	returnVal = new Array(producto, cantidad);
	            }
	   
	           $q("#seg_cristal",window.parent.document).val(returnVal);
	           window.parent.hidePopWin(true);
            }

			// ESTA FUNCION ES UTILIZADA SOLO CON EL DIV DE SELECCIONAR CANTIDAD
            function pasar_Producto()
            {
            	if(document.getElementById('cantidad').value > 0)
                    {
                    	producto = document.getElementById('producto').value;
	                    cantidad = document.getElementById('cantidad').value;
	                    var busqueda_avanzada = document.getElementById('busqueda_avanzada').value;
	                    if(busqueda_avanzada == 'true')
	                    {
	                    	ojo = document.getElementById('ojo').value;
	                    	var check = document.getElementById('chk_cerca');
	                    	var tipo = "";
	                    	if (check.checked) {
								tipo = "Cerca";
							}
							else
							{
								tipo = "Lejos";
							}
	                    	returnVal = new Array(producto, cantidad, ojo, tipo);
	                    }
	                    else
	                    {
	                    	returnVal = new Array(producto, cantidad);
	                    }
	                    window.parent.hidePopWin(true);
                    }
                else 
                    {
                        alert("Debe ingresar la cantidad de productos");
                    }
            }
            
            function cambia_estado(lado)
            {
            	if(lado == "DERECHO")
            	{
            		var check = document.getElementById('ojo_izquierdo');
            		check.checked = false;
            		document.getElementById('ojo').value = "derecho";
            		
            	}
            	if(lado == "IZQUIERDO")
            	{
            		var check = document.getElementById('ojo_derecho');
            		check.checked = false;
            		document.getElementById('ojo').value = "izquierdo";
            	}
            	
            }
            function valida_Cerca(check)
            {	
				if (check.checked == true) 
				{
				var ojoD = document.getElementById('ojo_derecho');
				var ojoI = document.getElementById('ojo_izquierdo');
				
						if(!ojoD.checked && !ojoI.checked)
							{
								alert("Debe seleccionar un ojo");
								check.checked = false;
							}
							else
							{
								if (ojoD.checked) {
									document.getElementById('ojo').value = "derecho";
								}
								if (ojoI.checked) {
									document.getElementById('ojo').value = "izquierdo";
								}
								document.busquedaProductosForm.tipo.value = "valida_cerca";
		                		document.busquedaProductosForm.submit();
							}
				}
				else
				{
					document.busquedaProductosForm.tipo.value = "valida_cerca_no";
            		document.busquedaProductosForm.submit();
				}
            	
            }
            function carga_busqueda_graduacion()
            {
            	popup('seleccionGraduaciones', alto, ancho);
            } 
            function seleccionaGraduacion(indice, tipo)
            {
            	document.busquedaProductosForm.graduacion_seleccionada.value = indice;
            	document.busquedaProductosForm.tipo.value = tipo;
                document.busquedaProductosForm.submit();
            }
            function error_cerca()
            {
            	alert("Debe tener valor en adicion");
            }
            function error_sin_graduacion()
            {
            	alert("Cliente no tiene graduaciones, no es posible vender productos graduados");
            }