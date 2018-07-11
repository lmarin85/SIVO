var returnVal = "";
			
			document.oncontextmenu=inhabilitar;
			function inhabilitar(){return false;}
        	function combo(){
        	
        	 tipo = busquedaProductosForm.tipo.value;
        	 
        	 var erroMultioferta = busquedaProductosForm.erroMultioferta.value;
        	 
        	 if(erroMultioferta =='error'){
        	 	alert("Excede el n\u00FAmero de art\u00EDculos de la Multioferta");
        	 }
        	 
        	 if(tipo == "tipofamilia"){
        	 		
        	 		document.busquedaProductosForm.familia.disabled=false;
                 	document.busquedaProductosForm.subFamilia.disabled=true;
                 	document.busquedaProductosForm.grupo.disabled=true;
                 	document.busquedaProductosForm.tipofamilia.disabled=false;
        	 	}else if(tipo=="familia"){
        	   		document.busquedaProductosForm.familia.disabled=false;
                 	document.busquedaProductosForm.subFamilia.disabled=false;
                 	document.busquedaProductosForm.grupo.disabled=true;
                }
                else if(tipo=="subfamilia"){   
                	document.busquedaProductosForm.familia.disabled=false;             	
               		document.busquedaProductosForm.subFamilia.disabled=false;
                	document.busquedaProductosForm.grupo.disabled=false;
                }else{        	
                	document.busquedaProductosForm.subFamilia.disabled=true;
                	document.busquedaProductosForm.grupo.disabled=true;
                	document.busquedaProductosForm.familia.disabled=false;
                	document.getElementById("familia").selectedIndex =0;
                }
        	}
        	
        	function cerrar()
        	{
        		window.parent.hidePopWin(false);
        		/*if (document.getElementById("cantidad_prod").value == 'true') 
        		{
        			window.parent.hidePopWin(false);
				}
        		else
        		{
        			var mensaje1="Debe ingresar la totalidad de productos de la multioferta.\n";
        			//var mensaje2="Realmente desea salir del ingreso de productos multiofertas";
        			var mensaje = mensaje1;
        			alert(mensaje);        			
        			//window.parent.hidePopWin(false);        			
        		}*/
        	}
            function Seleccion(tipo)
            {           
            	document.busquedaProductosForm.tipo.value = tipo;            	
            	form_origen = document.getElementById("form_origen").value;
            	var errorOjo = false;
            	var bloquea = document.getElementById("bloquea").value;
            	var estadoEncargo = document.getElementById("estadoEncargo").value;
            	var tienePagos = document.getElementById("tienePagos").value;
            	 
            	if("true" != tienePagos){
            	if("cerrado" != estadoEncargo){
    		    if("bloquea"!= bloquea){  		    	
            	
	            	if("PEDIDO" == form_origen){ 	
	            		
			            	if(tipo == "tipofamilia"){       	 		
			                 	var valor = document.busquedaProductosForm.tipofamilia.value;
			                 	
			                 	if("C" == valor || "L" == valor){
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="";	                 		
			                 	}else{
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="none";	
			                 	}
			                 	
			                 	document.busquedaProductosForm.submit();
			                 	               	
			        	 	}else if(tipo=="familia"){
			        	   		var valor = document.busquedaProductosForm.familia.value;
			                 	
			        	   		var valor = document.busquedaProductosForm.tipofamilia.value;
			                 	
			                 	if("C" == valor || "L" == valor){
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="";	                 		
			                 	}else{
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="none";	
			                 	}
			        	   		
			                 	document.busquedaProductosForm.submit();
			                 	
			                }
			                else if(tipo=="subfamilia"){               	             	
			               		var valor=document.busquedaProductosForm.subFamilia.value;
			               		var valor = document.busquedaProductosForm.tipofamilia.value;
			                 	
			                 	if("C" == valor || "L" == valor){
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="";	                 		
			                 	}else{
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="none";	
			                 	}   
			                 	document.busquedaProductosForm.submit();
			                }else{    
			                	
			                	var valor = document.busquedaProductosForm.tipofamilia.value;
			                 	
			                 	if("C" == valor || "L" == valor){
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="";	
			            			
			            			if(!document.getElementById("ojo_derecho").checked && !document.getElementById("ojo_izquierdo").checked)
									{
										alert("Debe seleccionar un ojo, para realizar la busqueda.");
										
									}else{								
										var valor = document.busquedaProductosForm.grupo.value;			                 	
					                	document.busquedaProductosForm.submit();
									}
			                 	}else{
			                 		Seccion = document.getElementById("mostrarGraduacionID");
			            			Seccion.style.display="none";
			            			document.busquedaProductosForm.submit();
			                 	}     	
			                 
			                }  
	            		
	            	}else{
	            		
	            		if(tipo == "tipofamilia"){       	 		
		                 	var valor = document.busquedaProductosForm.tipofamilia.value;
		                 	//if(valor != 0){
		                 		document.busquedaProductosForm.submit();
		                 	//}else{
		                 	//alert("Debe seleccionar un producto");
		                 	//}                 	
		        	 	}else if(tipo=="familia"){
		        	   		var valor = document.busquedaProductosForm.familia.value;
		                 	//if(valor != 0){
		                 		document.busquedaProductosForm.submit();
		                 	/*}else{
		                 		alert("Debe seleccionar un producto");
		                 	}*/
		                }
		                else if(tipo=="subfamilia"){               	             	
		               		var valor=document.busquedaProductosForm.subFamilia.value;
		               		//if(valor != 0){
		                 		document.busquedaProductosForm.submit();
		                 	/*}else{
		                 		alert("Debe seleccionar un producto");
		                 	} */               	
		                }else{        	
		                	
		                	var valor = document.busquedaProductosForm.grupo.value;
		                	//if(valor != 0){
		                 		document.busquedaProductosForm.submit();
		                 	/*}else{
		                 		alert("Debe seleccionar un producto");
		                 	}*/
		                }        
	            	}	            	
            	
    		    }else{
    		    	alert("El encargo esta bloqueado, no puede agregar productos.");
    		    }
            	}else{
            		alert("La venta esta cerrada, no es posible eliminar productos");
            	}
            	}else{
            		alert("El Encargo tiene pagos realizados, no es posible agregar productos");
            	}
            	
            	
            }
            function seleccionaProducto(codigo)
            {
                tabla = document.getElementById('tablaSeleccion');
                tabla.style.display = 'block';
                document.getElementById('producto').value = codigo;
                document.getElementById('cantidad').value = 1;
            }

            function pasar_Producto()
            {
            	if(document.getElementById('cantidad').value > 0)
                    {
                    	producto = document.getElementById('producto').value;
	                    cantidad = document.getElementById('cantidad').value;
	                    returnVal = new Array(producto, cantidad);
	                    window.parent.hidePopWin(true);
                    }
                else 
                    {
                        alert("Debe ingresar la cantidad de productos");
                    }
            }
            
            function pasar_producto_multioferta(tipo, codigo_producto){
            	
            	try{
            		parent.actualizaEstaGrabado();
            	}catch(err){
            		
            	}
            	
            	document.getElementById("producto").value = codigo_producto;
            	document.getElementById('cantidad').value = 1; 
            	document.busquedaProductosForm.tipo.value = tipo;
            	
            	try {
            		var tipo = document.getElementById('chk_cerca');
                	if (tipo.checked == true) {
                		document.getElementById('descripcion').value = 'Cerca';
    				}
                	else
                	{
                		document.getElementById('descripcion').value = 'Lejos';
                	}
				} catch (e) {
					// TODO: handle exception
				}
            	
                document.busquedaProductosForm.submit();              
            
            }
			
			function eliminarProducto(codigo, index)
         	{				
				try{
            		parent.actualizaEstaGrabado();
            	}catch(err){
            		
            	}
         		document.getElementById('productoSeleccionado').value = codigo;
         		document.getElementById('index_producto_multi').value = index;
         		document.getElementById('accion').value = "eliminarProducto";
         		document.busquedaProductosForm.submit();
         		//location.href();
         	}
			
			function detalleOpticoMulti(id)
         	{ 
         		Seccion = document.getElementById(id);
    			if (Seccion.style.display=="none"){Seccion.style.display="";}
    			else{Seccion.style.display="none";} 
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
			
			function seleccionTratamientos(producto)
			{	
//				var bloquea = document.getElementById("bloquea").value;
//            	var estadoEncargo = document.getElementById("estadoEncargo").value;
//            	var tienePagos = document.getElementById("tienePagos").value;
//           	 
//            	if("false" == tienePagos){
//            	if("cerrado" == estadoEncargo){
//    		    if("bloquea"!= bloquea){  	
    		    	
	    		    document.getElementById('accion').value = "ver_Suplementos";
					document.getElementById('productoSeleccionadoSuplemento').value = producto;	
	            	document.busquedaProductosForm.submit();
            	
//    		    }else{
//    		    	alert("El encargo esta bloqueado, no puede agregar productos.");
//    		    }
//            	}else{
//            		alert("La venta esta cerrada, no es posible eliminar productos");
//            	}
//            	}else{
//            		alert("El Encargo tiene pagos realizados, no es posible agregar productos");
//            	}
			}
			function cargaSuplementos(variable)
	        {
	         		if(variable == "con_suplementos")
	         		{
	         			document.getElementById('accion').value = "agregarSuplementos";
	         			document.busquedaProductosForm.submit();
	         		}
	         }
			
			function verificaNumero(campo){
	         	if (campo.value == "") {
					campo.value = "0";
				}
	         }
			
			function actualiza_grupo(indexmulti, index)
			{					
				document.getElementById('accion').value = "grupo";
				document.getElementById('productoSeleccionadoSuplemento').value = indexmulti;
				document.getElementById("indexProductos").value = index;
				document.busquedaProductosForm.submit();	        	
	        }
			