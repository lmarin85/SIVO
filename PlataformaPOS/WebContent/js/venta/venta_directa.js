

	document.oncontextmenu=inhabilitar;
		function inhabilitar(){return false;}
	
		
		var estado;

		function carga_url_padre(url)
	        {
	 			parent.carga_url_padre(url);
	        }
			
       	 function cargaProducto(producto)
            {
            	document.getElementById("productoSeleccionado").value = producto[0];
            	document.getElementById("cantidad").value = producto[1];
            	document.getElementById('accion').value = "agregarProducto";
            	document.ventaDirectaForm.submit();
            }
        
       	function ingresa_venta()
         	{
         		if (estado == "fin") {
					alert("La venta se encuentra bloqueada, no es posible actualizar");
				}	
				else
				{
					if(document.getElementById('agente').value != "0")
					{
						if(document.getElementById('cantidad_productos').value != "0")
							{
								document.getElementById('accion').value = "ingresa_venta";
			         			document.ventaDirectaForm.submit();
							}
						else
							{
								alert("Debe ingresar productos, para poder guardar");
							}
					}
					else
					{
						alert("Debe seleccionar un agente");
					}
         		} 
         	}  
            
         function vuelve_Pago(accion)
	         {
	         	document.getElementById('accion').value = accion;
	         	document.getElementById('cajero').disabled=false;
	         	document.ventaDirectaForm.submit();
	         }	
         
         function eliminarProducto(codigo)
         	{
         		if (estado == "fin") {
					alert("Venta finalizada, no es posible eliminar productos");
				}	
				else
				{
	         		document.getElementById('productoSeleccionado').value = codigo;
	         		document.getElementById('accion').value = "eliminarProducto";
	         		document.ventaDirectaForm.submit();
	         		location.href();
	         	}
         	}

			 
		 function actualiza_cantidad(index, campo,event)
        	{
        		
        			document.getElementById('cantidad').value = campo.value;
        				if(isInteger(campo.value)){
           					document.getElementById('accion').value = "cantidad";
	        				document.getElementById('productoSeleccionado').value = index;
	        				document.getElementById('cantidad').value = campo.value;
	        				document.ventaDirectaForm.submit();
        				}else{
        				//	document.getElementById('cantidad').value ="";
        				//	document.getElementById('cantProd').value ="";
        				}      			
        	}
		
		
		function isInteger(s) {
  			return (s.toString().search(/^-?[0-9]+$/) == 0);
		}
		
	function validar(e) { // 1
		tecla = (document.all) ? e.keyCode : e.which; // 2
		if (tecla == 8)
			return true; // 3
		patron = /^(?:\+|-)?\d+$/; // 4
		te = String.fromCharCode(tecla); // 5
		return patron.test(te); // 6
	}
	
	function eliminarProductoMultiOferta(codigo, indexMulti)
 	{	
				
 		if (estado == "fin") {
			alert("Venta finalizada, no es posible eliminar productos");
		}	
		else
		{
			document.getElementById("index_multi_eliminar").value = indexMulti;
     		document.getElementById('productoSeleccionado').value = codigo;
     		document.getElementById('accion').value = "eliminarProductoMultiOferta";
     		document.ventaDirectaForm.submit();
     	}
 	}
	
	