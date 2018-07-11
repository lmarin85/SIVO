        var estado = "";
        var flujo = "";
       
        function carga_url_padre(url)
	        {
	 			parent.carga_url_padre(url);
	        }
        function cargaPresupuestoSeleccionado(presupuesto)
		{	
			document.getElementById("productoSeleccionado").value = presupuesto[3];
			document.getElementById('accion').value = "cargaPresupuestoSeleccion";
			document.presupuestoForm.submit();
		} 
        
        function intercept(event,index, campo) {
		    var key = event.keyCode ? event.keyCode : event.which ? 
		        event.which : event.charCode;
		    if (key == 9) {
		    	return false;
		    }
		    else
		    {
		    	return true;
		    }
		}
        function devuelve_descuento(valores)
		{
			var acceso = valores[0];
			var descuento_autorizado = valores[1];
			var usuario = valores[2];
        	if (acceso == "true") {
    			var descuento_ingresado = document.getElementById('cantidad').value;
    			
    			var comparacion = parseFloat(descuento_ingresado) > parseFloat(descuento_autorizado);
    			
    			if (comparacion) {
    				alert("El descuento máximo autorizado es de " + descuento);
    				document.presupuestoForm.submit();
    			}
    			else
    			{
    				document.getElementById('productoSeleccionado').value = indice;
    				document.getElementById('cantidad_descuento').value = descuento.replace(',','.');;
    				document.getElementById('accion').value = "descuento_linea";
    				document.getElementById("descuento_autoriza").value = usuario;
    	        	document.presupuestoForm.submit();
    			}
    		}
    		else
    		{
    			alert("Usted no esta autorizado, para realizar este tipo de descuento");;
    			document.presupuestoForm.submit();
    		}
		}
        
        function devuelve_descuento_total(valores)
		{
			var acceso = valores[0];
			var descuento_autorizado = valores[1];
			var usuario = valores[2];
        	if (acceso == "true") {
    			
    			var comparacion = parseFloat(descuento) > parseFloat(descuento_autorizado);
    			
    			if (comparacion) {
    				alert("El descuento máximo autorizado es de " + descuento);
    				document.presupuestoForm.submit();
    			}
    			else
    			{
    				document.getElementById('cantidad_descuento').value = descuento.replace(',','.');
    				document.getElementById('accion').value = "descuento_total";
    				document.getElementById("descuento_autoriza").value = usuario;
    	        	document.presupuestoForm.submit();
    			}
    		}
    		else
    		{
    			alert("Usted no esta autorizado, para realizar este tipo de descuento");;
    			document.presupuestoForm.submit();
    		}
		}	
        
        function devuelve_descuento_total_monto(valores)
		{
			var acceso = valores[0];
			var descuento_autorizado = valores[1];
			var usuario = valores[2];
        	if (acceso == "true") {
    			
    			var comparacion = parseFloat(descuento_porc) > parseFloat(descuento_autorizado);
    			
    			if (comparacion) {
    				alert("El descuento máximo autorizado es de " + descuento_autorizado);
    				document.presupuestoForm.submit();
    			}
    			else
    			{
    				document.getElementById('cantidad_linea').value = descuento;
    				document.getElementById('accion').value = "descuento_total_monto";
    				document.getElementById("descuento_autoriza").value = usuario;
    	        	document.presupuestoForm.submit();
    			}
    		}
    		else
    		{
    			alert("Usted no esta autorizado, para realizar este tipo de descuento");;
    			document.presupuestoForm.submit();
    		}
		}
        
       	 function cargaProducto(producto)
            {
            	document.getElementById('accion').value = "agregarProducto";
                document.getElementById("productoSeleccionado").value = producto[0];
            	document.getElementById("cantidad").value = producto[1];
            	document.getElementById("ojo").value = producto[2];
            	document.getElementById("tipo").value = producto[3];
                document.presupuestoForm.submit();
            }
       	 
            
         function cargaSuplementos(variable)
         	{
         		if(variable == "con_suplementos")
         		{
         			document.getElementById('accion').value = "agregarSuplementos";
         			document.presupuestoForm.submit();
         		}
         	}
            
         function seleccionarProducto(index, esfera, cilindro,diametro)
         	{
         		document.getElementById('esfera').value = esfera;
         		document.getElementById('cilindro').value = cilindro;
         		document.getElementById('diametro').value = diametro;
         		
         		 colordeTabla(document.getElementById('contenido'));	
         	
         		ele = document.getElementById(index);
         		ele.style.background = '#FFFE82';
         	}


         
         function eliminarProducto(indice)
         	{
         		
         		if (estado != "cerrado") 
				{
					document.getElementById('productoSeleccionado').value = indice;
         			document.getElementById('accion').value = "eliminarProducto";
         			document.presupuestoForm.submit();
				}
				else
				{
					alert("No se puede eliminar productos, presupuesto esta cerrado");
				}
         		
         	}
         function abrirGraduaciones()
         	{
         		if(document.getElementById('cliente').value == "")
         		{
         			alert("Debe seleccionar un Cliente");
         		}
         		else
         		{
         			window.open("<%=request.getContextPath()%>/Graduaciones.do?method=cargaFormulario","popup","width=800, height=900,location=no,top=100,left=120");
         		}
         	}
         	
         function detalle(id)
         	{ 
         		Seccion = document.getElementById(id);
    			if (Seccion.style.display=="none"){Seccion.style.display="";}
    			else{Seccion.style.display="none";} 
			}

		function cargaClientePedido(cliente)
			{	
				document.getElementById("nombre_clienteDIV").innerHTML="";		
				document.getElementById("cliente").value = cliente[0];
				document.getElementById("nif").value = cliente[1];
            	document.getElementById("nombre").value = cliente[2] + " " + cliente[3];
            	document.getElementById("nombre_clienteDIV").innerHTML =  cliente[2] + " " + cliente[3];
            	document.getElementById("dvnif").value = cliente[4];
            	document.getElementById('accion').value = "agregarCliente";	
            	document.presupuestoForm.submit();
			} 
		
	
		function estado_venta(fluj, est, error)
			{
				estado = est;
				flujo = fluj;
				
				
				if(fluj == "formulario")
				{
					bloquearCampos();					
					
					if(est == "guardado")
					{
						alert("Presupuesto Almacenado");
					}
					if(est == "eliminado")
					{
						alert("Presupuesto Eliminado");
					}
					if("formulario" == fluj){
						//desbloquear el campo nif
						var inputs = document.all.tags("input");
						var i;
							for(i=0;i<inputs.length;i++)
							{
								if (inputs[i].type == "text") {
									if("nif" == inputs[i].id ){
										inputs[i].readOnly = false;
									}
									
								}	
							}
					}
				}
				if(fluj == "nuevo")
				{
					document.getElementById("traspaso").style.display = "none";
					//document.getElementById("traspaso").disabled = true;
					if(est == "error")
					{
						alert(error);
					}
				}
				if(fluj == "modificar")
				{
					if(est == "guardado")
					{
						alert("Presupuesto almacenado");
					}
					if(est == "eliminado")
					{
						if (error != "error") {
							alert(error);
						}
						
					}
					if(est == "cerrado")
					{
						bloquearCampos();
						if(error != "error")
						{
							alert(error);
						}
					}
					if(est == "error")
					{
						alert(error);
					}
				}
				var nombre_cliente = document.getElementById("nombre").value;
				document.getElementById("nombre_clienteDIV").innerHTML = nombre_cliente;
			}
			
		function bloquearCampos()
			{
				var inputs = document.all.tags("input");
				var i;
					for(i=0;i<inputs.length;i++)
					{
						if (inputs[i].type == "text") {
							inputs[i].readOnly = true;
						}	
					}
					
					var inputs = document.all.tags("select");
					for(i=0;i<inputs.length;i++)
					{
							inputs[i].disabled = true;
					}
					document.getElementById("traspaso").style.display = "none";
					//document.getElementById("traspaso").disabled = true;
					
			}
		function ingresa_Presupuesto()
			{
				if (flujo != "formulario") 
				{
					if (estado != "cerrado") 
					{
							document.getElementById('accion').value = "ingresa_presupuesto";	
	            			document.presupuestoForm.submit();
						
					}
					else
					{
						alert("No se puede modificar, presupuesto esta cerrado");
					}
				}
				else
				{
					alert("No hay ventas en proceso");
				}
				
			}
		
		
		
		function seleccionTratamientos(producto)
			{
				document.getElementById('accion').value = "ver_Suplementos";
				document.getElementById('productoSeleccionado').value = producto;	
            	document.presupuestoForm.submit();
			}
		
        function actualiza_cantidad(index, campo)
        	{
        		if (estado != "cerrado") 
				{
		        	document.getElementById('accion').value = "cantidad";
		        	document.getElementById('productoSeleccionado').value = index;
		        	document.getElementById('cantidad').value = campo.value;
		        	
		        	document.presupuestoForm.submit();
		        }
		        else
		        {
		        	alert("No se puede modificar, presupuesto esta cerrado");
		        }
        	}
        
		function actualiza_descripcion(index, objeto)
		{
			objeto = document.getElementById("descripcion_manual_" + index).value;
			if (objeto == "") {
				alert("Debe ingresar una descripcion del producto para continuar");
				document.presupuestoForm.descripcion_manual.focus();
			}
			else
			{
				document.getElementById('accion').value = "agrega_descripcion";
				document.getElementById('productoSeleccionado').value = index;
				document.getElementById('descripcion').value = objeto;
				document.presupuestoForm.submit();
			}
		}