var estado = "";
var flujo = "";       
  			
  			
        function descuento_fenix()
        {
        	document.getElementById('accion').value = "descuento_fenix";
            document.ventaPedidoForm.submit();
        }
        
        function validaEncargoSeguroGarantia(campo)
        {
        	/*SE COMENTA A PETICION DE PLBARRERA 20140122*/
        	if (document.getElementById('codigo_pedido').value == "" ){
				alert("Debe guardar encargo antes de aplicar Seguro de Garantía");
				document.getElementById('tipo_pedido').value = '0';
				document.getElementById('encargo_amigo').value = "";
				//document.getElementById('encargo_amigo').style.display = 'none';
			}
        	else if (campo.value == "") {
        		alert("Debe ingresar un encargo");
        		document.getElementById('encargo_amigo').focus();
			}
        	else
        	{
        		document.getElementById('accion').value= "valida_SG";
        		document.forms[0].submit();
        	}
        	//document.getElementById('encargo_amigo').style.display = 'none';
        	
        }
        
        function cambiaTipoEncargo(combo)
        {	
        	/*SE COMENTA A PETICION DE PLBARRERA 20140122*/
        	/*if (combo.value == "SG") {
        		document.getElementById('encargo_amigo').style.display = 'block';
        		document.getElementById('encargo_amigo').focus();
			}
        	else
        	{    		
        		document.getElementById('encargo_amigo').style.display = 'none';
        		document.getElementById('accion').value = "elimina_descuento_sg";
        		document.ventaPedidoForm.submit();
        	}*/
        	//document.getElementById('encargo_amigo').style.display = 'none';
    		//document.getElementById('accion').value = "elimina_descuento_sg";
    		document.ventaPedidoForm.submit();
        }
       	 function cargaProducto(producto)
         {       		 
       		 	//alert("paso ===> "+producto[0]+"<=>"+producto[1]+"<=>"+producto[2]+"<=>"+producto[3]);
            	document.getElementById('accion').value = "agregarProducto";
                document.getElementById("productoSeleccionado").value = producto[0];
            	document.getElementById("cantidad").value = producto[1];
				document.getElementById("ojo").value = producto[2];
            	document.getElementById("descripcion").value = producto[3];
                document.ventaPedidoForm.submit();
         }
            
         function cargaSuplementos(variable)
     	 {
         		if(variable == "con_suplementos")
         		{
         			document.getElementById('accion').value = "agregarSuplementos";
         			document.ventaPedidoForm.submit();
         		}
     	}
            
         function seleccionarProductoG(index, esfera, cilindro,diametro, fecha_grad, numero_grad, ojo)
     	 {
     		document.getElementById('esfera').value = esfera;
     		document.getElementById('cilindro').value = cilindro;
     		document.getElementById('diametro').value = diametro;
     		document.getElementById('fecha_grad').value = fecha_grad;
     		document.getElementById('numero_grad').value = numero_grad;
     		document.getElementById('ojo2').value = ojo;
     	    
     	    colordeTabla(document.getElementById('contenido'));	
     	
     		ele = document.getElementById(index);
     		ele.style.background = '#FFFE82';
     	 }
     	 function seleccionarProducto(index, esfera, cilindro,diametro)
     	 {
     		document.getElementById('esfera').value = "";
     		document.getElementById('cilindro').value = "";
     		document.getElementById('diametro').value = "";
     		document.getElementById('fecha_grad').value = "";
     		document.getElementById('numero_grad').value = "";
     		document.getElementById('ojo2').value = "";
     		
     		colordeTabla(document.getElementById('contenido'));
  
         		ele = document.getElementById(index);
         		ele.style.background = '#FFFE82';
     	 }
         	
         function verificaFechaVenta(dtpicker)
         {
        	 if (estado == "cerrado") 
				{
					alert("La venta esta cerrada, no es posible eliminar productos");
				}	
				else
				{
					if (flujo != "formulario") 
					{
						if(document.getElementById("bloquea").value == "bloquea")
						{
							alert("Encargo bloqueado, no es posible modificar la fecha");
							dtpicker.value =  document.getElementById("fecha_encargo").value;
			         	}
						else
						{
							document.getElementById("productoSeleccionado").value = dtpicker.value
							dtpicker.value = document.getElementById("fecha_pedido").value;
							document.getElementById('accion').value = "modificaFecha";
			         		document.ventaPedidoForm.submit();
						}
			        }
      		}
        	 
         }
         	
         function eliminarProducto(indice)
         {
        	    //COMPRUEBO SI HAY VENTA DE SEGURO
    		    $j("#contenido tr").each(function(a){
	    	      	   var familia  = $j(this).find("td > a").attr("data-grupfam");
	    	      	   var articulo = $j(this).find("td > a").attr("data-barra");
	    	           if(familia == "INS"){
	    					$j("#venta_seguro").val(articulo);
	    	       	   }
    	        });
    		    
    		    
         		if (estado == "cerrado") 
				{
					alert("La venta esta cerrada, no es posible eliminar productos");
				}	
				else
				{
					if (flujo == "modificar") 
					{
						if(document.getElementById("bloquea").value != "bloquea")
						{
			         		document.getElementById('productoSeleccionado').value = indice;
			         		document.getElementById('accion').value = "eliminarProducto";			         					         					         
			         		document.ventaPedidoForm.submit();
			         		
			         		//borro convenio
			         				         		
				         	elimina_convenio_sel();
			         		
			         	}
			         	else
			         	{
			         		alert("Encargo bloqueado, no es posible eliminar productos");
			         	}
			         
			         }
			         else
			         {
			        	 	
			         		document.getElementById('productoSeleccionado').value = indice;
			         		document.getElementById('accion').value = "eliminarProducto";			         					         				         					 
			         		document.ventaPedidoForm.submit();
			         		
			         		//borro convenio
			         		
			         		elimina_convenio_sel();
			         		
			         }
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
			{	document.getElementById("nombre_clienteDIV").innerHTML="";		
				document.getElementById("cliente").value = cliente[0];
				document.getElementById("nif").value = cliente[1];
            	document.getElementById("nombre").value = cliente[2] + " " + cliente[3];            	
            	document.getElementById("nombre_clienteDIV").innerHTML =  cliente[2] + " " + cliente[3];
            	document.getElementById("dvnif").value = cliente[4];
            	document.getElementById('accion').value = "agregarCliente";	
            	document.ventaPedidoForm.submit();
			} 	
		
		function actualiza_descripcion(index, objeto)
			{
				objeto = document.getElementById("descripcion_manual_" + index).value;
				if (objeto == "") {
					alert("Debe ingresar una descripcion del producto para continuar");
					document.ventaPedidoForm.descripcion_manual.focus();
				}
				else
				{
					document.getElementById('accion').value = "agrega_descripcion";
					document.getElementById('productoSeleccionado').value = index;
					document.getElementById('descripcion').value = objeto;
					document.ventaPedidoForm.submit();
				}
			}
		
		
		function seleccionTratamientos(producto)
		{
				document.getElementById('accion').value = "ver_Suplementos";
				document.getElementById('productoSeleccionado').value = producto;	
            	document.ventaPedidoForm.submit();
		}
		
		function actualiza_grupo(index)
		{
			if (estado == "cerrado") 
			{
				alert("La venta esta cerrada, no es posible modificar productos");
			}	
			else
			{
				if (flujo == "modificar") 
				{
					if(document.getElementById("bloquea").value != "bloquea")
					{
						document.getElementById('accion').value = "grupo";
			        	document.getElementById('productoSeleccionado').value = index;
			        	document.ventaPedidoForm.submit();
		         	}
		         	else
		         	{
		         		alert("Encargo bloqueado, no es posible modificar productos");
		         	}
		         
		         }
		         else
		         {
		        	 	document.getElementById('accion').value = "grupo";
			        	document.getElementById('productoSeleccionado').value = index;
			        	document.ventaPedidoForm.submit();
		         }
     		}
	        	
    	}
		
		function actualiza_cantidad(index, campo)
    	{
			
			campo = document.getElementById("cant_" + index).value;
			if (estado == "cerrado") 
			{
				alert("La venta esta cerrada, no es posible modificar productos");
			}	
			else
			{
				if (flujo == "modificar") 
				{
					if(document.getElementById("bloquea").value != "bloquea")
					{
						document.getElementById('accion').value = "cantidad";
			        	document.getElementById('productoSeleccionado').value = index;
			        	document.getElementById('cantidad_linea').value = campo;
			        	document.ventaPedidoForm.submit();
		         	}
		         	else
		         	{
		         		alert("Encargo bloqueado, no es posible modificar productos");
		         	}
		         
		         }
		         else
		         {
		        	 	document.getElementById('accion').value = "cantidad";
			        	document.getElementById('productoSeleccionado').value = index;
			        	document.getElementById('cantidad_linea').value = campo;
			        	document.ventaPedidoForm.submit();
		         }
     		}
	        	
    	}
		
        function seleccionaPromocion()
        {
	        	document.getElementById('accion').value = "aplica_descuento_promocion";
	    		document.ventaPedidoForm.submit();
        }
        	
        function valida_venta()
    	{
        		if (estado == "cerrado") {
					alert("Venta finalizada, no es posible generar cobros");
				}
				else
				{
	        		if(document.getElementById('nombre').value != "")
	        		{
		        				canti_prod = document.getElementById("cantidad_productos").value;
				           		if(canti_prod == 0)
				           		{
				            		alert("Debe ingresar articulos para generar cobros");
				            	}else
				            	{
				            		if (document.getElementById("codigo_pedido").value != "") {
				            			document.getElementById('accion').value = "valida_pedido";
			        					document.ventaPedidoForm.submit();
									}
				            		else
				            		{
				            			alert("Debe guardar la venta, antes de cobrar");
				            		}
			        			}
	        		}
	        		else
	        		{
	        			alert("Debe seleccionar un Cliente");
	        		}
	        	}
        	}
    	function ingresa_pedido()
    	{
        		var res = 0;
        		var valtienda = 0;
        		if (flujo != "formulario") 
				{
					if (flujo == "modificar") 
					{
						if(document.getElementById("bloquea").value != "bloquea")
						{
							if(document.getElementById('nombre').value != "")
			        		{
								if(document.getElementById('agente').value != "0")
			        			{											
							 			
										$j.ajax({
											  type: "POST",
											  url: 'VentaPedido.do?method=validaTipoPedido',
											  dataType: "text",
											  data:"codigo_suc="+$j("#codigo_suc").val()+"&tipo_pedido="+$j("#tipo_pedido").val(),
											  asycn:false,
											  success: function(data){
										  		switch(data){
										  			case "1":
										  				valtienda = 1;		
													break;
													default:
														valtienda = 0;
								  				
													break;
												}
										  												  												  		
										 		if(valtienda == 1){
										 			var cant = 0;
											 		var sumgrup = 0;
											 		$j('#contenido tr').each(function(i){
											 			cant += i;
											 			sumgrup += parseInt($j(this).find('#grupotab').val());								 			
											 		});

											 		if((cant == 0 && sumgrup == 0) || (cant == 3 && sumgrup == 3) ){
										 				document.getElementById('accion').value = "ingresa_pedido";
										 				document.ventaPedidoForm.submit();
											 		}
										 			else{
										 				alert('Con motivo de reproceso, sólo se puede ingresar un trio o un producto por encargo.');
										 			}
										 		}else{
										 			document.getElementById('accion').value = "ingresa_pedido";
									 				document.ventaPedidoForm.submit();
										 		}	
										    }
									 	});
										
								 									 		
			        			}
				        		else
				        		{
				        			alert("Debe seleccionar un agente");
				        		}
			        		}
			        		else
			        		{
			        			alert("Debe seleccionar un Cliente");
			        		}
						}
						else
						{
							alert("Encargo bloqueado, no es posible modificar la venta");
						}
					}
					else
					{
						if(document.getElementById('nombre').value != "")
		        		{
		        				if(document.getElementById('agente').value != "0")
			        			{
		        					if (document.getElementById('fecha').value != "") {
		        						
								 		
								 		if($j("#tipo_pedido").val()=="SEG"){
								 			$j.ajax({
												  type: "POST",
												  url: 'VentaPedido.do?method=validaVentaSeguro',
												  dataType: "text",
												  data:"encargo_seguro="+$j("#encargo_seguro").val(),
												  asycn:false,
												  success: function(data){
													  //console.log("javascript ==> "+data);
											  		switch(data){
											  			case "1":
											  				alert("El encargo a utilizar no esta asociado a garantia.");	
														break;
											  			case "2":
											  				alert("El encargo garantia ya fue utilizado, no es posible volver a ocuparlo.");			
														break;
											  			case "3":
											  				document.getElementById('accion').value = "ingresa_pedido";
											 				document.ventaPedidoForm.submit();		
														break;
														default:
															alert("Problema al conectarse a la Base de Datos.");
														break;
											  		}												  												  												  		
											 			//document.getElementById('accion').value = "ingresa_pedido";
										 				//document.ventaPedidoForm.submit();
											 			
											    }
										 	});
								 			
								 		}else{
			        						$j.ajax({
												  type: "POST",
												  url: 'VentaPedido.do?method=validaTipoPedido',
												  dataType: "text",
												  data:"codigo_suc="+$j("#codigo_suc").val()+"&tipo_pedido="+$j("#tipo_pedido").val(),
												  asycn:false,
												  success: function(data){
											  		switch(data){
											  			case "1":
											  				valtienda = 1;		
														break;
														default:
															valtienda = 0;								  				
														break;
													}
											  												  												  		
											 		if(valtienda == 1){
											 			var cant = 0;
												 		var sumgrup = 0;
												 		$j('#contenido tr').each(function(i){
												 			cant += i;
												 			sumgrup += parseInt($j(this).find('#grupotab').val());								 			
												 		});
	
												 		if((cant == 0 && sumgrup == 0) || (cant == 3 && sumgrup == 3) ){
											 				document.getElementById('accion').value = "ingresa_pedido";
											 				document.ventaPedidoForm.submit();
												 		}
											 			else{
											 				alert('Con motivo de reproceso, sólo se puede ingresar un trio o un producto por encargo.');
											 			}
											 		}else{
											 			document.getElementById('accion').value = "ingresa_pedido";
										 				document.ventaPedidoForm.submit();
											 		}	
											    }
										 	});
								 		}
									}
		        					else
		        					{
		        						alert("Debe Ingresar una fecha");
		        					}
				        		}
				        		else
				        		{
				        			alert("Debe seleccionar un agente");
				        		}
		        		}
		        		else
		        		{
		        			alert("Debe seleccionar un Cliente");
		        		}
					}
				}
				else
				{
					alert("No hay ventas en proceso");
				}
        		
        	}
    	function vuelve_Pago(accion)
        {
         	document.getElementById('accion').value = accion;
         	document.ventaPedidoForm.submit();
        }	
        	
			
		function cargaPedido(pedido)
		{	
				document.getElementById("cdg").value = pedido[4];
				document.getElementById('accion').value = "cargaPedidoSeleccion";
				document.ventaPedidoForm.submit();
		} 	
	
		function estilo(){
			
			var eliminarPedid = document.getElementById("eliminarPed").value;
	
			var style = document.getElementById("ocultar").value;

			var bloqueaPed = document.getElementById("bloquea").value;
			var pedidoEntrega = document.getElementById("msnPedidoEntrega").value;
			
						
			if("ocultar"==style){
			
				detalle('detalle_graduacion');
				document.getElementById("ocultar").value="";
			}
			if("bloquea"==bloqueaPed){
			
				bloquearCampos();
				
			}
			if("libre"==bloqueaPed){
				estado = "";
				detalle('eliminarPedid');
			}
			if("NOK"==eliminarPedid){
				alert("Debe eliminar formas de pago para eliminar pedido");
				document.getElementById("eliminarPedid").value ="";
			}
			if("NOKSP"==eliminarPedid){
				alert("Error al eliminar pedido");
				document.getElementById("eliminarPedid").value ="";
			}
			if(""!=pedidoEntrega){
				alert(pedidoEntrega);
				document.getElementById("msnPedidoEntrega").value ="";
			}
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
					
                             var selects = document.all.tags("select");
                             for(i=0;i<selects.length;i++)
                             {
                                         selects[i].disabled = true;
                             }
                  }
         function verificaNumero(campo){
         	if (campo.value == "") {
				campo.value = "0";
			}
         }
         
         function eliminarPedido(){
        	 
        	  //LIBERACION AUTOMATICA GARANTIAS
		  var sumdes = 0;
		  var sumimpor = 0;
		  var liberado= 0;
		  var cprod  = 0;
		  var totalencargo = parseInt($j("#total").val());
		  var codigoped = $j.trim($j("#codigo_pedido").val());
		  
		  $j("#contenido tr").each(function(a){
		   sumdes    += parseFloat($j(this).find("td > a").attr("data-des"));
		   liberado  += parseInt($j(this).find("td > a").attr("data-estado"));
		   sumimpor  += parseInt($j(this).find("td > a").attr("data-importe"));
		   //sumdes++; liberado++; sumimpor++; 
		     	   cprod++;
		     });
		  //console.log("TOTAL=>"+totalencargo+" SUMDES =>"+sumdes+" liberado=>"+liberado+" sumimpor=>"+sumimpor+" cprod =>"+cprod+" codigo pedido =>"+$j("#codigo_pedido").val());
		   if(totalencargo == 0 && sumdes == (100 * cprod) && sumimpor == 0 && cprod >= 3 ){
        	 
			   alert("No es posible eliminar el encargo, ya se encuentra Liberado.");
	         
		   }else{
				if (confirm("ALERTA!! va a proceder a eliminar este registro, si desea eliminarlo de click en ACEPTAR\n de lo contrario de click en CANCELAR."))
				{
	         		document.getElementById('accion').value = "eliminarPedidoSeleccion";
					document.ventaPedidoForm.submit();
				}
		   }
         }
         
		 function pedidoEntrega()
		 {	
				
						//if(document.getElementById("bloquea").value != "bloquea")
						//{
					document.getElementById('accion').value = "pedidoEntrega";
					document.ventaPedidoForm.submit();
					//	}
						//else
						//{
					//		alert("Encargo bloqueado, no es posible realizar el traspaso")
					//	}
		  }
		 
		  function existeTrio()
	      {	
			  var cont=0;
	          var inputs = document.all.tags("input");
	          var i;
				for(i=0;i<inputs.length;i++)
				{
					if (inputs[i].type == "text") {
						if(inputs[i].name == "grupo"){
							if(inputs[i].value > 0){
								cont++;
								if(cont >=3){
									return true;
								}
							}		
						}
					}	
				}
				return false;
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
			
			function devuelve_descuento_sg(valores)
			{
				var acceso = valores[0];
				var descuento_autorizado = valores[1];
				var usuario = valores[2];
				
				if (acceso == "true") {
    				document.getElementById('cantidad').value = descuento_autorizado;
    				document.getElementById('accion').value = "descuento_SG";
    				document.getElementById("descuento_autoriza").value = usuario;
    	        	document.ventaPedidoForm.submit();
				}
				else
				{
					document.getElementById('tipo_pedido').value = '0';
					document.getElementById('encargo_amigo').value = "";
					document.getElementById('encargo_amigo').style.display = 'none';
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
	    				alert("El descuento m�ximo autorizado es de " + descuento);
	    				document.ventaPedidoForm.submit();
	    			}
	    			else
	    			{
	    				document.getElementById('productoSeleccionado').value = indice;
	    				document.getElementById('cantidad_descuento').value = descuento.replace(',','.');;
	    				document.getElementById('accion').value = "descuento_linea";
	    				document.getElementById("descuento_autoriza").value = usuario;
	    	        	document.ventaPedidoForm.submit();
	    			}
	    		}
	    		else
	    		{
	    			alert("Usted no esta autorizado, para realizar este tipo de descuento");;
	    			document.ventaPedidoForm.submit();
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
	    				alert("El descuento m�ximo autorizado es de " + descuento);
	    				document.ventaPedidoForm.submit();
	    			}
	    			else
	    			{
	    				document.getElementById('cantidad_descuento').value = descuento.replace(',','.');;
	    				document.getElementById('accion').value = "descuento_total";
	    				document.getElementById("descuento_autoriza").value = usuario;
	    	        	document.ventaPedidoForm.submit();
	    			}
	    		}
	    		else
	    		{
	    			alert("Usted no esta autorizado, para realizar este tipo de descuento");;
	    			document.ventaPedidoForm.submit();
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
	    				alert("El descuento m�ximo autorizado es de " + descuento_autorizado);
	    				document.ventaPedidoForm.submit();
	    			}
	    			else
	    			{
	    				document.getElementById('cantidad_linea').value = descuento;
	    				document.getElementById('accion').value = "descuento_total_monto";
	    				document.getElementById("descuento_autoriza").value = usuario;
	    	        	document.ventaPedidoForm.submit();
	    			}
	    		}
	    		else
	    		{
	    			alert("Usted no esta autorizado, para realizar este tipo de descuento");
	    			document.ventaPedidoForm.submit();
	    		}
			}
			function eliminarProductoMultioferta(indice, indexMulti)
         	{
         		if (estado == "cerrado") 
				{
					alert("La venta esta cerrada, no es posible eliminar productos");
				}	
				else
				{
					if (flujo == "modificar") 
					{
						if(document.getElementById("bloquea").value != "bloquea")
						{
			         		document.getElementById('productoSeleccionado').value = indice;
			         		document.getElementById('accion').value = "eliminarProductoMulti";
			         		document.ventaPedidoForm.submit();
			         	}
			         	else
			         	{
			         		alert("Encargo bloqueado, no es posible eliminar productos");
			         	}
			         
			         }
			         else
			         {
			         		document.getElementById('productoSeleccionado').value = indice;
			         		document.getElementById('accion').value = "eliminarProductoMulti";
			         		document.ventaPedidoForm.submit();
			         }
         		}
         	}
			//LMARIN 20150531 BOLETA ELECTRONICA
			function estado_boleta(boleta){
			
				if($j.cookie("estado_boleta") != "generada"){
					
						var tmp = boleta.split("_");
						var tipoimpresion = $j("#tipoimp").val() == "1" ? "Carta": "Termica";
						var rut = tmp[3];
						var nboleta = tmp[1]+".pdf";
						
						//var urlbol = "http://srvgmosignaturepos/PRD/"+tipoimpresion+"/39 "+rut+" "+nboleta;
						var urlbol = "http://10.216.4.16/39 "+rut+" "+nboleta;
						
						if(tmp[0] == "0" || tmp[2] =="true"){
							
							alert("Error: No se pudo generar la boleta, Int\u00E9ntelo nuevamente.");
							
						}else if(tmp[0] == "1" && tmp[2] =="false"){
							
							$j(".pantalla2,#load_gif").css("display","block");
							alert("Generando boleta electr\u00F3nica, espere un momento por favor....");
							setTimeout(function(){  
								window.open(urlbol,"_blank"); $j(".pantalla2,#load_gif").css("display","NONE");
								window.focus();
							}, 7000);						
							$j.cookie("estado_boleta","generada");
							
						}else if(tmp[0] == "2" && tmp[2] =="false"){
							
							alert("!ATENCIÓN! AGREGAR MAS FOLIOS, SE ESTAN AGOTANDO");
							$j(".pantalla2,#load_gif").css("display","block");
							alert("Generando boleta , espere un momento por favor....");
							setTimeout(function(){  
								window.open(urlbol); $j(".pantalla2,#load_gif").css("display","NONE");
							}, 7000);						
							$j.cookie("estado_boleta","generada");
							
						}
				}
			}