	function detalle(id)
         { 
        	Seccion = document.getElementById(id);
    		if (Seccion.style.display=="none"){Seccion.style.display="";}
    		else{Seccion.style.display="none";} 
		}
	function selecciona(codigo)
		{
			document.getElementById("accion").value='detalles';
			document.forms[0].submit();			
		}
	function cargaPedido(pedido)
	{				
		document.getElementById("cdg_busqueda").value = pedido[0];            	
    	document.getElementById('accion').value = "traeEntregaPedido";
    	document.forms[0].submit();

	}	
function seleccionarProducto(esfera, cilindro,diametro)
 	{
 		document.getElementById('esfera').value = esfera;
 		document.getElementById('cilindro').value = cilindro;
 		document.getElementById('diametro').value = diametro;
 	}	