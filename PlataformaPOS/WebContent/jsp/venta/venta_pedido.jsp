
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script language="javascript" src="js/utils.js"></script>
		
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>		
		<script type="text/javascript" src="js/prototype.js"></script>	
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>			
		<script type="text/javascript" src="js/jquery.datepick.js""></script>			
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>				
		<script type="text/javascript" src="js/venta/venta_pedido.js"></script>
		<style>
		<!--
		.pantalla{
			display: block;position: absolute;top: 15;left: 10;z-index: 100;width: 100%;height: 108%;background: url(images/maskBG.png);
			opacity: .1;
			filter: alpha(opacity=10);
		}
		.pantalla2{
			display: block;position: absolute;top: 15;left: 10;z-index: 100;width: 100%;height: 108%;background: url(images/maskBG.png);
			opacity: 0.4;
			filter: alpha(opacity=50);
		}
		#load_gif{
			display : block; position : absolute; background-image : url('css/spinners/preloader.gif'); opacity : 0.5; filter: alpha(opacity=90); background-repeat : no-repeat;background-position : center;
			left : 0;
			bottom : 0;
			right : 0;
			top : 20;
		}
		.pantalla2,#load_gif{
			display:none;
		}
		.bloqueo {
			
		}
		-->
		</style>
		
		
<script type="text/javascript">

		var usuario_autorizador = "";
		var descuento = "";
		var descuento_porc = "";
		var indice = "";
		var $j = jQuery.noConflict();
		var val_rut = /^[0-9]{7,8}$/; 
		
			$j(function() {
			$j('#popupDatepicker2').datepick();
			});
        
  			$j(function() {
			$j('#popupDatepicker').datepick();
			});

		function cerrar_venta()
        	{
        	
        			var estaGrabado = document.getElementById('estaGrabado').value;
        			
        			if(estaGrabado == 0){
        				
        				boton = confirm("¿Desea salir de la página actual sin guardar?");
        				
        				if(boton){
        					parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
        				}
        				
        			}else{
	        			var boton = confirm("¿esta seguro de cerrar esta venta?");
		        		if (boton)
		        		{
		        			parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
		        		}
		        		else
		        		{
		        			self.close();
		        		}
        			}   
        			//lIMPIO LAS COOKIES  
					$j.removeCookie('m_modal');  		
        	}
        	
       function busqueda_producto()
       {	
   	  
				if(estado == "cerrado")
				{
					alert("La venta esta cerrada, no es posible agregar productos");
				}
				else
				{
					if (flujo != "formulario") 
					{
						if (flujo == "modificar") 
						{
							if(document.getElementById("bloquea").value != "bloquea")
							{
								showPopWin('<%=request.getContextPath()%>/BusquedaProductos.do?method=cargaBusquedaProductos&formulario=PEDIDO', 710, 380, cargaProducto, false);
							}
							else
							{
								alert("Encargo bloqueado, no es posible agregar productos");
							}
						}
						else
						{
									//LMARIN 20140328
									if(!$j("#agregar_prod").hasClass("inactivo")){
											if(document.forms[0].cliente.value != "" && document.forms[0].cliente.value != "0")
							            	{
							            		showPopWin('<%=request.getContextPath()%>/BusquedaProductos.do?method=cargaBusquedaProductos&formulario=PEDIDO', 710, 380, cargaProducto, false);
							            	}
							            	else
							            	{
							            		alert("Debe seleccionar un cliente, para agregar articulos");
							            	}
							        }else{
							        	alert("Debes tener agregados todos los productos del encargo para poder asociar un convenio o borrar el convenio, agregar nuevos productos y volver asociar el convenio.");
							        }
							/*$j.ajax({
									  type: "POST",
									  url: 'VentaPedido.do?method=tipoConvenio',
									  dataType: "text",
									  data:"convenio="+$j("#convenio").val(),
									  asycn:false,
									  success: function(data){
									  		
																		  												  		
								 	  }
							 });*/
						}
					}
					else
					{
						alert("No hay ventas en curso, no es posible agregar productos");
					}
				}
    	   
       } 
       function busquedaAvanzada()
       {
      		var flujo_form = document.ventaPedidoForm.flujo.value;
      		showPopWin("<%=request.getContextPath()%>/BusquedaPedidos.do?method=carga_formulario&flujo="+flujo_form , 714, 425,cargaPedido, false);
       }
       function busqueda_cliente()
			{			
				if (estado == "cerrado") 
				{
					alert("La venta esta cerrada, no es posible cambiar el cliente");
				}	
				else
				{
					if (flujo == "modificar") 
					{
						if(document.getElementById("bloquea").value != "bloquea")
						{
							showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&pagina=pedido", 714, 425,cargaClientePedido, false);
			   				//window.open("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes","popup","width=800, height=400,location=no,top=100,left=120");
						}
						else
						{
							alert("Encargo bloqueado, no es posible cambiar el cliente")
						}
					}
					else
					{
						showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&pagina=pedido", 714, 425,cargaClientePedido, false);
			   			//window.open("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes","popup","width=800, height=400,location=no,top=100,left=120");
	
					}
					
				}				
			}
			
	function elimina_convenio_sel()
	 	{
	 		
	 		document.getElementById('cliente_dto').value ="";
	 		document.getElementById('accion').value = "elimina_convenio";
	 		$j("#encargo_padre").val("");
	 		if($j("#convenio").val() == "50464")
	 		{
	 			$j.cookie("elimina_cliente_dto","777");
	 		}
			document.ventaPedidoForm.submit();
			//$j.cookie("elimina_cliente_dto","777");
	 	}
			
	function busqueda_convenio_avanzada()
		{	
		
				if(estado == "cerrado")
				{
					alert("La venta esta cerrada, no es posible modificar convenios");
				}
				else
				{
					if (flujo != "formulario") 
					{
						if (flujo == "modificar") 
						{
							if(document.getElementById("bloquea").value != "bloquea")
							{
								showPopWin('<%=request.getContextPath()%>/BusquedaConvenios.do?method=cargaBusquedaConvenios', 710, 380, devuelve_descuento_ln, false);
							}
							else
							{
								alert("Encargo bloqueado, no es posible modificar convenios");
							}
						}
						else
						{
							if(document.forms[0].cliente.value != "" && document.forms[0].cliente.value != "0")
			            	{
			            		showPopWin('<%=request.getContextPath()%>/BusquedaConvenios.do?method=cargaBusquedaConvenios', 710, 380, devuelve_descuento_ln, false);
			            	}
			            	else
			            	{
			            		alert("Debe seleccionar un cliente, para agregar convenios");
			            	}
						}
					}
					else
					{
						alert("No hay ventas en curso, no es posible ingresar convenios");
					}
				}
		}	
		
	function verificaConfirmacion(valores)
		{
			document.getElementById('accion').value = "confirma_producto";
			document.getElementById('productoSeleccionado').value = valores[0];
			document.getElementById('codigo_confirmacion').value = valores[1];
			
			
			document.ventaPedidoForm.submit();	
		}	
	function estado_venta(est, error, fluj)
			{
				flujo = fluj;
				estado = est;
				
				if(fluj == "formulario")
				{
					bloquearCampos();
					if(est == "guardado")
					{
						alert("Encargo Almacenado");
					}
					if(est == "eliminado")
					{
						alert("Encargo Eliminado");
					}				
				}
				else
				{
					if(est == "guardado")
					{
						alert("Encargo Almacenado");
					}
					if (est == "producto_precio_especial") 
					{
						boton = confirm("El producto tiene precio especial, ¿desea aplicarlo?");
						if (boton)
						  {
						  	document.getElementById('accion').value = "aplicaPrecioEspecial";
	            			document.ventaPedidoForm.submit();
						  }
					}
					if(est == "producto_con_suplemento_obligatorio")
					{
						showPopWin('<%=request.getContextPath()%>/Suplementos.do?method=carga', 430, 300, cargaSuplementos, false);
					}
					if (est == "sg_autorizacion") {
						var tipo = document.ventaPedidoForm.tipo_pedido.value;
						var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo="+ tipo;	
						showPopWin(url, 690, 130, devuelve_descuento_sg, false);
					}
					if(est == "producto_arcli")
					{
						var indice = document.getElementById('productoSeleccionado').value;
						showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=carga_adicionales_arcli&indice='+indice, 450, 200, cargaAdicionalesArcli, false);
					}
					if(est == "AGREGA_DETALLE_PRODUCTO_ARCLI_PRESUPUESTO")
					{
						var indice = document.getElementById('productoSeleccionado').value;
						showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=carga_adicionales_arcli&indice='+indice, 450, 200, cargaAdicionalesArcliPresupuesto, false);
					}
					
					if (est == "producto_confirmacion") {
						showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=carga_confirmacion', 700, 150, verificaConfirmacion, false);
					}
					if (est == "venta_no_factible") {
						alert("Esta venta no es técnicamente factible: " + error);
					}
					if (est == "genera_cobros") 
					{
						genera_venta();
					}
					if (est=='carga_multioferta') 
					{	
						var codigo = document.getElementById('codigo_mult').value;
						var index = document.getElementById('index_multi').value;
						var cliente = document.getElementById("cliente").value;		
			 			var fecha_graduacion = document.getElementById("fecha_graduacion").value;
			 			var orden_graduacion = document.getElementById("orden_graduacion").value;
			 			showPopWin("<%=request.getContextPath()%>/BusquedaProductosMultiOfertas.do?method=cargaBusquedaProductosMultiOfertas&formulario=PEDIDO&codigoMultioferta="+codigo+"&cliente="+cliente+"&fecha_graduacion="+fecha_graduacion+"&numero_graduacion="+orden_graduacion+"&index_multi="+index+"", 714, 425, null, false);
					}
					if (est == "venta") 
					{
						if(error != "error")
						{	
							alert(error);
						}
					}
					
				}
				
				var nombre_cliente = document.getElementById("nombre").value;
				document.getElementById("nombre_clienteDIV").innerHTML = nombre_cliente;
				
			}
		function seleccionarAdicionalesARCLI(indice)
			{
				showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=carga_adicionales_arcli&indice='+indice, 450, 200, cargaAdicionalesArcli, false);
			}
		function cargaAdicionalesArcli(valores)
			{
				document.getElementById("armazon").value = valores[0];
				document.getElementById("puente").value = valores[1];
				document.getElementById("diagonal").value = valores[2];
				document.getElementById("horizontal").value = valores[3];
				document.getElementById("vertical").value = valores[4];
				document.getElementById('productoSeleccionado').value = valores[5];
				document.getElementById("accion").value = "agrega_adicionales_arcli";
				document.forms[0].submit();
			}
		function cargaAdicionalesArcliPresupuesto(valores)
			{
				document.getElementById("armazon").value = valores[0];
				document.getElementById("puente").value = valores[1];
				document.getElementById("diagonal").value = valores[2];
				document.getElementById("horizontal").value = valores[3];
				document.getElementById("vertical").value = valores[4];
				document.getElementById('productoSeleccionado').value = valores[5];
				document.getElementById("accion").value = "agrega_adicionales_arcli_presupuesto";
				document.forms[0].submit();
			}
			
		function genera_venta()
            {
            	if (estado == "cerrado") {
					alert("Venta finalizada, no es posible generar cobro");
				}	
				else
				{
	            	showPopWin("<%=request.getContextPath()%>/VentaPedido.do?method=generaVentaPedido", 710, 285, vuelve_Pago, false);
	            }
			}
			
	function cargaPedidoCliente()
			{
				var cliente =document.getElementById('cliente').value;
				
				if(0==cliente || ""==cliente){
					alert("Debe ingresar un cliente valido");
				}else{
					var url = "<%=request.getContextPath()%>/VentaPedido.do?method=cargaPedidoAnterior&cliente="+cliente;		
					showPopWin(url, 745, 300,cargaPedido, false);
				}
					
			}
			
		function busqueda_multioferta(codigo, indexMulti)
			 {	
			 	var cliente = document.getElementById("cliente").value;		
			 	var fecha_graduacion = document.getElementById("fecha_graduacion").value;
			 	var orden_graduacion = document.getElementById("orden_graduacion").value;
				var bloquea = document.getElementById("bloquea").value;
				
				var codigo_pedido = document.getElementById('codigo_pedido').value;
				var codigo_suc = document.getElementById('codigo_suc').value;				
				var cdg="";
				if(("" != codigo_pedido) && ("" != cliente)){
					 var cdg = codigo_suc +"/"+codigo_pedido;
				}else{
					cdg="";
				}			
			 	showPopWin("<%=request.getContextPath()%>/BusquedaProductosMultiOfertas.do?method=cargaBusquedaProductosMultiOfertas&formulario=PEDIDO&codigoMultioferta="+codigo+"&cliente="+cliente+"&fecha_graduacion="+fecha_graduacion+"&numero_graduacion="+orden_graduacion+"&index_multi="+indexMulti+"&bloquea="+bloquea+"&estadoEncargo="+estado+"&cdg="+cdg, 714, 425, null, false);
			 }
		function nuevo_Pedido()
        {
         		$j.removeCookie('enc_padre');
				$j.removeCookie('m_modal');
				$j.cookie('mofercom',"");
				$j.cookie('estado_boleta',"");
				//ELIMINO DATOS CLIENTE
				$j("#cliente_dto").val() =="";
				$j.cookie("elimina_cliente_dto",0);	
			
				
				
				//Elimino cookie nuevo flujo CRB 20151027
				$j.cookie('imp_guia','');	
				$j.cookie('preg','');
				$j.cookie("cupon","");	
         		document.ventaPedidoForm.action = '<%=request.getContextPath()%>/VentaPedido.do?method=nuevoFormulario';
        		document.ventaPedidoForm.submit();
         }
         function generaFichaTecnica(){
         
         		var codigo_pedido = document.getElementById('codigo_pedido').value;
				var codigo_suc = document.getElementById('codigo_suc').value;
				var cliente = document.getElementById('cliente').value;
				var saldo = document.getElementById("totalPendiante").value;
				
				var parametro="";
				new Ajax.Request('<html:rewrite page="/VentaPedido.do?method=validaTrioMultioferta"/>', {
				      parameters: {nif: parametro},      
				      onComplete: function(transport, json) {
				      	 
				      	 if("" != json.tieneTrio){				      	 		      	 	
        					var tieneTrioMulti = json.tieneTrio;
						    if("ok"==tieneTrioMulti){
						    	haymulti=true;
						    	if(("" != codigo_pedido) && ("" != cliente)){
								 var cdg = codigo_suc +"/"+codigo_pedido;
								
								 var respuesta = existeTrio();
												             		 				 
								 if(respuesta){				 
									 var url = "/CreaFichaTallerServlet?cdg="+cdg+"&cliente="+cliente+"&saldo="+saldo;				 
										window.open("<%=request.getContextPath()%>"+url);
				       			 }else{
				       			 	if(haymulti){
				       			 		var url = "/CreaFichaTallerServlet?cdg="+cdg+"&cliente="+cliente+"&saldo="+saldo;				 
										window.open("<%=request.getContextPath()%>"+url);
				       			 	}else{
				       			 		alert("Debe existir al menos un trio guardado o lente contacto graduable");
				       			 	}
				       			 }
								}else{
									alert("Debe guardar la venta");
								}		
						    	
						    	
						    }else{
						    	haymulti = false;
						    	
						    	if(("" != codigo_pedido) && ("" != cliente)){
								 var cdg = codigo_suc +"/"+codigo_pedido;
								 //cdg = "19/0082635";
								 //cliente = "410021795";
								 var respuesta = existeTrio();
												             		 				 
								 if(respuesta){				 
									 var url = "/CreaFichaTallerServlet?cdg="+cdg+"&cliente="+cliente+"&saldo="+saldo;				 
										window.open("<%=request.getContextPath()%>"+url);
				       			 }else{
				       			 	if(haymulti){
				       			 		var url = "/CreaFichaTallerServlet?cdg="+cdg+"&cliente="+cliente+"&saldo="+saldo;				 
										window.open("<%=request.getContextPath()%>"+url);
				       			 	}else{
				       			 		alert("Debe existir al menos un trio guardado o lente contacto graduable");
				       			 	}
				       			 }
								}else{
									alert("Debe guardar la venta");
								}		
						    	
						    	
						    }  					         	
				      	 }else{				      	 	
				      	 	return false;			      	 	
				      	 }				         		         
				      }
				  });
				
				
						
			}
				
				<%-- var codigo_pedido = document.getElementById('codigo_pedido').value;
				var codigo_suc = document.getElementById('codigo_suc').value;
				var cliente = document.getElementById('cliente').value;
				var saldo = document.getElementById("totalPendiante").value;
				
				if(("" != codigo_pedido) && ("" != cliente)){
					 var cdg = codigo_suc +"/"+codigo_pedido;
					 //cdg = "19/0082635";
					 //cliente = "410021795";
					 var respuesta = existeTrio();
					 if(respuesta){				 
						 var url = "/CreaFichaTallerServlet?cdg="+cdg+"&cliente="+cliente+"&saldo="+saldo;				 
		       			 window.open("<%=request.getContextPath()%>"+url);
	       			 }else{
	       			 	alert("Debe existir al menos un trio guardado");
	       			 }
				}else{
					alert("Debe guardar la venta");
				}				
			} --%>
		
        function actualiza_descuento(index, original)
    	{
    		
    		var campo = document.getElementById("descuento_" + index).value;
			if (estado == "cerrado") 
			{
				alert("La venta esta cerrada, no es posible modificar productos");
			}	
			else
			{
					if(document.getElementById("bloquea").value != "bloquea")
					{	
						//alert(parseFloat(campo));		
						var comparacion = parseFloat(campo) >= 0 && parseFloat(campo) <= 100;
						//alert(comparacion);
						if (comparacion) 
						{			
							var descuento_max = document.getElementById('descuento_max').value;
							var comparacion = parseFloat(campo) <= parseFloat(descuento_max);
							//alert(comparacion);
							if (comparacion) 
							{
								
								document.getElementById('accion').value = "descuento_linea";
					        	document.getElementById('productoSeleccionado').value = index;
					        	document.getElementById('cantidad_descuento').value = campo.replace(',','.');
					        	document.ventaPedidoForm.submit();
					        	
							} else 
							{
									indice = index;
									descuento = campo;
									document.ventaPedidoForm.sobre.focus();
									var tipo = document.ventaPedidoForm.tipo_pedido.value;
									var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo="+ tipo;
									document.ventaPedidoForm.sobre.focus();		
									showPopWin(url, 690, 130, devuelve_descuento, false);
									
							}
						}
						else
						{
							alert("Valor debe estar entre 0 y 100");
							document.getElementById("descuento_" + index).value = original;
						}
						
						
		         	}
		         	else
		         	{
		         		alert("Encargo bloqueado, no es posible modificar productos");
		         	}
		         
		         }
	 	}
	 	
	 	function actualiza_descuento_total(campo_name, original)
    	{
    		campo = document.getElementById(campo_name).value;
    		var $j = jQuery.noConflict();
    		if (parseFloat(original) > 0) 
    		{
				if (estado == "cerrado") 
				{
					alert("La venta esta cerrada, no es posible modificar");
				}	
				else
				{
						if(document.getElementById("bloquea").value != "bloquea")
						{	
							var comparacion = parseFloat(campo) >= 0 && parseFloat(campo) <= 100;
							if (comparacion) 
							{
								var descuento_max = document.getElementById('descuento_max').value;
								var comparacion = parseFloat(campo) <= parseFloat(descuento_max);
								if (comparacion) 
								{
									document.getElementById('accion').value = "descuento_total";
						        	document.getElementById('cantidad_descuento').value = campo.replace(',','.');
						        	document.ventaPedidoForm.submit();
						        	
								} else 
								{
										
										descuento = campo;
										var tipo = document.ventaPedidoForm.tipo_pedido.value
										var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo="+ tipo;	
										if(tipo == '0'){
											alert("Debes seleccionar un tipo de Encargo");
										}else{
											$j("#tipo_pedido").focus();
											showPopWin(url, 690, 130, devuelve_descuento_total, false);
										}
								}
							}
							else
							{
								alert("Valor debe estar entre 0 y 100");
								document.getElementById(campo_name).value = original;
							}																			
			         	}
			         	else
			         	{
			         		alert("Encargo bloqueado, no es posible modificar");
			         	}			         
			    }					
			}
			else
			{
				if (parseFloat(campo) > 0) 
				{
					
					if (estado == "cerrado") 
					{
						alert("La venta esta cerrada, no es posible modificar");
					}	
					else
					{
							if(document.getElementById("bloquea").value != "bloquea")
							{	
								var comparacion = parseFloat(campo) >= 0 && parseFloat(campo) <= 100;
								if (comparacion) 
								{
									var descuento_max = document.getElementById('descuento_max').value;
									var comparacion = parseFloat(campo) <= parseFloat(descuento_max);
									if (comparacion) 
									{
										document.getElementById('accion').value = "descuento_total";
							        	document.getElementById('cantidad_descuento').value = campo.replace(',','.');
							        	document.ventaPedidoForm.submit();
							        	
									} else 
									{
											descuento = campo;
											var tipo = document.ventaPedidoForm.tipo_pedido.value
											var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo="+ tipo;
											if(tipo=='0'){
												alert("Debes seleccionar un tipo de Encargo");
												$j("#tipo_pedido").focus();
											}else{
												showPopWin(url, 690, 130, devuelve_descuento_total, false);
											}												
									}
								}
								else
								{
									alert("Valor debe estar entre 0 y 100");
									document.getElementById(campo_name).value = original;
								}					
								
								
				         	}
				         	else
				         	{
				         		alert("Encargo bloqueado, no es posible modificar");
				         	}
				    }
				}
			}
    		
    		
	 	}
	 	
	 	function actualiza_descuento_total_monto(campo_name, original)
    	{
    		campo = document.getElementById(campo_name).value;
    		
    		//SACA EL PORCENTAJE APROX DEL TOTAL PARA CONSULTAR POR EL AUTORIZADOR
    		var dto = "";
    		var total = document.getElementById('subTotal').value;
    		dto =  (parseFloat(campo) * 100) / parseFloat(total);
    		
    		if (parseFloat(original) > 0) 
    		{
    		
				if (estado == "cerrado") 
				{
					alert("La venta esta cerrada, no es posible modificar");
				}	
				else
				{
						if(document.getElementById("bloquea").value != "bloquea")
						{	
							var comparacion = parseFloat(campo) <= parseFloat(document.getElementById("total").value);
							if (comparacion) 
							{
									var descuento_max = document.getElementById('descuento_max').value;
									var compara = parseFloat(dto) <= parseFloat(descuento_max);

									if(compara)
									{
										document.getElementById('accion').value = "descuento_total_monto";
							        	document.getElementById('cantidad_linea').value = campo;
							        	document.getElementById('subTotal').focus();
							        	document.ventaPedidoForm.submit();
							        }
						        	else 
									{
										descuento = campo; 
										descuento_porc = dto;
										
										var tipo = document.ventaPedidoForm.tipo_pedido.value;
										var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo="+ tipo;	
										showPopWin(url, 690, 130, devuelve_descuento_total_monto, false);
										
									}
						        	
							}
							else
							{
								alert("Valor no puede ser mayor al monto total");
								document.getElementById(campo_name).value = original;
							}					
							
							
			         	}
			         	else
			         	{
			         		alert("Encargo bloqueado, no es posible modificar");
			         	}
			         
			         }
			}
			else
			{
				if (parseFloat(campo) > 0) 
				{
				
					if (estado == "cerrado") 
					{
						alert("La venta esta cerrada, no es posible modificar");
					}	
					else
					{
							if(document.getElementById("bloquea").value != "bloquea")
							{	
								var comparacion = parseFloat(campo) <= parseFloat(document.getElementById("total").value);
								if (comparacion) 
								{
									var descuento_max = document.getElementById('descuento_max').value;
									var compara = parseFloat(dto) <= parseFloat(descuento_max);

									if(compara)
									{
										document.getElementById('accion').value = "descuento_total_monto";
							        	document.getElementById('cantidad_linea').value = campo;
							        	document.getElementById('subTotal').focus();
							        	document.ventaPedidoForm.submit();
							        }
						        	else 
									{
										descuento = campo; 
										descuento_porc = dto;
										
										var tipo = document.ventaPedidoForm.tipo_pedido.value
										var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo="+ tipo;	
										showPopWin(url, 690, 130, devuelve_descuento_total_monto, false);
										
									}
							        	
								}
								else
								{
									alert("Valor no puede ser mayor al monto total");
									document.getElementById(campo_name).value = original;
								}					
								
								
				         	}
				         	else
				         	{
				         		alert("Encargo bloqueado, no es posible modificar");
				         	}
				         
				         }
				}			
			}
	 	}
	 	function devuelve_descuento_ln(valores)
	 	{
	 		document.ventaPedidoForm.forma_pago.value = valores[0];
	 		document.ventaPedidoForm.convenio.value = valores[2];
	 		if("" != valores[3])
	 		{
	 			document.ventaPedidoForm.convenio_det.value = valores[3];
	 		}
	 		document.ventaPedidoForm.convenio_ln.value = valores[4];
	 		document.getElementById('accion').value = "cambio_convenio";
        	document.ventaPedidoForm.submit();
	 	}
	 	
	 	function buscarConvenioAjax()
	 	{
	 		var $j = jQuery.noConflict();
	 		
	 		if($j("#convenio").val()=="50464" && $j("#cliente_dto").val() == "" ){
	 		
	 			if($j("#cliente_dto").val() =="" ){
			 		showPopWin('<%=request.getContextPath()%>/SeleccionPago.do?method=exige_valida_dto&accion=valida', 230, 110,null,false);			 		 
			 	}	
	 			
	 		}else{	 		
		 		if(estado == "cerrado")
					{
						alert("La venta esta cerrada, no es posible modificar convenios");
					}
					else
					{
						if (flujo != "formulario") 
						{
							if (flujo == "modificar") 
							{
								if(document.getElementById("bloquea").value != "bloquea")
								{
									var convenio = document.ventaPedidoForm.convenio.value;
							 		if ("" != convenio) 
							 		{
										document.ventaPedidoForm.convenio_det.value = 'Buscando......';
										new Ajax.Request('<html:rewrite page="/BusquedaConvenios.do?method=buscarConvenioAjax"/>', {
										parameters: {convenio: convenio},
										onComplete: function(transport, obj_convenio)
											{
												var valor = obj_convenio.descripcion;
												if("undefined"==valor)
												{
													document.ventaPedidoForm.convenio_det.value="";
													document.ventaPedidoForm.convenio.value="";
												}
												document.ventaPedidoForm.convenio_det.value = obj_convenio.descripcion;
												var url = "<%=request.getContextPath()%>/BusquedaConvenios.do?method=selecciona_convenio_cdg&convenio="+obj_convenio.cdg;	
														showPopWin(url, 620, 300, devuelve_descuento_ln, false);
												
											}
										});
									}
									else
									{
										alert("debe ingresar un código de convenio");
									}
								}
								else
								{
									alert("Encargo bloqueado, no es posible modificar convenios");
								}
							}
							else
							{
								if(document.forms[0].cliente.value != "" && document.forms[0].cliente.value != "0")
				            	{
				            		var convenio = document.ventaPedidoForm.convenio.value;
							 		if ("" != convenio) 
							 		{
										document.ventaPedidoForm.convenio_det.value = 'Buscando......';
										new Ajax.Request('<html:rewrite page="/BusquedaConvenios.do?method=buscarConvenioAjax"/>', {
										parameters: {convenio: convenio},
										onComplete: function(transport, obj_convenio)
											{
												document.ventaPedidoForm.convenio_det.value = obj_convenio.descripcion;
												if("undefined"==document.ventaPedidoForm.convenio_det.value)
												{
													document.ventaPedidoForm.convenio_det.value="";
													document.ventaPedidoForm.convenio.value="";
												}
												
												var url = "<%=request.getContextPath()%>/BusquedaConvenios.do?method=selecciona_convenio_cdg&convenio="+obj_convenio.cdg;	
												showPopWin(url, 620, 300, devuelve_descuento_ln, false);
												
											}
										});
									}
									else
									{
										alert("debe ingresar un código de convenio");
									}
				            	}
				            	else
				            	{
				            		alert("Debe seleccionar un cliente, para agregar convenios");
				            	}
							}
						}
						else
						{
							alert("No hay ventas en curso, no es posible ingresar convenios");
						}
					}
			}
	 	}
	 	
	 	function buscarClienteAjax(){
	 		
	 			document.getElementById("nombre_clienteDIV").innerHTML="";
				var nif = document.getElementById("nif").value;				
				//MEJORA BUSCAR RUT POR AJAX - LMARIN 20180530
				if(val_rut.test(nif)!= false){
						document.getElementById("nif").value = "Buscando...";	
						
						 $j.ajax({
							  type: "POST",
							  url: 'BusquedaClientes.do?method=buscarClienteAjax',
							  dataType: "json",
							  data:"nif="+nif+"&pagina=encargo",
							  asycn:false,
							  success: function(json){
								  if("" != json.codigo_cliente && "" != json.nif){
								      	document.getElementById("nif").value = json.nif;		
								      	document.getElementById("dvnif").value = json.dvnif;
								      	document.getElementById("nombre_cliente").value = json.nombre_cliente;
								      	document.getElementById("cliente").value = json.codigo_cliente;	
								      	document.getElementById("nombre_clienteDIV").innerHTML= json.nombre_cliente;
								      	var miArray = new Array(10);
								      		miArray[0] = json.codigo_cliente;
									      	miArray[1] = json.nif;
									      	miArray[2] = json.nombre;
									      	miArray[3] = json.apellido;
									      	miArray[4] =  json.dvnif;
								      	cargaClientePedido(miArray);
								      	
						       	  }else{
								       		alert("El cliente con rut "+nif+" no existe");
								       		document.getElementById("nif").value = "";	
								  }//fin if else					      	      			         		         
							   }	  												  		
						 })
						 
				}	
		}
		
		function desbloqueaNif(estado,error,flujo){
			
			if(flujo == "formulario")
			{
				if("formulario" == flujo){
					
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
		}
		function mostrar_pagos_boletas(){
			var cod_suc = document.getElementById("codigo_suc").value;
			var codigo = document.getElementById("codigo_pedido").value;
			var cdg_vta = cod_suc +"/" +codigo;
			var fecha = "";
			
			try{
				fecha = document.getElementById("popupDatepicker2").value;			
			}catch(Err){
				try{
					fecha = document.getElementById("fechaF").value;
				}catch(Err){
					fecha="error";
				}
			}
			
			
			if("" != codigo){
				if("" != fecha && "error" != fecha){				
					var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaMostrarPagosBoletas&tipo=PEDIDO&serie="+cdg_vta+"&fecha="+fecha;	
					showPopWin(url, 700, 200, vuelve_Pago, false);
				}else{
					alert("Debe ingresar fecha de encargo");
				}
			}else{
				alert("Debe existir una venta en curso");
			}
									
		}
		
		function validaTrioMultioferta(){
			
		}
		function generaFichaCliente(){
				
				var codigo_pedido = document.getElementById('codigo_pedido').value;
				var codigo_suc = document.getElementById('codigo_suc').value;
				var cliente = document.getElementById('cliente').value;
				
				var parametro="";
				new Ajax.Request('<html:rewrite page="/VentaPedido.do?method=validaTrioMultioferta"/>', {
				      parameters: {nif: parametro},      
				      onComplete: function(transport, json) {
				      	 
				      	 if("" != json.tieneTrio){				      	 		      	 	
        					var tieneTrioMulti = json.tieneTrio;
						    if("ok"==tieneTrioMulti){
						    	haymulti=true;
						    	if(("" != codigo_pedido) && ("" != cliente)){
								 var cdg = codigo_suc +"/"+codigo_pedido;
								 //cdg = "19/0082635";
								 //cliente = "410021795";
								 var respuesta = existeTrio();
												             		 				 
								 if(respuesta){				 
									 var url = "/CreaFichaCliente?cdg="+cdg+"&cliente="+cliente;				 
					       			 window.open("<%=request.getContextPath()%>"+url);
				       			 }else{
				       			 	if(haymulti){
				       			 		var url = "/CreaFichaCliente?cdg="+cdg+"&cliente="+cliente;				 
					       			 	window.open("<%=request.getContextPath()%>"+url);
				       			 	}else{
				       			 		alert("Debe existir al menos un trio guardado o lente contacto graduable");
				       			 	}
				       			 }
								}else{
									alert("Debe guardar la venta");
								}		
						    	
						    	
						    }else{
						    	haymulti = false;
						    	
						    	if(("" != codigo_pedido) && ("" != cliente)){
								 var cdg = codigo_suc +"/"+codigo_pedido;
								 //cdg = "19/0082635";
								 //cliente = "410021795";
								 var respuesta = existeTrio();
												             		 				 
								 if(respuesta){				 
									 var url = "/CreaFichaCliente?cdg="+cdg+"&cliente="+cliente;				 
					       			 window.open("<%=request.getContextPath()%>"+url);
				       			 }else{
				       			 	if(haymulti){
				       			 		var url = "/CreaFichaCliente?cdg="+cdg+"&cliente="+cliente;				 
					       			 	window.open("<%=request.getContextPath()%>"+url);
				       			 	}else{
				       			 		alert("Debe existir al menos un trio guardado o lente contacto graduable");
				       			 	}
				       			 }
								}else{
									alert("Debe guardar la venta");
								}		
						    	
						    	
						    }  					         	
				      	 }else{				      	 	
				      	 	return false;			      	 	
				      	 }				         		         
				      }
				  });
				
				
						
			}
			
			function validaCantidadProductosMulitIngreso(){
			
			
				new Ajax.Request('<html:rewrite page="/VentaPedido.do?method=validaCantidadProductosMultiofertas"/>', {
						      parameters: {pagina: "directa"},      
						      onComplete: function(transport, json) {
						      					      	
						      var respuesta = json.cantidad;
						      var codigo = json.codigoMulti; 	
							      if("menor"==respuesta){
							      	alert("La cantidad de productos en la multioferta "+codigo+" no esta completa");							      	
							      }else{
							      	ingresa_pedido();
							      }		         		         
						      }
						   });
			
			}
			
			function validaCantidadProductosMulit(){
			
			
				new Ajax.Request('<html:rewrite page="/VentaPedido.do?method=validaCantidadProductosMultiofertas"/>', {
						      parameters: {pagina: "directa"},      
						      onComplete: function(transport, json) {
						      					      	
						      var respuesta = json.cantidad;
						      var codigo = json.codigoMulti; 	
							      if("menor"==respuesta){
							      	alert("La cantidad de productos en la multioferta "+codigo+" no esta completa");							      	
							      }else{
							      	valida_venta();
							      }		         		         
						      }
						   });
			
			}
  </script>
		
    <title><bean:message key="title.pos"/></title>
 
    </head>
    <bean:define id="estado" type="String">
		<bean:write property="estado" name="ventaPedidoForm"/>
	</bean:define>
	<bean:define id="error" type="String">
		<bean:write property="error" name="ventaPedidoForm"/>
	</bean:define>
	<bean:define id="flujo" type="String">
		<bean:write property="flujo" name="ventaPedidoForm"/>
	</bean:define>
	<bean:define id="estado_boleta" type="String">
		<bean:write property="estado_boleta" name="ventaPedidoForm"/>
	</bean:define>

    <body onload="javascript:estado_venta('${estado}','${error}','${flujo}');javascript:estilo();if(history.length>0)history.go(+1);desbloqueaNif('${estado}','${error}','${flujo}');javascript:estado_boleta('${estado_boleta}');" >
        <div id="load_gif" class="pantalla2"></div>
        <div id="bloqueo" class="pantalla2"></div>
        <html:form action="/VentaPedido?method=IngresaVentaPedido" styleId="form1">
            <html:hidden property="addProducto" styleId="productoSeleccionado"/>
            <html:hidden property="cliente" name="ventaPedidoForm"  styleId="cliente" />
            <html:hidden property="cdg" name="ventaPedidoForm"  styleId="cdg" />
            <html:hidden property="cantidad" value="" styleId="cantidad"/>
            <html:hidden property="cantidad_descuento" value="" styleId="cantidad_descuento"/>
            <html:hidden property="cantidad_linea" value="" styleId="cantidad_linea"/>
            <html:hidden property="descripcion" value="" styleId="descripcion"/>
            <html:hidden property="ojo" value="" styleId="ojo"/>
            <html:hidden property="cantidadProductos" styleId="cantidad_productos" name="ventaPedidoForm"/>
            <html:hidden property="accion" value="" styleId="accion" name="ventaPedidoForm"/>
            <html:hidden property="ocultar" name="ventaPedidoForm"  styleId="ocultar" />
            <html:hidden property="bloquea" name="ventaPedidoForm"  styleId="bloquea" />
            <html:hidden property="msnPedidoEntrega" name="ventaPedidoForm"  styleId="msnPedidoEntrega" />
            <html:hidden property="eliminarPedid" name="ventaPedidoForm"  styleId="eliminarPed" />
            <html:hidden property="fecha" name="ventaPedidoForm"  styleId="fecha_pedido" />
            <html:hidden property="mostrarFichaTecnica" name="ventaPedidoForm"  styleId="mostrarFichaTecnica" />
            <html:hidden property="porcentaje_descuento_max" styleId="descuento_max" name="ventaPedidoForm"/>
            <html:hidden property="descuento_autoriza" styleId="descuento_autoriza" name="ventaPedidoForm"/>
            <html:hidden property="nombre_cliente" styleId="nombre" name="ventaPedidoForm"/>
            <html:hidden property="convenio_ln" styleId="convenio_ln" name="ventaPedidoForm"/>
            <html:hidden property="estaGrabado" styleId="estaGrabado" />
            <html:hidden property="flujo" styleId="flujo_form" name="ventaPedidoForm"/>
            <html:hidden property="codigo_confirmacion" styleId="codigo_confirmacion" name="ventaPedidoForm"/>
            <html:hidden property="tipo_armazon" styleId="armazon" name="ventaPedidoForm"/>
            <html:hidden property="puente" styleId="puente" name="ventaPedidoForm"/>
            <html:hidden property="diagonal" styleId="diagonal" name="ventaPedidoForm"/>
            <html:hidden property="horizontal" styleId="horizontal" name="ventaPedidoForm"/>
            <html:hidden property="vertical" styleId="vertical" name="ventaPedidoForm"/>
            <html:hidden property="codigo_mult" styleId="codigo_mult" name="ventaPedidoForm" />
			<html:hidden property="index_multi" styleId="index_multi" name="ventaPedidoForm" />
			<html:hidden property="mostrarDev" styleId="mostrarDev" name="ventaPedidoForm" /><!--mostrarDev-->
			<html:hidden property="encargo_padre" styleId="encargo_padre" name="ventaPedidoForm" />
			<html:hidden property="seg_cristal" styleId="seg_cristal" name="ventaPedidoForm" />
			<html:hidden property="cliente_dto" styleId="cliente_dto" name="ventaPedidoForm" />
			<html:hidden property="tipoimp" styleId="tipoimp" name="ventaPedidoForm" />
			<html:hidden property="estado_boleta" styleId="estado_boleta" name="ventaPedidoForm" />
			<html:hidden property="isapre" styleId="isapre" name="ventaPedidoForm" />
			<html:hidden property="venta_seguro" styleId="venta_seguro" name="ventaPedidoForm" />
			<html:hidden property="numero_cupon" styleId="numero_cupon" name="ventaPedidoForm" />
			<html:hidden property="segCris" styleId="segCris" name="ventaPedidoForm" />
			
            <table width="100%" cellspacing="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="venta.pedido.encargos"/></td> 
              	
              		
	              	<td align="right" bgcolor="#373737" id="txt4" width="30">
	              		<a href="#"	id="nuevoPedido" onclick="nuevo_Pedido()">
							 <img src="images/nuevo.png" width="20" height="20"	border="0" title="Nuevo Encargo">
						</a>
	    			</td> 
	    			<td align="right" bgcolor="#373737" id="txt4" width="30">
              			<a href="#" onclick="cargaPedidoCliente()">
      						 <img src="images/lista.png" width="18" height="15"	border="0" title="Listar Encargos">
    					</a>
    				</td>
              	
    			<td align="right" bgcolor="#373737" id="txt4" width="30">
              		<a href="#" onclick="busquedaAvanzada()">
      						 <img src="images/lupa.png" width="18" height="15"	border="0" title="Busqueda Avanzada Encargos">
    				</a>
    			</td>
    			
    			<logic:notEqual value="true" property="otra_tienda" name="ventaPedidoForm">
	    			<logic:equal value="modificar" name="ventaPedidoForm" property="flujo"> 
	    			<td align="right" bgcolor="#373737" width="30">
	    				<a href="#" onclick="eliminarPedido()"  id="pedborra">
	      						<img src="images/delete.png" width="20" height="20"	border="0" title="Eliminar Encargo">
	    				</a>
	    			</td>
	    			</logic:equal>
    			</logic:notEqual>
    			<logic:notEqual value="true" property="otra_tienda" name="ventaPedidoForm">
	    			<td align="right" bgcolor="#373737" width="30">
	    				<a href="#" onclick="mostrar_pagos_boletas();"  id="pedborra">
	      						<img src="images/boleta.png" width="20" height="20"	border="0" title="Mostrar Pagos y Boletas ">
	    				</a>
	    			</td>
	    		</logic:notEqual>
    			<logic:equal value="S" property="muestra_ftaller" name="ventaPedidoForm">	
	    			<td align="right" bgcolor="#373737" width="30">
	    				<a href="#" onclick="generaFichaTecnica();"  id="pedborra">
	      						<img src="images/Hoja.png" width="20" height="20"	border="0" title="Ficha Taller">
	    				</a>
	    			</td>
    			</logic:equal>
	    			<td align="right" bgcolor="#373737" width="30">
	    				<a href="#" onclick="generaFichaCliente();"  id="pedborra">
	      						<img src="images/cliente.gif" width="20" height="20"	border="0" title="Ficha Cliente">
	    				</a>
	    			</td>
	    			
	    		<logic:notEqual value="true" property="otra_tienda" name="ventaPedidoForm">
	    			<logic:notEqual value="true" name="ventaPedidoForm" property="pedido_costo_cero">
	    			<td id="txt4" bgcolor="#373737"  id="txt4" width="30" align="right" >
						<a href="#" onclick="validaCantidadProductosMulit()" id="enviar">
			      			<img src="images/money2.png" width="22" height="22" border="0" title="Totalizar Encargo" >
			    		</a>
					</td>
					</logic:notEqual>
					
	              	<td align="right" bgcolor="#373737" id="txt4" width="30">
	              		<a id="btnIngresarPedido" href="#" onclick="ingresa_pedido()">
	      						<img src="images/check.png" width="15" height="15" border="0" title="Guardar">
	    				</a>
	    			</td>
	    		</logic:notEqual>
    			<td align="right" width="30" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="cerrar_venta()">
      						<img src="images/cancel.png" width="15" height="15" border="0"title="Cerrar" >
    				</a>
    			</td>
              </tr>
            </table>
            
            <logic:equal value="true" property="otra_tienda" name="ventaPedidoForm">
            	<div class="pantalla"></div> 
            </logic:equal>
            
            
            
            <table width="100%" cellspacing="1">
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.codigo"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:text property="codigo_suc" readonly="true" name="ventaPedidoForm" size="2" styleClass="fto" styleId="codigo_suc"/>
                	<html:text property="codigo" readonly="true" name="ventaPedidoForm" size="8" styleClass="fto" styleId="codigo_pedido"/>
                </td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.cliente"/></td> 
				<td align="justify" bgcolor="#c1c1c1" id="txt5">
					<html:text property="nif" maxlength="8" styleId="nif" size="30" styleClass="fto"
						onblur="javascript:this.value=this.value.toUpperCase();" size="13" />-
					<html:text property="dvnif" size="1" styleClass="fto" readonly="true" styleId="dvnif" />
					<html:text property="nif" maxlength="30" styleId="cli_int" size="31" styleClass="fto"
						onblur="javascript:this.value=this.value.toUpperCase();" size="13" style="display:none" disabled />	
					<a href="#" onclick="javascript:buscarClienteAjax();"> <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de cliente"> </a> 
					<a href="#" onclick="javascript:busqueda_cliente()">
      						<img src="images/lupa.png" width="15" height="15" border="0" >
    				</a>
    				<a id="cliente_generico" href="#" >
      						<img src="images/cliente_generico.png" width="15" height="15" border="0" >
    				</a>
				<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2">
					<div id="nombre_clienteDIV" ></div>
				</td>				                
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.fecha"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                
                	<logic:equal value="true" property="desde_presupuesto" name="ventaPedidoForm">
                		<html:text property="fecha" readonly="true" name="ventaPedidoForm" size="8" styleClass="fto"  styleId="fechaF" />
					</logic:equal>
					<logic:equal value="false" property="desde_presupuesto" name="ventaPedidoForm">
						<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
							<html:text property="fecha" readonly="true" name="ventaPedidoForm" size="8" styleClass="fto"  styleId="fechaF"  />	            
						</logic:equal>
			            <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
							<html:text property="fecha" readonly="true" name="ventaPedidoForm" size="8" styleClass="fto" styleId="popupDatepicker2" onchange="verificaFechaVenta(this);cambiaEstadoNOGrabado();"/>
			            </logic:equal>
					</logic:equal>
                	
                </td>
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="venta.pedido.forma.pago"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                
                <logic:equal value="true" property="desde_presupuesto" name="ventaPedidoForm">
                	<html:select disabled="true"  property="forma_pago" name="ventaPedidoForm" styleClass="fto" style="width:150px;" onchange="cambiaEstadoNOGrabado();" >   
                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="ventaPedidoForm" property="listaFormaPago" label="descripcion" value="id" />
                    </html:select>
                </logic:equal>
                <logic:equal value="false" property="desde_presupuesto" name="ventaPedidoForm">
                	<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
	                	<html:select disabled="true"  property="forma_pago" name="ventaPedidoForm" styleClass="fto" style="width:150px;" onchange="cambiaEstadoNOGrabado();" >   
                        	<html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
                        	<html:optionsCollection name="ventaPedidoForm" property="listaFormaPago" label="descripcion" value="id" />
                    	</html:select>
	                </logic:equal>
	                <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
	                	<html:select  property="forma_pago" name="ventaPedidoForm" styleClass="fto" style="width:150px;" onchange="cambiaEstadoNOGrabado();" >   
	                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
	                        <html:optionsCollection name="ventaPedidoForm" property="listaFormaPago" label="descripcion" value="id" />
                    	</html:select>
	                </logic:equal>
                </logic:equal>
                    
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                <bean:message key="venta.pedido.divisa"/>
                </td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" height="16" style="height: 16px">
				
				<logic:equal value="true" property="desde_presupuesto" name="ventaPedidoForm">
					 <html:select disabled="true" property="divisa" name="ventaPedidoForm" style="" styleClass="fto" style="width:150px;" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="ventaPedidoForm" property="listaDivisas" label="descripcion" value="id" />
                    </html:select>
                </logic:equal>
				<logic:equal value="false" property="desde_presupuesto" name="ventaPedidoForm">
					<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
						<html:select disabled="true" property="divisa" name="ventaPedidoForm" style="" styleClass="fto" style="width:150px;" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="ventaPedidoForm" property="listaDivisas" label="descripcion" value="id" />
                    	</html:select>
		            </logic:equal>
		            <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
		            	<html:select property="divisa" name="ventaPedidoForm" style="" styleClass="fto" style="width:150px;" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="ventaPedidoForm" property="listaDivisas" label="descripcion" value="id" />
                    	</html:select>
		            </logic:equal>
				</logic:equal>
				
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="venta.pedido.idioma"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                
                	<logic:equal value="true" property="desde_presupuesto" name="ventaPedidoForm">
	                	<html:select disabled="true" property="idioma" name="ventaPedidoForm" styleClass="fto" style="width:150px;"> 
	                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
	                        <html:optionsCollection name="ventaPedidoForm" property="listaIdiomas" label="descripcion" value="id" />
	                    </html:select>
                	</logic:equal>
                	<logic:equal value="false" property="desde_presupuesto" name="ventaPedidoForm">
                		<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
							<html:select disabled="true" property="idioma" name="ventaPedidoForm" styleClass="fto" style="width:150px;"> 
		                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
		                        <html:optionsCollection name="ventaPedidoForm" property="listaIdiomas" label="descripcion" value="id" />
	                    	</html:select>
			            </logic:equal>
			            <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
			            	<html:select property="idioma" name="ventaPedidoForm" styleClass="fto" style="width:150px;"> 
                        	<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        	<html:optionsCollection name="ventaPedidoForm" property="listaIdiomas" label="descripcion" value="id" />
                    		</html:select>
			            </logic:equal>
                	</logic:equal>
                    
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="venta.pedido.hora"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                	<html:text property="hora" readonly="true" name="ventaPedidoForm" size="8" styleClass="fto"/>
                </td>
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30"><bean:message key="venta.pedido.tipo.pedido"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">
                	
                	
                	<logic:equal value="true" property="desde_presupuesto" name="ventaPedidoForm">
	                	<html:select disabled="true" property="tipo_pedido" name="ventaPedidoForm" styleClass="fto" style="width:150px;" styleId="tipo_pedido" onchange="cambiaEstadoNOGrabado();" > 
	                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
	                        <html:optionsCollection name="ventaPedidoForm" property="listaTiposPedidos" label="descripcion" value="codigo" />
	                    </html:select>
	                </logic:equal>
	                <logic:equal value="false" property="desde_presupuesto" name="ventaPedidoForm">
	                	<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
	                	<html:select disabled="true" property="tipo_pedido" name="ventaPedidoForm" styleClass="fto" style="width:150px;" styleId="tipo_pedido" onchange="cambiaEstadoNOGrabado();" > 
	                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
	                        <html:optionsCollection name="ventaPedidoForm" property="listaTiposPedidos" label="descripcion" value="codigo" />
	                    </html:select>
		                </logic:equal>
	                	<logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
		                	<html:select property="tipo_pedido" name="ventaPedidoForm" styleClass="fto" style="width:150px;" styleId="tipo_pedido" onchange="cambiaTipoEncargo(this) ; cambiaEstadoNOGrabado();" > 
	                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
	                        <html:optionsCollection name="ventaPedidoForm" property="listaTiposPedidos" label="descripcion" value="codigo" />
	                    	</html:select>
	                    	<!-- SE COMENTA A PETICION DE PLBARRERA 20140122 -->
	                    	<logic:equal property="tipo_pedido" value="SG" name="ventaPedidoForm" >
	                    		<logic:equal property="encargo_garantia" value="" name="ventaPedidoForm" >
	                    			<html:text property="encargo_garantia" size="8" styleId="encargo_amigo" styleClass="fto seguro" onblur="validaEncargoSeguroGarantia(this)"/>
	                    		</logic:equal>
	                    		
	                   		</logic:equal>
	                   		
	                   		<logic:equal property="tipo_pedido" value="SEG" name="ventaPedidoForm" >
	                    		<logic:equal property="encargo_seguro" value="" name="ventaPedidoForm" >
	                    			<html:text property="encargo_seguro" size="8" styleId="encargo_seguro" styleClass="fto seguro" />
	                    		</logic:equal>	          
	                   		</logic:equal>
	                   		
	                    	<html:text property="encargo_garantia" size="8" value="" style="display:none;" styleId="encargo_amigo" styleClass="fto seguro" />
		               
		                </logic:equal>
	                 </logic:equal>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30"><bean:message key="venta.pedido.agente"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">
                	<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
						<html:select disabled="true" property="agente" name="ventaPedidoForm" styleClass="fto" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="ventaPedidoForm" property="listaAgentes" label="usuario" value="usuario" />
                    	</html:select>
		            </logic:equal>
		            <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
		            	<html:select property="agente" name="ventaPedidoForm" styleClass="fto" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="ventaPedidoForm" property="listaAgentes" label="usuario" value="usuario" />
                    	</html:select>
		            </logic:equal>
                	
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30"><bean:message key="venta.pedido.convenio"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">
                	
                	<logic:equal value="" name="ventaPedidoForm" property="convenio_det">
                	
                		<logic:equal value="true" property="desde_presupuesto" name="ventaPedidoForm">
                			<html:text property="convenio" styleId="convenio" name="ventaPedidoForm" size="5" styleClass="fto" readonly="true"/> -
	                		<html:text property="convenio_det" name="ventaPedidoForm" size="20" readonly="true" styleClass="fto" />
						</logic:equal>
						<logic:equal value="false" property="desde_presupuesto" name="ventaPedidoForm">
							
							<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
								<html:text property="convenio" styleId="convenio" name="ventaPedidoForm" size="5" styleClass="fto" readonly="true"/> -
	                			<html:text property="convenio_det" name="ventaPedidoForm" size="20" readonly="true" styleClass="fto" />
				            </logic:equal>
				            <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
				            	<html:text property="convenio" styleId="convenio" name="ventaPedidoForm" size="5" styleClass="fto"/> -
		                		<html:text property="convenio_det" name="ventaPedidoForm" size="20" readonly="true" styleClass="fto"/>
			                	<a href="#" onclick="javascript:buscarConvenioAjax();"> 
			                		<img src="images/luparapida.jpg" width="15" height="15" border="0" title="Busqueda rápida de convenios"> </a> 
								<a href="#" onclick="javascript:busqueda_convenio_avanzada()">
			      						<img src="images/lupa.png" width="15" height="15" border="0" >
			    				</a>
				            </logic:equal>
						</logic:equal>
                	</logic:equal>
                	<logic:notEqual value="" name="ventaPedidoForm" property="convenio_det">
                		<html:text property="convenio" styleId="convenio" name="ventaPedidoForm" size="5" styleClass="fto" readonly="true"/> -
                		<html:text property="convenio_det" name="ventaPedidoForm" size="20" readonly="true" styleClass="fto" style="background-color:#c1c1c1"/>
						<a href="#" onclick="javascript:elimina_convenio_sel()">
	      						<img src="images/cancel.png" width="15" height="15" border="0" >
	    				</a>
                	</logic:notEqual><td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.cambio"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt5">
					<html:text property="cambio" readonly="true" name="ventaPedidoForm" size="8" styleClass="fto"/>
				</td>
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.numero.sobre"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
                		<html:text property="sobre" size="10" name="ventaPedidoForm" styleClass="fto" styleId="sobre" readonly="true" />
		            </logic:equal>
		            <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
						<html:text property="sobre" size="10" name="ventaPedidoForm" styleClass="fto" styleId="sobre" onkeypress="return validar_numerico(event)" onchange="cambiaEstadoNOGrabado();" />
		            </logic:equal>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5"></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
            
                     <logic:equal value="modificar" property="flujo" name="ventaPedidoForm">  
                    	<logic:equal value="true" property="pagadoTotal" name="ventaPedidoForm">
                    		<logic:equal value="S" property="cerrado" name="ventaPedidoForm">
                				<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
                			</logic:equal>
                			<logic:notEqual value="S" property="cerrado" name="ventaPedidoForm">
                				<logic:equal value="false" property="entregado" name="ventaPedidoForm">
                					<html:button property="boton" value="Entrega de Encargos" onclick="pedidoEntrega()" styleClass="button"></html:button>
                				</logic:equal>
                				<logic:notEqual value="false" property="entregado" name="ventaPedidoForm">
                					<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
                				</logic:notEqual>
                			</logic:notEqual>
                		</logic:equal>
                		<logic:notEqual value="true" property="pagadoTotal" name="ventaPedidoForm">
                			<logic:equal value="true" property="pedido_costo_cero" name="ventaPedidoForm">
                				<logic:equal value="S" property="cerrado" name="ventaPedidoForm">
                					<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
                				</logic:equal>
                				<logic:notEqual value="S" property="cerrado" name="ventaPedidoForm">
	                				<logic:equal value="false" property="entregado" name="ventaPedidoForm">
	                					<html:button property="boton" value="Entrega de Encargos" onclick="pedidoEntrega()" styleClass="button"></html:button>
	                				</logic:equal>
	                				<logic:notEqual value="false" property="entregado" name="ventaPedidoForm">
	                					<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
	                				</logic:notEqual>
                				</logic:notEqual>
                			</logic:equal>
                			<logic:notEqual value="true" property="pedido_costo_cero" name="ventaPedidoForm">
                				<html:button property="boton" value="Entrega de Encargos" styleClass="button" disabled="true"></html:button>
                			</logic:notEqual>
                		</logic:notEqual>
                	</logic:equal> 
               		<logic:notEqual value="modificar"  property="flujo" name="ventaPedidoForm">
                		<logic:equal value="true" property="pagadoTotal" name="ventaPedidoForm">
                    		<logic:equal value="S" property="cerrado" name="ventaPedidoForm">
                				<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
                			</logic:equal>
                			<logic:notEqual value="S" property="cerrado" name="ventaPedidoForm">
                				<logic:equal value="false" property="entregado" name="ventaPedidoForm">
                					<html:button property="boton" value="Entrega de Encargos" onclick="pedidoEntrega()" styleClass="button"></html:button>
                				</logic:equal>
                				<logic:notEqual value="false" property="entregado" name="ventaPedidoForm">
                					<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
                				</logic:notEqual>
                			</logic:notEqual>
                		</logic:equal>
                		<logic:notEqual value="true" property="pagadoTotal" name="ventaPedidoForm">
                			<logic:equal value="true" property="pedido_costo_cero" name="ventaPedidoForm">
                				<logic:equal value="S" property="cerrado" name="ventaPedidoForm">
                					<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
                				</logic:equal>
                				<logic:notEqual value="S" property="cerrado" name="ventaPedidoForm">
                					<logic:equal value="false" property="entregado" name="ventaPedidoForm">
                					<html:button property="boton" value="Entrega de Encargos" onclick="pedidoEntrega()" styleClass="button"></html:button>
	                				</logic:equal>
	                				<logic:notEqual value="false" property="entregado" name="ventaPedidoForm">
	                					<html:button property="boton" value="Encargo Entregado"  styleClass="button2" disabled="true"></html:button>
	                				</logic:notEqual>
                				</logic:notEqual>
                			</logic:equal>
                			<logic:notEqual value="true" property="pedido_costo_cero" name="ventaPedidoForm">
                				<html:button property="boton" value="Entrega de Encargos" styleClass="button" disabled="true"></html:button>
                			</logic:notEqual>
                		</logic:notEqual>
                	</logic:notEqual>
                
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.promocion"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<logic:equal value="true" property="desde_presupuesto" name="ventaPedidoForm">
                		<html:select disabled="true" property="promocion" styleId="promocion" name="ventaPedidoForm" styleClass="fto" style="width:150px;" > 
							<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
							<html:optionsCollection name="ventaPedidoForm"
								property="listaPromociones" label="descripcion" value="id" />
						</html:select>	
					</logic:equal>
					<logic:equal value="false" property="desde_presupuesto" name="ventaPedidoForm">
					
						<logic:equal value="true" property="tiene_pagos" name="ventaPedidoForm">
							<html:select disabled="true" property="promocion" styleId="promocion" name="ventaPedidoForm" styleClass="fto" style="width:150px;" > 
								<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
								<html:optionsCollection name="ventaPedidoForm"
									property="listaPromociones" label="descripcion" value="id" />
							</html:select>			            </logic:equal>
			            <logic:equal value="false" property="tiene_pagos" name="ventaPedidoForm">
			            	<html:select property="promocion" styleId="promocion" name="ventaPedidoForm" styleClass="fto" style="width:150px;" > 
								<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
								<html:optionsCollection name="ventaPedidoForm"
									property="listaPromociones" label="descripcion" value="id" />
							</html:select>	
			            </logic:equal>
					</logic:equal>
                	<div id="img_logo_promo" ></div>		
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	
                </td>
                
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	
                	<input type="button" id="cupon" class="button fto" value="Cupon" disabled></input>
                	
                </td>
              

              </tr>
            </table>
            <table width="100%" cellspacing="0">
                <tr id="thead" >
                    <td scope="col" id="txt6" bgcolor="#373737" width="70"><bean:message key="venta.pedido.articulo"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width=""><bean:message key="venta.pedido.descripcion"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="80"><bean:message key="venta.pedido.precio.iva"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="40"><bean:message key="venta.pedido.cantidad"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="40"><bean:message key="venta.pedido.desc"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="80"><bean:message key="venta.pedido.importe"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="40"><bean:message key="venta.pedido.grupo"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="65"><bean:message key="venta.pedido.estado"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="40"><bean:message key="venta.pedido.tipo"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="40"><bean:message key="venta.pedido.tratamiento"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="30"><bean:message key="venta.directa.multioferta"/></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="15"></td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="15">
                    	<a href="#" id="busca_multi" onclick="">
      						<img src="images/multi.png" width="15" height="15" border="0" title="Buscar Multioferta" >
    					</a>
                    </td>
                    <td scope="col" id="txt6" bgcolor="#373737" width="15">
                    	<a href="#" id="agregar_prod" onclick="javascript:busqueda_producto()">
      						<img src="images/add.png" width="15" height="15" border="0" title="Agregar Productos" >
    					</a>
                    </td>
                            
                </tr>
                </table>
           
           		
           		
           		
            	<div id="scrolling_pedido">
            	<table width="100%" cellspacing="0" id="contenido">
                <logic:present property="listaProductos" name="ventaPedidoForm">
               		<logic:iterate id="productos" property="listaProductos" name="ventaPedidoForm" indexId="index"> 
                        <tr id="${index}" bgcolor="#c1c1c1">
                                <bean:define id="esfera" type="String">
                                    <bean:write name="productos" property="esfera"/>
                                </bean:define>
                                <bean:define id="cantidad" type="String">
                                    <bean:write name="productos" property="cantidad"/>
                                </bean:define>
                                <bean:define id="cilindro" type="String">
                                    <bean:write name="productos" property="cilindro"/>
                                </bean:define>
                                
                                <bean:define id="diametro" type="String">
                                    <bean:write name="productos" property="diametro"/>
                                </bean:define>
                                <bean:define id="descuento" type="String">
                                    <bean:write name="productos" property="descuento" format="###.####"/>
                                </bean:define>
                                <logic:notEqual property="fecha_graduacion" name="productos" value="">
                                	<bean:define id="graduacionFecha" type="String">
                                    	<bean:write name="productos" property="fecha_graduacion"/>
                                	</bean:define>
                                </logic:notEqual>
                                <logic:equal property="fecha_graduacion" name="productos" value="">
                                	<bean:define id="graduacionFecha" type="String" value="">
                                	</bean:define>
                                </logic:equal>
                                
                                
                                <logic:notEqual property="ojo" name="productos" value="">
                                	<bean:define id="ojo" type="String">
                                    	<bean:write name="productos" property="ojo"/>
                               	 	</bean:define>
                                </logic:notEqual>
                                <logic:equal property="ojo" name="productos" value="">
                                	<bean:define id="ojo" type="String" value="">
                                	</bean:define>
                                </logic:equal>
                                
                                <bean:define id="graduacionNumero" type="String">
                                    <bean:write name="productos" property="numero_graduacion"/>
                                </bean:define>
                                
                                <bean:define id="grupofamilia" type="String">
                                	<bean:write name="productos" property="familia"/>
                                </bean:define>
                                
                                
                                <bean:define id="grupo" type="String">
                                    <bean:write name="productos" property="grupo"/>
                                </bean:define>
                                <bean:define id="codigo" type="String">
                                    <bean:write name="productos" property="codigo"/>
                                </bean:define>
                                 <bean:define id="familia" type="String">
                                    <bean:write name="productos" property="tipoFamilia"/>
                                </bean:define>
								<bean:define id="precio" type="String">
                                    <bean:write name="productos" property="precio"/>
                                </bean:define>
								<bean:define id="subfam" type="String">
                                    <bean:write name="productos" property="subFamilia"/>
                                </bean:define>
                                <bean:define id="liberado" type="String">
                                    <bean:write name="productos" property="liberado"/>
                                </bean:define>
                                <bean:define id="importe" type="String">
                                    <bean:write name="productos" property="importe"/>
                                </bean:define>
                                <logic:present name ="productos" property="promopar">
	                                <bean:define id="promo" type="String">
	                                    <bean:write name="productos" property="promopar"/>
	                                </bean:define>
                                </logic:present>
                                <logic:notPresent name ="productos" property="promopar">
								    <bean:define id="promo" value="null"/>
								</logic:notPresent>
								
					<%-- CODIGO PRODUCTO--%>
							<td id="txt7"  width="70">
	                            <logic:equal value="C" property="tipoFamilia" name="productos">
	                            	<a href="#" name="producto_codigo" class="producto_codigo" data-importe="${importe}" data-estado="${liberado}" data-des="${descuento}" data-barra="${codigo}" data-familia="${familia}" data-grupfam="${grupo}" data-grupo="${grupo}" data-ojo="${ojo}" data-precio="${precio}" data-indice="${index}" 
	                            	 onclick="javascript:seleccionarProductoG('${index}','${esfera}','${cilindro}','${diametro}','${graduacionFecha}','${graduacionNumero}','${ojo}');">
		                            		<bean:write name="productos" property="cod_barra" />
		                            		<input type="hidden" id="cod_barra" value="${codigo}" />
		                            	</a>
		                        </logic:equal>
		                        <logic:notEqual value="C" property="tipoFamilia" name="productos">
		                        	<logic:equal value="L" property="tipoFamilia" name="productos">
	                            		<a href="#" name="producto_codigo" class="producto_codigo" data-importe="${importe}" data-estado="${liberado}" data-barra="${codigo}" data-familia="${familia}" data-grupfam="${grupo}" data-grupo="${grupo}" data-precio="${precio}" data-indice="${index}" data-des="${descuento}" onclick="javascript:seleccionarProductoG('${index}','${esfera}','${cilindro}','${diametro}','${graduacionFecha}','${graduacionNumero}','${ojo}');">
		                            		<bean:write name="productos" property="cod_barra" />
		                            	</a>
		                        	</logic:equal>
		                        	<logic:notEqual value="L" property="tipoFamilia" name="productos">
		                        		<logic:equal value="ARCLI" property="cod_barra" name="productos">
		                            		<a href="#" name="producto_codigo" class="producto_codigo" data-importe="${importe}" data-estado="${liberado}" data-barra="${codigo}" data-familia="${familia}" data-grupfam="${grupo}" data-grupo="${grupo}" data-precio="${precio}" data-indice="${index}" data-promopar="${promo}" data-des="${descuento}" onclick="javascript:seleccionarAdicionalesARCLI('${index}');">
			                            		<bean:write name="productos" property="cod_barra" />
			                            	</a>
		                        		</logic:equal>
		                        		<logic:notEqual value="ARCLI" property="cod_barra" name="productos">

		                            		<a href="#"  name="producto_codigo" class="producto_codigo" data-importe="${importe}" data-estado="${liberado}" data-barra="${codigo}" data-familia="${familia}" data-subfam="${subfam}"  data-grupfam="${grupofamilia}" data-grupo="${grupo}" data-precio="${precio}" data-indice="${index}" data-promopar="${promo}" data-des="${descuento}" onclick="javascript:seleccionarProducto('${index}','${esfera}','${cilindro}','${diametro}');">
		                            		<bean:write name="productos" property="cod_barra" />
		                            		</a>
		                        		</logic:notEqual>

		                            </logic:notEqual>
		                        </logic:notEqual>
                            </td>
                            
					<%-- DESCRIPCION --%>
                            <td id="txt7" width="">
	                            <logic:notEqual value="true" property="descripcion_manual" name="productos">
	                            	<bean:write name="productos" property="descripcion"/>
	                            </logic:notEqual>
	                            <logic:equal value="true" property="descripcion_manual" name="productos">
	                            		<input type="text" name="cantidad" onkeypress="return soloLetras(event)" onblur="actualiza_descripcion('${index}', this)" id="descripcion_manual_${index}" size="45" align="left" class="fto" value='<bean:write name="productos" property="descripcion"/>'/>
	                            </logic:equal>
                            </td>
                            
					<%-- PRECIO IVA --%>
                            <td id="txt7"  width="80">
                            	<bean:write name="productos" property="precio" format="$###,###,###"/>
                            </td>
                            
					<%-- CANTIDAD --%>
                            <td id="txt7"  width="40">
	                            <logic:equal value="true" property="tiene_grupo" name="productos">
	                            		<bean:write name="productos" property="cantidad"/>
	                            </logic:equal>
	                            <logic:notEqual value="true" property="tiene_grupo" name="productos">
	                            	<logic:equal value="MUL" property="familia" name="productos">
	                            		<bean:write name="productos" property="cantidad"/>
	                            	</logic:equal>
	                            	<logic:notEqual value="MUL" property="familia" name="productos">
	                            		<logic:equal value="" property="prevtln" name="productos">
	                            			<input type="text" id="cant_${index}"  onkeypress="return validar_numerico(event)" onblur="actualiza_cantidad('${index}', this)" data-cantidad='${cantidad}' value='${cantidad}' size="2" align="left" class="fto cantidad_lec"/>
	                            		</logic:equal>
	                            		<logic:notEqual value="" property="prevtln" name="productos">
	                            			<bean:write name="productos" property="cantidad"/>
	                            		</logic:notEqual>
	                            	</logic:notEqual>
	                            		
	                            </logic:notEqual>
                            </td>
                            
					<%-- DESCUENTO --%>
                            <td id="txt7"  width="40">
                            	<logic:equal value="MUL" property="familia" name="productos">
                            	    <input type="text" name="descuento"  value='${descuento}' size="2" align="left" class="fto" readonly="true"/>
                            	</logic:equal>
                            	<logic:notEqual value="MUL" property="familia" name="productos">
                            	
                            		<logic:equal value="" property="prevtln" name="productos">
                            			<input type="text" id="descuento_${index}" onblur="actualiza_descuento('${index}', '${descuento}')" value='${descuento}' size="2" align="left" class="fto"  onkeypress="return validar_numerico_decimal(event)" onkeydown="return intercept(event,'${index}', this)" />
	                            	</logic:equal>
	                            	<logic:notEqual value="" property="prevtln" name="productos">
	                            		<input type="text" name="descuento"  value='${descuento}' size="2" align="left" class="fto" readonly="true"/>
	                            	</logic:notEqual>
	                            	
                            	</logic:notEqual>
                            	
                            </td>
                            
					<%-- IMPORTE --%>
                            <td id="txt7"  width="80">
                            	<bean:write name="productos" property="importe" format="$###,###,###"/>
                            </td>
                            
					<%-- GRUPO --%>                            
                            <td id="txt7"  width="40">
                            	<logic:equal value="MUL" property="familia" name="productos">
                            		<html:text property="grupo" styleId="grupotab" size="2" value = '${grupo}' styleClass="fto" readonly="true"/>
                            	</logic:equal>
                            	<logic:notEqual value="MUL" property="familia" name="productos">
                            		<logic:equal value="true" property="tiene_grupo" name="productos">
	                            		 <html:text property="grupo" styleId="grupotab" size="2" value = '${grupo}' styleClass="fto" onblur="verificaNumero(this);actualiza_grupo('${index}')" onkeypress="return validar_numerico(event)"/>
	                            	</logic:equal>
	                            	<logic:notEqual value="true" property="tiene_grupo" name="productos">
										<html:text property="grupo" styleId="grupotab" size="2" value = '${grupo}' styleClass="fto" readonly="true"/>	                            	
									</logic:notEqual>
                            	</logic:notEqual>
                            </td>
                            
					<%-- ESTADO --%>                            
                            <td id="txt7"  width="65">
                            	 <logic:equal value="0" property="liberado" name="productos" ><bean:message key="venta.pedido.vendido"/></logic:equal>
                            	 <logic:equal value="1" property="liberado" name="productos" ><bean:message key="venta.pedido.liberado"/></logic:equal>
                            	 <logic:equal value="2" property="liberado" name="productos" ><bean:message key="venta.pedido.recepcionado"/></logic:equal>
                            </td>
                            
					<%-- TIPO --%>                            
                            <td id="txt7"  width="40">
                            	<logic:equal value="C" property="tipoFamilia" name="productos">
                            		<bean:write name="productos" property="tipo" />
	                        	</logic:equal>
	                        	<logic:notEqual value="C" property="tipoFamilia" name="productos">
		                        	<logic:equal value="L" property="tipoFamilia" name="productos">
	                            		<bean:write name="productos" property="tipo" />
		                        	</logic:equal>
		                        	<logic:notEqual value="L" property="tipoFamilia" name="productos">	
		                            </logic:notEqual>
	                        	</logic:notEqual>
                            </td>
                            
					<%-- TRATAMIENTOS --%>                           
                            <td id="txt7" width="40" align="center">
                            	<logic:equal value="true" property="tiene_suple" name="productos" >
                            		<a href="#" onclick="javascript:seleccionTratamientos('${index}');" >
      									<img src="images/add.png" width="15" height="15" border="0" title="Ver Suplementos" >
    								</a>
    							</logic:equal>
                           	</td>
                           	
					<%-- MULTIOFERTAS --%>   
					<bean:define id="indexMulti" type="String">
                    	<bean:write name="productos" property="indexMulti"/>
                   	</bean:define>                        	
                            <td id="txt7"  align="center"  width="30" >
	                            <logic:equal  name="productos"  property="familia" value="MUL">
	                            	<a href="#" onclick="javascript:busqueda_multioferta('${codigo}','${indexMulti}');" id="enviar">
	      								<img src="images/add.png" width="15" height="15" border="0" title="Buscar MultiOferta" />
	    							</a>
	    							<input type="hidden" name="hayMulti[]"  value="si" id="hayMulti" />
	    						</logic:equal>
    						</td>
    						
    				<%-- ELIMINAR PRODUCTO --%>
                            <td id="txt7"  width="15" align="center">
                            	<logic:equal  name="productos"  property="familia" value="MUL">
	                            	<a href="#" onclick="javascript:eliminarProductoMultioferta('${index}','${indexMulti}');">
	      								<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Producto">
	    							</a>
    							</logic:equal>
    							<logic:notEqual value="MUL" property="familia" name="productos">
    								<a href="#" onclick="javascript:eliminarProducto('${index}');" >
	      								<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Producto">
	    							</a>
	    							<input type="hidden" id="multi"  />
    							</logic:notEqual>
    						</td>
                        </tr>
                    </logic:iterate>
                    </logic:present>
                 </table>
                 </div>
                
        <table width="70%" cellspacing="0" align="center" >
        	<tr>
        		<td colspan="12" id="txt4" bgcolor="#373737" ><bean:message key="venta.pedido.graduacion.articulo"/></td>
        	</tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.esfera"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<html:text property="esfera" styleId="esfera" readonly="true" value="" size="5" styleClass="fto"></html:text>
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.cilindro"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<html:text readonly="true" styleId="cilindro" property="cilindro" value="" size="5" styleClass="fto"/>
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.diametro"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<html:text readonly="true" styleId="diametro" property="diametro" value="" size="5" styleClass="fto"/>
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1" align="right"><bean:message key="venta.pedido.fecha.graduacion"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<input type="text" id="fecha_grad" value="" size="7" class="fto"  readonly="true">
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1"  align="right"><bean:message key="venta.pedido.numero.graduacion"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<input type="text" id="numero_grad" value="" size="3" class="fto"  readonly="true">
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1"  align="right"><bean:message key="liberacion.encargos.ojo" /></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<input type="text" id="ojo2" value="" size="10" class="fto" readonly="true">
		    </td>
		  </tr>
		</table>
		
		<table width="100%" cellspacing="0" align="center">
			<tr>
				<td id="txt4" bgcolor="#373737"><bean:message key="venta.pedido.graduacion"/></td>
				<td id="txt4" bgcolor="#373737" align="right">
    			</td>
    			<td id="txt4" bgcolor="#373737" align="right" width="40">
    				<a href="#" onclick="javascript:detalle('detalle_graduacion')">
      						<img src="images/detalle.png" width="15" height="15" border="0" title="Ocultar / Mostrar detalle">
    				</a>	
				</td>
			</tr>
			</table>
			<div id="detalle_graduacion" style="display:">
			<bean:define id="graduacion_seleccionada" name="ventaPedidoForm" property="graduacion"/>
			<table width="100%" cellspacing="1" cellpadding="1" align="center">
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.fecha"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="fecha"/>' size="6" id="fecha_graduacion" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1"></td>
			    <td id="txt5" bgcolor="#c1c1c1"></td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.esfera"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.cilindro"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.eje"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.adicion"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.esfera.cerca"/></td>
			    <td colspan="2" id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.np"/></td>
			  </tr>
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.orden"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="orden"/>' size="3" id="orden_graduacion" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.o.d"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_esfera"/>' size="3" id="OD_esfera" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_cilindro"/>' size="3" id="OD_cilindro" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_eje"/>' size="3" id="OD_eje" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_adicion"/>' size="3" id="OD_adicion">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_esfera_cerca"/>' size="3" id="OD_esfera_cerca">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_n"/>' size="3" id="OD_n" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_p"/>' size="3" id="OD_p">
			    </td>
			  </tr>
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.doctor"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="doctor"/>' size="15"id="doctor" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.o.i"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_esfera"/>' size="3" id="OI_esfera" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_cilindro"/>' size="3" id="OI_cilindro">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto"  readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_eje"/>' size="3" id="OI_eje">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_adicion"/>' size="3" id="OI_adicion">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_esfera_cerca"/>' size="3" id="OI_esfera_cerca">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_n"/>' size="3" id="OI_n">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_p"/>' size="3" id="OI_p">
			    </td>
			  </tr>
			</table>
			</div>
		<table width="100%" cellspacing="1">
		<tr><td colspan="8" id="txt4" bgcolor="#373737" ><bean:message key="venta.pedido.totales"/></td>
		
		</tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
		    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.subtotal"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.desc"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.porcentaje.descuento"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.total"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.anticipo"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.total.pendiente"/></td>
		  </tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.f.entrega"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<html:text property="fecha_entrega" size="10" name="ventaPedidoForm" styleClass="fto" styleId="popupDatepicker" onchange="cambiaEstadoNOGrabado();"/> 
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1"><html:text property="subTotal" readonly="true" size="10" name="ventaPedidoForm" styleClass="fto" styleId="subTotal"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<bean:define id="dto_total_monto" property="descuento" name="ventaPedidoForm"/>
		    	<input type="text" value="<bean:write name="ventaPedidoForm" property="descuento"/>" size="10"  class="fto" id="dtototal" onblur="actualiza_descuento_total_monto('dtototal', '${dto_total_monto}')" onchange="cambiaEstadoNOGrabado();">
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    		<bean:define id="dto_total" property="dtcoPorcentaje" name="ventaPedidoForm"/>
		    		<input type="text" value='<bean:write name="ventaPedidoForm" property="dtcoPorcentaje"/>' size="10" class="fto" id="%dtototal" onblur="actualiza_descuento_total('%dtototal', '${dto_total}')" onkeypress="return validar_numerico_decimal(event)" onchange="cambiaEstadoNOGrabado();">
		    	</td>
		    <td id="txt5" bgcolor="#c1c1c1"><html:text property="total" size="10" readonly="true" name="ventaPedidoForm" styleClass="fto" styleId="total" /></td>
		    <td id="txt5" bgcolor="#c1c1c1"><html:text property="anticipo_pagado" size="10" readonly="true" name="ventaPedidoForm" styleClass="fto"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><html:text property="totalPendiante" readonly="true" size="10" name="ventaPedidoForm" styleClass="fto" styleId="totalPendiante" /></td>
		  </tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.notas"/></td>
		    <td colspan="7" id="txt5" bgcolor="#c1c1c1" align="left"><html:text property="nota" size="100" name="ventaPedidoForm" styleClass="fto" onchange="cambiaEstadoNOGrabado();" /></td>
		  </tr>
		</table>
	<br>
	</html:form>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script>
		$j.cookie('convenio','0');		
		var pos = -1;
		// BUG SESSION
		$j('#contenido tr').each(function(k){
			if($j.trim($j(this).find('td > a').html()) == "73400037"){
				pos = k;
			}
		});
		
		//BUG SESSION 20141002
		if($j.trim($j("#nombre_clienteDIV").html()) == "" &&  $j.trim($j("#dvnif").val()) == ""){
			borrar_elementos();
		}
				
		var cant = $j.trim($j('#contenido tr:eq('+pos+')').find('td:eq(3)').html());
		var dto  = $j.trim($j('#descuento_'+pos).val());
		var imp  = $j.trim($j('#contenido tr:eq('+pos+')').find('td:eq(5)').html());
		if(cant == "0" && dto == "0" && imp == "$0"){
			eliminarProducto(pos);
		}
			
		$j('#tipo_pedido').on('change',function(){
			$j.cookie('m_modal',"0");
			if($j(this).val() == 'SG'){				
				document.getElementById('encargo_amigo').style.display = 'block';
        		document.getElementById('encargo_amigo').focus();
			}
		});
	 	if($j("#mostrarDev").val()=="true" && $j.cookie('m_modal') != "1"){
	    	showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=historial_encargo&accion=verificar_encargo', 430, 130,null,false);	 
		    $j.cookie('m_modal','1');			    	
	 	}
	 	
	 	//ENCARGO PADRE 
	 
	 	if(($j("#convenio").val()=="51001" || $j("#convenio").val()=="51002") && $j.cookie('m_modal') != "1"){
	    	if($j("#totalPendiante").val() != "0"){
	    		showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=encargo_padre', 430, 130,null,false);	    		
			    $j.cookie('m_modal','1');		    	
			}
	 	}
	 	
    	if(($j("#convenio").val()=="51007" && $j.cookie('m_modal') != "1")){
	    	if($j("#totalPendiante").val() != "0"){
	    		showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=encargo_padre', 430, 130,null,false);	    		
			    $j.cookie('m_modal','1');		    	
			}
	 	}
 	
	 	/*Valido tipo de convenio 20140331*/
	 	/*En monto o % de DTO */
	 	if($j("#convenio").val()!=""){
	 		$j.ajax({
				  type: "POST",
				  url: 'VentaPedido.do?method=valida_tipo_convenio',
				  dataType: "text",
				  data:"convenio="+$j("#convenio").val(),
				  asycn:false,
				  success: function(data){
				  		switch(data){
				  			case "1":
				  				/*DTO DINERO*/
				  				$j("#agregar_prod").addClass("inactivo");	
				  				
				  				/*A PETICION DE CAMILA NO PERMITE AGREGAR  ARCLI O CCLI CON CONVENIO GROUPON
								 *A PETICION DE ISABEL RIVEROS  SE COMENTA 20141127				  				
				  				 */			  				
				  				/*$j('#contenido tr').each(function(k){
									p = $j.trim($j(this).find('td > a').html());
									if(p == "ARCLI" || p == "CCLI"){
										alert("El convenio GROUPON no es aplicable con ARMAZON CLIENTE o CRISTAL CLIENTE.");
										elimina_convenio_sel();
										return false;
									}			
								});*/	
										  				 												  								  					
				  			break;				  			
				  			case "2":
				  				/*DTO PORCENTAJE*/
				  				$j("#agregar_prod").removeClass("inactivo");
				  			break;
				  			case "0":
				  				//alert("El convenio no está vigente.");
				  			break;
				  			default:
				  				alert("Problema con el convenio");
				  			break;				  			
				  		}													  												  		
			 	  }
		 	});
		 }
		
		
	 	 //LMARIN 20180423 - METODO QUE AGREGA EL SEGUNDO CRISTAL EN FUNCION DE LA DIOPTRIA DEL OJO
		 if($j("#seg_cristal").val() !="" &&  $j.cookie('seg_arm') =="2"){
			 
		 		var seg_cristal = $j("#seg_cristal").val().split(",");
		 		var ojo = seg_cristal[2] == "derecho"?"izquierdo":
		 				  seg_cristal[2] == "izquierdo"?"derecho":"derecho";		
		 		//console.log("ojos =====>"+seg_cristal[0]+","+seg_cristal[1]+","+ojo+","+seg_cristal[3]);
		 		//2629000210002,1,izquierdo,Lejos
		 		//var prodtmp = new Array(seg_cristal[0],seg_cristal[1],ojo,seg_cristal[3]);	
		 		
		 		var eje = 0.0;
		 		var esfera = 0.0;
		 		var cilindro= 0;
		 		
		 		if(ojo == "izquierdo"){
		 			cilindro  = parseFloat($j("#OI_cilindro").val());
		 			esfera = parseFloat($j("#OI_esfera").val());
		 			eje =  parseInt($j("#OI_eje").val()) ;
		 		}else{
		 			cilindro  = parseFloat($j("#OD_cilindro").val());
		 			esfera =  parseFloat($j("#OD_esfera").val());
		 			eje =  parseInt($j("#OI_eje").val());
		 		}
		 	 
		 		if(cilindro < 0){
		 			esfera = esfera + cilindro;
		 			cilindro = Math.abs(cilindro);
		 			if (eje >= 0 && eje <=90) {
		 				eje = eje + 90;
		 			}
		 			else if(eje >= 91 && eje <=180)
		 			{
		 				eje = eje - 90;
		 			}
		 		}
		 		
		 	   var res = encodeURIComponent(seg_cristal[0].replace("+",".")+","+ojo+","+seg_cristal[3]+","+cilindro+","+esfera+","+eje);
		 	
		 	   
	 		   $j.ajax({
					  type: "POST",
					  url: 'VentaPedido.do?method=valida_seg_cris',
					  dataType: "text",
					  data:"segCris="+res,
					  asycn:false,
					  success: function(data){
						  //console.log("data =====>"+data);
		 					if(data !="0"){	
		 						var prodtmp = new Array(data,seg_cristal[1],ojo,seg_cristal[3]);	
						 	   	if($j.cookie("cris_esp")=="1"){
						 	   		if($j.cookie("cris_esp_seg") =="1"){
						 				cargaProducto(prodtmp);
						 				$j.cookie('seg_arm','0');
						 				$j.cookie("cris_esp_seg","0");
						 				$j.cookie('codbarra','');
						 			}	
						 		}else{
						 			
						 			cargaProducto(prodtmp);
						 			$j.cookie('seg_arm','0');
						 			$j.cookie("cris_esp_seg","0");
						 			$j.cookie('codbarra','');
						 		}
		 					}else{
		 						alert("No hay cristales de la misma familia para la dioptria del ojo "+ojo+".");
		 						$j.cookie('seg_arm','0');
					 			$j.cookie('codbarra','');
		 					}
					  }
	 		    });

		 }
		 
		 //DESC LEC + SOC
		 if($j("#convenio").val()!=""){
	 		$j(".cantidad_lec").addClass("inactivo").attr("readonly",true);
	 		$j(".cantidad_lec").on("click",function(){
	 			if($j(".cantidad_lec").hasClass("inactivo") == true){
	 				alert("Debes eliminar el convenio asociado para modificar la cantidad de productos");
	 			}
	 		});
		 }else{
		 	$j(".cantidad_lec").removeClass("inactivo").attr("readonly",false);
		 }
		 
		 
		 $j("#busca_multi").on("click",function(){
		 	showPopWin('<%=request.getContextPath()%>/BusquedaProductos.do?method=busquedaMultiofertaAsoc&accion=carga', 400, 200,null,false);	
		 });
		 
		
		 function borrar_elementos(){
		 
			 var mul = new Array();
			 var c = 0;
			 //SELECCIONO POSICIONES QUE NO TIENEN MULTIOFERTAS
		 	 $j("#contenido tr").each(function(a){
	 	   		if($j(this).find("td > a").attr("data-familia") != "O"){
	 	   			mul[c] = a;
	 	   			c++
	 	   		}	 	   		
	 	   	 });
	 	   	 if(mul.length > 0){
		 	   	 //ORDENO DECREMENTALMENTE EL ARREGLO	 	 
		 	   	 mul.sort(function(a,b){return b-a});
		 	   	 		 	   	 
			 	 document.getElementById('productoSeleccionado').value = mul.join();
	        	 document.getElementById('accion').value = "eliminarProducto";			         					         					         
	        	 document.ventaPedidoForm.submit();			
        	 }
	 	}	 	  	 		 	  	 	
		
 	    //DESCUENTO SEG GAFA DE SOL
 	    //&& $j.cookie("des_seg_armazon")== "777"
 	    if($j("#convenio").val() =="51004000000" && $j.cookie("des_seg_armazon")!= "777" ){
	 	    
	 	    	var pos = new Array();
	 	    	var posrev = new Array();
	 	    	var sumarr = new Array();
	 	    	var c= 0;
	 	    	
	 	    	
	 	    	var sumgrupo1 =0;
	 	    	var sumgrupo2 =0;
	 	    	var sumgrupo3 =0;
	 	    	var sumgrupo4 =0;
	 	    	var sumgrupo5 =0;
	 	    	
	 		   	var sumarr = new Array();
	 		   	var paso = 0;
	 		   	
	 			var arm_arr = new Array();
	 		   	var paso = 0;
		 		   	
		 		   	
		 		   	
	 		    $j("#contenido tr").each(function(a){
	 			   
	 				var familia  = 	$j(this).find("td > a").attr("data-familia");
    			    var grupo = parseInt($j(this).find("td > a").attr("data-grupo"));
    			    if((familia == "G" || familia=="M")){
    			    	arm_arr[a] = $j(this).find("td > a").attr("data-barra"); 
    			    	//$j(this).find("td > a").attr("data-barra")+"-";
    			    	a++;
    			    }    			        			   	 		   		
	 		    });
	 		   
	 		    arm_arr.clean(undefined);
		 		   
	 		    $j.ajax({
					  type: "POST",
					  url: 'VentaPedido.do?method=valida_promo_pares',
					  dataType: "text",
					  data:"valor_comodin="+arm_arr,
					  asycn:false,
					  success: function(data){
						  
					  		var temp = data.split("_");
						    if(parseInt(temp[1]) >= 2 ){
						    	
						    
						    		$j("#contenido tr").each(function(a){
						    			var grupo = parseInt($j(this).find("td > a").attr("data-grupo"));	
						 	    	    if(grupo == 1){
						 	    			sumgrupo1 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo1;
						 	    			
						 	    		}else if(grupo == 2){
						 	    			sumgrupo2 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo2;
						 	    
						 	    		}else if(grupo == 3){
						 	    			sumgrupo3 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo3;
						 	    		
						 	    		}else if(grupo == 4){
						 	    			sumgrupo4 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo4;
						 	    			
						 	    		}else if(grupo == 5){
						 	    			sumgrupo5 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo5;
						 	    	
						 	    		}
							
						 	    	});
						 	    
						 	    
						 	    	$j("#contenido tr").each(function(a){
						 		         	//comento para permitir solo SOP
						 		         	var grupofam = 	$j(this).find("td > a").attr("data-grupfam");
						 		         	var familia  = 	$j(this).find("td > a").attr("data-familia");
						 		         	var precio = $j(this).find("td > a").attr("data-precio");	
						    			    var promo = $j(this).find("td > a").attr("data-promopar");	
						    			    var grupo = parseInt($j(this).find("td > a").attr("data-grupo"));	
						    			    var indice = $j(this).find("td > a").attr("data-indice");	
						 		         	if( familia =="G" || grupofam =="MUL" ){
						 		         		pos[c]  = precio+"."+grupo+indice;    		    			
						 		    			c++;
						 		         	}
						 		         	if( familia =="M"){
						 		         		pos[c]  = sumarr[grupo]+"."+grupo+indice;    		    			
						 		    			c++;
						 		         	}
						 		    	 	
						 		    });
						 	    	
						 	    	
									pos.sort(function(a,b){return b-a});
					 			 	
					 			   
					 			 	var posdesc = pos[pos.length-1].split(".");
					 			 	
						 	    	document.getElementById('numero_cupon').value = temp[0]+"_"+posdesc[1];
						 	    	document.getElementById('accion').value = "aplica_dtopromopar";
						            document.ventaPedidoForm.submit();
						            
						            $j.cookie("des_seg_armazon","777");
					  		}
					  }
	 		    });
	 	    	
         }		
 	    
 	  
		             	
        //MUESTRO O ESCONDO boton de multiofertas
        var cprod = new Array();
        $j("#contenido tr").each(function(a){
       		var familia = $j(this,window.parent.document).find("td > a").attr("data-familia");
       		if(familia != ""){
        		cprod[a]= familia;
        	}
        	a++;
        });  
        
        if(cprod.length > 0){
        	$j("#busca_multi").css("display","block");
        }else{
        	$j("#busca_multi").css("display","none");
        }  	
       
       //CONVENIO CRUZ BLANCA
       if($j.cookie("abre_convenio") != "" && $j("#nombre_clienteDIV").val() != "" && cprod.length > 0){
      		buscarConvenioAjax();
      		$j.cookie("abre_convenio","");
       }
       if($j.cookie("elimina_cliente_dto") != "" && $j("#nombre_clienteDIV").val() != "" && cprod.length > 0){       
       		ingresa_pedido();
       		$j.cookie("elimina_cliente_dto","");
       		$j("#cliente_dto").val() =="";
       }
      
      
      function dtomofercombo() {
	 	    
        //20150327 DTO COMBOS MULTIOFERTA
      	   var arr = new Array();
      	   var sumofer = new Array();
      	   var arrin = new Array();
      	   var cant = new Array();
	
	              
	       $j("#contenido tr").each(function(a){
	       		var familia  = $j(this).find("td > a").attr("data-grupfam");
	       		var indice 	 = $j(this).find("td > a").attr("data-indice");
	       		var articulo = $j(this).find("td > a").attr("data-barra");
	       		var precio = $j.trim($j(this).find("td > a").attr("data-precio"));
	       		if(familia == "MUL"){
					arr[a]= articulo;
					sumofer[a] = precio;
					arrin[a] = indice;
	        	}
	        	cant[a] = a;
	        	a++;
	        });
	       
	        //Ordeno y saco los duplicados
	        var sorted_arr = arr.sort();
	              
			var results = [];
			
			for (var i = 0; i < arr.length - 1; i++) {
			    if (sorted_arr[i + 1] == sorted_arr[i]) {
			        results.push(sorted_arr[i]);
			    }
			}
			
		
			
			if(results != "" && results != null ){
				
					var sumtmp = 0
					
					sumofer = $j.grep(sumofer,function(n){ return(n) });
					
					var sumtmp = parseInt(sumofer[0]) + parseInt(sumofer[1]);
					
					var porf = 0; 
					
					results = $j.grep(results,function(n){ return(n) });
					
					arrin = $j.grep(arrin,function(n){ return(n) });
					
					
					var total = $j("#total").val();
					
					$j.ajax({
						  type: "POST",
						  url: 'VentaPedido.do?method=trae_descuento_mofercombos',
						  dataType: "text",
						  data:"cdg_mofercombo="+results,
						  asycn:false,
						  success: function(data){
								if(data != "0"){
									
									sumajax = ((parseInt(total)-parseInt(sumtmp)) + parseInt(data));
									
									tmp1 = (parseInt(total) - parseInt(sumajax));
									tmp2 = (parseInt(total)-parseInt(sumtmp));
									
									por = parseInt(tmp1)*100/parseInt(sumtmp);
									
									porf = por.toFixed(5);								
								
									dtomarin(arrin[0]+"_"+arrin[1],porf);								
								}	
						  }													  												  					 	  
			 		});		
			 	}	
		
			
 	   }
       
       function dtomarin(index,dto){       
			document.getElementById('accion').value = "descuento_linea";
			document.getElementById('productoSeleccionado').value = index;
			document.getElementById('cantidad_descuento').value = dto.replace(',','.');	
			document.ventaPedidoForm.submit();			
	   }
       
       function postValida_cupon(){
    	   document.getElementById('accion').value = "aplica_cupon";
    	   document.ventaPedidoForm.submit();
       }
	   
	  //LMARIN - 20150429 LOGO DE PROMOCIONES
	   if(typeof($j("#promocion").val()) != "undefined" || $j("#promocion").val() != null ){	
	  	 if($j("#promocion").val() =="LAN1"){
   			$j("#img_logo_promo").css("background-image","url(images/lan.png)"); 
	  	 }else{
	  	 	$j("#img_logo_promo").css("background-image","url('')"); 
	  	 }
	  }
	  
	  $j("#cliente_generico").on("click",function(){
		  $j("#nif").val("66666666"); 
		  buscarClienteAjax();
	  });
	  
	  //Valido cliente valido 
	  if($j("#nif").val()!=""){
		  if(val_rut.test($j("#nif").val())== false){
		  	 alert("El rut del cliente es incorrecto, debes crear nuevamente al cliente.");
		     location.href = '<%=request.getContextPath()%>/Cliente.do?method=cargaFormulario';	  	 
		  }
	  }
	  $j('#tipo_pedido').on('change',function(){
			if($j(this).val() == 'SEG'){				
				$j('#encargo_seguro').css("display","block");
        		
			}
	  });
	  
	  //LOGICA CUPON
	  $j('#cupon').on('click',function(){
		 c = 0;
		 $j("#contenido tr").each(function(a){
	      	   var articulo = $j(this).find("td > a").attr("data-barra");
	           if(articulo != ""){
					c++;
	       	   }
	     });
		 if(c > 0){
		   showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=abre_valida_cupon', 300, 130,null,false);	   
		 }else{
			 alert("Debes agregar articulos para usar cupones de DTO.");
		 }
	  });
	 
	  $j("#promocion").on("change",function(){
		  if($j(this).val() == "PCOM"){
			 $j("#contenido tr").each(function(a){
		      	   var codigo = $j(this).find("td > a").attr("data-barra");
		      	   var fam = $j(this).find("td > a").attr("data-familia");
		      	   
		           if(fam =="M" ){
		        	   
		        	   $j.ajax({
							  type: "POST",
							  url: 'VentaPedido.do?method=valida_promocombo',
							  dataType: "text",
							  data:"numero_cupon="+codigo,
							  asycn:false,
							  success: function(data){
								 switch(data){
									case "1":
										document.getElementById('accion').value = "aplica_dtocombo";
							            document.ventaPedidoForm.submit();
									break;
									case "2":
										alert("El armazon no esta en la promocion, no se puede aplicar el descuento.");	
									break;
									default:	
										alert("No se puede aplicar la promocion.(G)");													  												  					 	  
							  		break;
							  	 }
							 }
				 		});		
		       	   }
		     });
			 
		  }else if($j(this).val() == "PPAR"){
				var pos = new Array();
	 	    	var posrev = new Array();
	 	    	var sumarr = new Array();
	 	    	var c= 0;
	 	    	
	 	    	
	 	    	var sumgrupo1 =0;
	 	    	var sumgrupo2 =0;
	 	    	var sumgrupo3 =0;
	 	    	var sumgrupo4 =0;
	 	    	var sumgrupo5 =0;
	 	    	
	 		   	var sumarr = new Array();
	 		   	var paso = 0;
	 		   	
	 			var arm_arr = new Array();
	 		   	var paso = 0;
		 		   	 		   	
	 		    $j("#contenido tr").each(function(a){
	 			   
	 				var familia  = 	$j(this).find("td > a").attr("data-familia");
    			    var grupo = parseInt($j(this).find("td > a").attr("data-grupo"));
    			    var grupfam = $j(this).find("td > a").attr("data-grupfam");
    			    if((familia == "G" || familia=="M" || grupfam =="MUL")){
    			    	arm_arr[a] = $j(this).find("td > a").attr("data-barra"); 
    			    	//$j(this).find("td > a").attr("data-barra")+"-";
    			    	a++;
    			    }    			        			   	 		   		
	 		    });
	 		   
	 		    arm_arr.clean(undefined);
		 		   
	 		    $j.ajax({
					  type: "POST",
					  url: 'VentaPedido.do?method=valida_promo_pares',
					  dataType: "text",
					  data:"valor_comodin="+arm_arr,
					  asycn:false,
					  success: function(data){
						  
					  		var temp = data.split("_");
						    if(parseInt(temp[1]) >= 2 ){
						    	
						    
						    		$j("#contenido tr").each(function(a){
						    			var grupo = parseInt($j(this).find("td > a").attr("data-grupo"));	
						 	    	    if(grupo == 1){
						 	    			sumgrupo1 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo1;
						 	    			
						 	    		}else if(grupo == 2){
						 	    			sumgrupo2 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo2;
						 	    
						 	    		}else if(grupo == 3){
						 	    			sumgrupo3 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo3;
						 	    		
						 	    		}else if(grupo == 4){
						 	    			sumgrupo4 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo4;
						 	    			
						 	    		}else if(grupo == 5){
						 	    			sumgrupo5 +=  parseInt($j(this).find("td > a").attr("data-precio"));
						 	    			sumarr[grupo] = sumgrupo5;
						 	    	
						 	    		}
							
						 	    	});
						 	    
						 	    
						 	    	$j("#contenido tr").each(function(a){
						 		         	//comento para permitir solo SOP
						 		         	var grupofam = 	$j(this).find("td > a").attr("data-grupfam");
						 		         	var familia  = 	$j(this).find("td > a").attr("data-familia");
						 		         	var precio = $j(this).find("td > a").attr("data-precio");	
						    			    var promo = $j(this).find("td > a").attr("data-promopar");	
						    			    var grupo = parseInt($j(this).find("td > a").attr("data-grupo"));	
						    			    var indice = $j(this).find("td > a").attr("data-indice");	
						 		         	if( familia =="G" || grupofam =="MUL" ){
						 		         		pos[c]  = precio+"."+grupo+indice;    		    			
						 		    			c++;
						 		         	}
						 		         	if( familia =="M"){
						 		         		pos[c]  = sumarr[grupo]+"."+grupo+indice;    		    			
						 		    			c++;
						 		         	}
						 		    	 	
						 		    });
						 	    	
						 	    	
									pos.sort(function(a,b){return b-a});
					 			 	
					 			 	var posdesc = pos[pos.length-1].split(".");
					 			 	

					 			 	
						 	    	document.getElementById('numero_cupon').value = temp[0]+"_"+posdesc[1];
						 	    	document.getElementById('accion').value = "aplica_dtopromopar";
						            document.ventaPedidoForm.submit();
						            
						            $j.cookie("des_seg_armazon","777");
						    }
							 /* }else{
								  alert("Promoción no aplicable a los productos seleccionados.");
							  }*/
						  }
	 		    	});
		  
		  }else{
			  document.getElementById('accion').value = "aplica_descuento_promocion";
    		  document.ventaPedidoForm.submit();
		  }
	  });
	  
	  
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
	  if(totalencargo == 0 && sumdes == (100 * cprod) && liberado == 0 && sumimpor == 0 && cprod >= 3 && codigoped.length){
			
		  	//alert("PASO GARANTIALIB INTRO");
		  	
		  	//LLAMO AL METODO QUE LIBERA
			$j.ajax({
					  type: "POST",
					  url: 'VentaPedido.do?method=garantiaLib',
					  dataType: "text",
					  data:"valor_comodin="+0,
					  asycn:false,
					  success: function(data){
						  if(data == "true"){
								//document.getElementById('accion').value = "cargaPedidoSeleccion";
								//document.ventaPedidoForm.submit();
								
						  }
					  }
			});
			
	  }
	 
	</script>
</body>
</html:html>


