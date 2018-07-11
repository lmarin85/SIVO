
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/prototype.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>			
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/jquery.datepick.js"></script>
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
        <script type="text/javascript" src="js/venta/presupuesto.js"></script> 
         <script type="text/javascript">
         load();
         
         var $j = jQuery.noConflict();
        
        $j(function() {
			$j('#popupDatepicker').datepick();
			});
        
         function eliminar_Presupuesto()
		{
			if (estado != "cerrado") 
			{
				if (confirm("ALERTA!! va a proceder a eliminar este registro, si desea eliminarlo de click en ACEPTAR\n de lo contrario de click en CANCELAR."))
				{
					document.presupuestoForm.action = '<%=request.getContextPath()%>/Presupuesto.do?method=eliminarPresupuesto';
        			document.presupuestoForm.submit();
				}
        	}
        	else
		    {
		      	alert("No se puede eliminar, presupuesto esta cerrado");
		    }
		}
		function busquedaAvanzada()
      	{
      		var flujo_form = flujo;
      		showPopWin("<%=request.getContextPath()%>/BusquedaPresupuestos.do?method=carga_formulario&flujo="+flujo_form , 714, 425,cargaPresupuestoSeleccionado, false);
      	}
		
		function controlTab(event)
		{
			var e = window.event;
			alert(e.keyCode);
			if (e.keyCode == 9) {
				return false;
			}
			else
			{
				return true;
			}
			
		}
         function traspasarPedido()
		{
			if (estado != "cerrado") 
			{
				if (confirm("Esta seguro que desea traspasar el Presupuesto a un Encargo")) {
					document.presupuestoForm.action = '<%=request.getContextPath()%>/Presupuesto.do?method=traspasoPedido';
	        		document.presupuestoForm.submit();
				}
			}
			else
			{
				alert("Este presupuesto, ya ha sido transferido a Encargo");
			}
			
		}
		
         function cargaPresupuesto(presupuesto)
			{
				document.presupuestoForm.action = "<%=request.getContextPath()%>/Presupuesto.do?method=cargaPresupuestos&Presupuesto=" + presupuesto;
				document.getElementById('accion').value = "seleccionaPresupuesto";
        		document.presupuestoForm.submit();
			}
			
        function nuevo_Presupuesto()
        	{
        		document.presupuestoForm.action = '<%=request.getContextPath()%>/Presupuesto.do?method=nuevoFormulario';
        		document.presupuestoForm.submit();
        	}
        	
        function busqueda_producto()
            {
            	if (flujo != "formulario") 
				{
	            	if (estado != "cerrado") 
	            	{
	            		if(document.presupuestoForm.cliente.value != "" && document.presupuestoForm.cliente.value != "0")
		            	{
		            		showPopWin('<%=request.getContextPath()%>/BusquedaProductos.do?method=cargaBusquedaProductos&formulario=PRESUPUESTO', 710, 380, cargaProducto, false);
		            	}
		            	else
		            	{
		            		alert("Debe seleccionar un cliente, para agregar articulos");
		            	}
					}
					else
					{
						alert("No se puede agregar productos, presupuesto esta cerrado");
					}
				}
				else
				{
					alert("No hay ventas en proceso");
				}
            	
				
            } 
            
       function busqueda_cliente()
			{		
				if (estado != "cerrado") 
				{
					showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&pagina=pedido", 714, 425,cargaClientePedido, false);
				}
				else
				{
					alert("No se pueden agregar modificar cliente, presupuesto esta cerrado");
				}					
				
			}
			
	function lista_detalles()
			{	
				var cliente = document.getElementById("cliente").value;
				
				showPopWin("<%=request.getContextPath()%>/Presupuesto.do?method=cargaPresupuestos&cliente="+cliente, 714, 425,cargaPresupuesto, false);
			}
	function imprimir()
			{
				if (document.getElementById("codigo_presupuesto").value != "") {
					var voucher;
        			voucher = window.open("<%=request.getContextPath()%>/CreaPresupuestoServlet");   
				}
				else
				{
					alert("Debe guardar el presupuesto, para poder imprimirlo.");
				}
			}
			
	function cerrar_venta()
        	{
				
	        		var estaGrabado = document.getElementById('estaGrabado').value;
        			var boton = false;
        			if(estaGrabado == 0){
        				boton = confirm("¿Desea salir de la página actual sin guardar?");
        			}else{
        				boton = confirm("¿Está seguro de salir de la página actual?");
        			}
					
	        		if (boton)
	        		{
	        			parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
	        		}
	        		else
	        		{
	        			self.close();
	        		}      
        	}
        	
        	function buscarClienteAjax(){
	 			document.getElementById("nombre_clienteDIV").innerHTML="";
				var nif = document.getElementById("nif").value;			
				if("" != nif){			
					document.getElementById("nif").value = "Buscando...";
					new Ajax.Request('<html:rewrite page="/Presupuesto.do?method=buscarClienteAjax"/>', {
					      parameters: {nif: nif, pagina: "presupuesto"},      
					      onComplete: function(transport, json) {
					      if("" != json.codigo_cliente && "" != json.nif){
					      		var miArray = new Array(10);
						      	document.getElementById("nif").value = json.nif;		
						      	document.getElementById("dvnif").value = json.dvnif;
						      	document.getElementById("nombre_cliente").value = json.nombre_cliente;
						      	document.getElementById("cliente").value = json.codigo_cliente;
						      	document.getElementById("nombre_clienteDIV").innerHTML= json.nombre_cliente;
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
					   });
				   }else{
				   	alert("Debe ingresar rut de cliente");
				   }
				   
		}
		
		function buscarConvenioAjax()
		{
			if (estado != "cerrado") 
				{
								var convenio = document.presupuestoForm.convenio.value;
						 		if ("" != convenio) 
						 		{
									document.presupuestoForm.convenio_det.value = 'Buscando......';
									new Ajax.Request('<html:rewrite page="/BusquedaConvenios.do?method=buscarConvenioAjax"/>', {
									parameters: {convenio: convenio},
									onComplete: function(transport, obj_convenio)
										{
											document.presupuestoForm.convenio_det.value = obj_convenio.descripcion;
											
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
					alert("No se pueden modificar convenio, presupuesto esta cerrado");
				}
		}
		function devuelve_descuento_ln(valores)
	 	{
	 		document.presupuestoForm.forma_pago.value = valores[0];
	 		document.presupuestoForm.convenio.value = valores[2];
	 		if("" != valores[3])
	 		{
	 			document.presupuestoForm.convenio_det.value = valores[3];
	 		}
	 		document.presupuestoForm.convenio_ln.value = valores[4];
	 		document.getElementById('accion').value = "cambio_convenio";
        	document.presupuestoForm.submit();
	 	}
	 	
	 	function busqueda_convenio_avanzada()
	 	{
	 		if (estado != "cerrado") 
				{
	 				showPopWin('<%=request.getContextPath()%>/BusquedaConvenios.do?method=cargaBusquedaConvenios', 710, 380, devuelve_descuento_ln, false);
	 			}else
	 			{
	 				alert("No se pueden modificar convenio, presupuesto esta cerrado");
	 			}
	 	}
	 	function actualiza_descuento_total(campo_name, original)
    	{
    		var campo = document.getElementById(campo_name).value;
    		
    		if (parseFloat(original) > 0) 
    		{
    		
				if (estado == "cerrado") 
			{
				alert("El presupuesto esta cerrado, no es posible modificar productos");
			}	
			else
			{			
						var comparacion = parseFloat(campo) >= 0 && parseFloat(campo) <= 100;
						if (comparacion) 
						{		
							var descuento_max = document.getElementById('descuento_max').value;
							var comparacion = parseFloat(campo) <= parseFloat(descuento_max);
							if (comparacion) 
							{
								document.getElementById('accion').value = "descuento_total";
					        	document.getElementById('cantidad_descuento').value = campo.replace(',','.');;
					        	document.presupuestoForm.submit();
					        	
							} else 
							{
									descuento = campo;
									var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo=0";	
									showPopWin(url, 690, 130, devuelve_descuento_total, false);
									
							}
						}
						else
						{
							alert("Valor debe estar entre 0 y 100");
							document.getElementById(campo_name).value = original;
						}
		         }
			         
			}
			else
			{
				if (parseFloat(campo) > 0) 
				{
					if (estado == "cerrado") 
			{
				alert("El presupuesto esta cerrado, no es posible modificar productos");
			}	
			else
			{			
						var comparacion = parseFloat(campo) >= 0 && parseFloat(campo) <= 100;
						if (comparacion) 
						{		
							var descuento_max = document.getElementById('descuento_max').value;
							var comparacion = parseFloat(campo) <= parseFloat(descuento_max);
							if (comparacion) 
							{
								document.getElementById('accion').value = "descuento_total";
					        	document.getElementById('cantidad_descuento').value = campo.replace(',','.');;
					        	document.presupuestoForm.submit();
					        	
							} else 
							{
									descuento = campo;
									var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo=0";	
									showPopWin(url, 690, 130, devuelve_descuento_total, false);
									
							}
						}
						else
						{
							alert("Valor debe estar entre 0 y 100");
							document.getElementById(campo_name).value = original;
						}
		         }
				 }
	 		}
			
	 	}
	 	
	 	function actualiza_descuento_total_monto(campo_name, original)
    	{
    		
    		var campo = document.getElementById(campo_name).value;
    		
    		//SACA EL PORCENTAJE APROX DEL TOTAL PARA CONSULTAR POR EL AUTORIZADOR
    		var dto = "";
    		var total = document.getElementById('subTotal').value;
    		dto =  (parseFloat(campo) * 100) / parseFloat(total);
    		
    		if (parseFloat(original) > 0) 
    		{
    		
				if (estado == "cerrado") 
				{
					alert("El presupuesto esta cerrado, no es posible modificar productos");
				}	
				else
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
								    document.presupuestoForm.submit();
						        	
								}
								else 
								{
										descuento = campo; 
										descuento_porc = dto;
										
										var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo=0";	
										showPopWin(url, 690, 130, devuelve_descuento_total_monto, false);
										
								}
							}
							else
							{
								alert("Valor no puede ser mayor al monto total");
								document.getElementById(campo_name).value = original;
							}
			         }
			         
			}
			else
			{
				if (parseFloat(campo) > 0) 
				{
					if (estado == "cerrado") 
					{
						alert("El presupuesto esta cerrado, no es posible modificar productos");
					}	
					else
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
									    document.presupuestoForm.submit();
							        	
									}
									else 
									{
											descuento = campo; 
											descuento_porc = dto;
											
											var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo=0";	
											showPopWin(url, 690, 130, devuelve_descuento_total_monto, false);
											
									}
								}
								else
								{
									alert("Valor no puede ser mayor al monto total");
									document.getElementById(campo_name).value = original;
								}
				     }
				 }
	 		}
	 	}
	 	
	 	
	 	
       	function devuelve_descuento_ln(valores)
	 	{
	 		document.presupuestoForm.forma_pago.value = valores[0];
	 		document.presupuestoForm.convenio.value = valores[2];
	 		if("" != valores[3])
	 		{
	 			document.presupuestoForm.convenio_det.value = valores[3];
	 		}
	 		document.presupuestoForm.convenio_ln.value = valores[4];
	 		document.getElementById('accion').value = "cambio_convenio";
        	document.presupuestoForm.submit();
	 	}
	 	function elimina_convenio_sel()
	 	{
	 		document.getElementById('accion').value = "elimina_convenio";
			document.presupuestoForm.submit();
	 	}
	 	
	 	function actualiza_descuento(index, original)
    	{
    		
    		var campo = document.getElementById("descuento_" + index).value;
			if (estado == "cerrado") 
			{
				alert("El presupuesto esta cerrado, no es posible modificar productos");
			}	
			else
			{				
						var comparacion = parseFloat(campo) >= 0 && parseFloat(campo) <= 100;
						if (comparacion) 
						{	
							var descuento_max = document.getElementById('descuento_max').value;
							var comparacion = parseFloat(campo) <= parseFloat(descuento_max);
							if (comparacion) 
							{
								
								document.getElementById('accion').value = "descuento_linea";
					        	document.getElementById('productoSeleccionado').value = index;
					        	document.getElementById('cantidad_descuento').value = campo.replace(',','.');;
					        	document.presupuestoForm.submit();
					        	
							} else 
							{
									indice = index;
									descuento = campo;
									var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento&tipo=0";
									showPopWin(url, 690, 130, devuelve_descuento, false);
									
							}
						}
						else
						{
							alert("Valor debe estar entre 0 y 100");
							document.getElementById("descuento_" + index).value = original;
						}
		         }
	 	}
   </script>
                <title><bean:message key="title.pos"/></title>
        
    </head>
    <bean:define id="estado" type="String">
		<bean:write property="estado" name="presupuestoForm"/>
	</bean:define>
	<bean:define id="error" type="String">
		<bean:write property="error" name="presupuestoForm"/>
	</bean:define>
	<bean:define id="flujo" type="String">
		<bean:write property="flujo" name="presupuestoForm"/>
	</bean:define>
	
	
	
    <body  onload="javascript:estado_venta('${flujo}', '${estado}', '${error}');if(history.length>0)history.go(+1)" >
		<div id="pagina">
        <html:form action="/Presupuesto?method=IngresaPresupuesto" styleId="form1">
            <html:hidden property="addProducto" onfocus="cargaProducto()" styleId="productoSeleccionado"/>
            <html:hidden property="cliente" name="presupuestoForm"  styleId="cliente" />
            <html:hidden property="cantidad" value="" styleId="cantidad"/>
            <html:hidden property="cantidad_descuento" value="" styleId="cantidad_descuento"/>
            <html:hidden property="cantidad_linea" value="" styleId="cantidad_linea"/>
            <html:hidden property="ojo" value="" styleId="ojo" name="presupuestoForm"/>
            <html:hidden property="tipo" value="" styleId="tipo" name="presupuestoForm"/>
            <html:hidden property="accion" value="" styleId="accion" name="presupuestoForm"/>
            <html:hidden property="descripcion" value="" styleId="descripcion"/>
            <html:hidden property="nombre_cliente"  styleId="nombre" />
            <html:hidden property="convenio_ln" styleId="convenio_ln" name="presupuestoForm"/>
            <html:hidden property="descuento_autoriza" styleId="descuento_autoriza" name="presupuestoForm"/>
            <html:hidden property="porcentaje_descuento_max" styleId="descuento_max" name="presupuestoForm"/>           
            <html:hidden property="estaGrabado" styleId="estaGrabado" />
            
            <table width="100%" cellspacing="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="presupuesto.presupuesto"/></td>
              	<logic:equal value="formulario" name="presupuestoForm" property="flujo">
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#"	onclick="nuevo_Presupuesto()">
						 <img src="images/nuevo.png" width="20" height="20"	border="0" title="Nuevo Presupuesto">
					</a>
    			</td> 
    			</logic:equal>
    			<logic:notEqual value="formulario" name="presupuestoForm" property="flujo">
    			<td align="right" bgcolor="#373737" id="txt4" width="30">
              		<a href="#"	onclick="imprimir()">
						 <img src="images/printer.png" width="20" height="20"	border="0" title="Imprimir Presupuesto">
					</a>
    			</td> 
    			</logic:notEqual>
    			<logic:equal value="modificar" name="presupuestoForm" property="flujo">
    			<td align="right" bgcolor="#373737" id="txt4" width="30">
              		<a href="#"	onclick="eliminar_Presupuesto()">
						 <img src="images/delete.png" width="20" height="20"	border="0" title="Eliminar Presupuesto">
					</a>
    			</td>
    			</logic:equal>
    			<td align="right" bgcolor="#373737" id="txt4" width="30">
              		<a href="#" onclick="busquedaAvanzada()">
      						 <img src="images/lupa.png" width="18" height="15"	border="0" title="Busqueda Avanzada Presupuestos">
    				</a>
    			</td>
    			<td align="right" width="30"  bgcolor="#373737" id="txt4">
    				<a href="#"	onclick="lista_detalles()">
						 <img src="images/lista.png" width="18" height="15"	border="0" title="Listar Presupuestos">
					</a>
				</td> 
              	<td align="right" width="30"  bgcolor="#373737" id="txt4">
    				<a href="#" onclick="traspasarPedido()" id="traspaso">
						 <img src="images/transfer.png" width="22" height="22"	border="0" title="Traspasar a Encargo">
					</a>
				</td> 	
    			
              	<td align="right" width="30" bgcolor="#373737" id="txt4">
              		<a href="#"	onclick="ingresa_Presupuesto()">
						 <img src="images/check.png" width="15" height="15"	border="0" title="Guardar">
					</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="cerrar_venta()">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar" >
    				</a>
    			</td>
              </tr>
            </table>
            <table width="100%" cellspacing="1">
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="presupuesto.codigo"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:text property="codigo_suc" readonly="true" name="presupuestoForm" size="2" styleClass="fto"/>
                	<html:text property="codigo" readonly="true" name="presupuestoForm" size="8" styleClass="fto" styleId="codigo_presupuesto"/>
                </td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="presupuesto.cliente"/></td> 
				<td align="justify" bgcolor="#c1c1c1" id="txt5">
				<html:text property="nif" maxlength="15" styleId="nif" size="30" styleClass="fto"
						onblur="javascript:this.value=this.value.toUpperCase();" size="15" />-
				<html:text property="dvnif" size="2" styleClass="fto" readonly="true" styleId="dvnif" />
					<a href="#" onclick="javascript:buscarClienteAjax();"> <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de cliente"> </a> 
					<a href="#" onclick="javascript:busqueda_cliente()">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar Cliente">
    				</a>
				<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="4">
						<div id="nombre_clienteDIV" ></div>
				</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="presupuesto.fecha"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:text property="fecha" readonly="true" name="presupuestoForm" size="8" styleClass="fto" onchange="cambiaEstadoNOGrabado();"/>
                </td>
                
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="presupuesto.forma.pago"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                    <html:select property="forma_pago" name="presupuestoForm" styleClass="fto" style="width:150px;" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0" ><bean:message key="presupuesto.seleccione"/></html:option>
                        <html:optionsCollection name="presupuestoForm" property="listaFormasPago" label="descripcion" value="id" />
                    </html:select>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                	<bean:message key="presupuesto.divisa"/>
                </td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" height="16"
					style="height: 16px">
					 <html:select property="divisa" name="presupuestoForm"  styleClass="fto" style="width:150px;" disabled="true" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0"><bean:message key="presupuesto.seleccione"/></html:option>
                        <html:optionsCollection name="presupuestoForm" property="listaDivisas" label="descripcion" value="id" />
                    </html:select>	
				</td>


				<td align="left" bgcolor="#c1c1c1" id="txt5" height="16" colspan="2"></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message
							key="presupuesto.cambio" />
					</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                <html:text property="cambio" readonly="true"
							name="presupuestoForm" size="8" styleClass="fto" />
					</td>
					<td align="left" bgcolor="#c1c1c1" id="txt5">
                <bean:message key="presupuesto.hora" />
					</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                <html:text property="hora" readonly="true"
							name="presupuestoForm" size="8" styleClass="fto" />
					</td>
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30"><bean:message key="presupuesto.agente"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">
                	<html:select property="agente" name="presupuestoForm" styleClass="fto" onchange="cambiaEstadoNOGrabado();" > 
                        <html:option value="0"><bean:message key="presupuesto.seleccione"/></html:option>
                        <html:optionsCollection name="presupuestoForm" property="listaAgentes" label="usuario" value="usuario" />
                    </html:select>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">

                <bean:message key="presupuesto.idioma" />
					</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">
                	<html:select property="idioma" name="presupuestoForm"
							styleClass="fto" style="width:150px;" disabled="true">
							<html:option value="0">
								<bean:message key="presupuesto.seleccione" />
							</html:option>
							<html:optionsCollection name="presupuestoForm"
								property="listaIdiomas" label="descripcion" value="id" />
						</html:select>
					</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16" colspan="2">
					<html:checkbox property="cerrado" name="presupuestoForm"
							disabled="true"></html:checkbox>
					<bean:message key="presupuesto.cerrado"/>
					</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30"><bean:message key="venta.pedido.convenio"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30" colspan="3">
                	
                	<logic:equal value="" name="presupuestoForm" property="convenio_det">
                		<html:text property="convenio" name="presupuestoForm" size="5" styleClass="fto"/> -
                		<html:text property="convenio_det" name="presupuestoForm" size="20" readonly="true" styleClass="fto"/>
	                	<a href="#" onclick="javascript:buscarConvenioAjax();"> <img
							src="images/luparapida.jpg" width="15" height="15" border="0"
							title="Busqueda rápida de cliente"> </a> 
						<a href="#" onclick="javascript:busqueda_convenio_avanzada()">
	      						<img src="images/lupa.png" width="15" height="15" border="0" >
	    				</a>
                	</logic:equal>
                	<logic:notEqual value="" name="presupuestoForm" property="convenio_det">
                		<html:text property="convenio" name="presupuestoForm" size="5" styleClass="fto" readonly="true"/> -
                		<html:text property="convenio_det" name="presupuestoForm" size="20" readonly="true" styleClass="fto" style="background-color:#c1c1c1"/>
						<a href="#" onclick="javascript:elimina_convenio_sel()">
	      						<img src="images/cancel.png" width="15" height="15" border="0" >
	    				</a>
                	</logic:notEqual>
                </td>
              </tr>
            </table>
            <table width="100%" cellspacing="0">
                <tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" width="13%"><bean:message key="presupuesto.articulo"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="20%"><bean:message key="presupuesto.descripcion"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="presupuesto.precio.iva"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="presupuesto.importe"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="presupuesto.cantidad"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="presupuesto.descuento"/></td>
                    <!-- 
                    
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="presupuesto.grupo"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="presupuesto.estado"/></td>
                    
                     
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="presupuesto.tratamiento"/></td>
                    
                    -->
                    <th scope="col" id="txt4" bgcolor="#373737" width="15%">
                    	<a href="#" onclick="javascript:busqueda_producto()">
      						<img src="images/add.png" width="15" height="15" border="0" title="Agregar Productos">
    					</a>
                    </th>
                </tr>
              </table>
                <logic:present property="listaProductos" name="presupuestoForm">
                <div id="scrolling_pedido">
                <table width="100%" cellspacing="0" cellpadding="0" id="contenido">
               		<logic:iterate id="productos" property="listaProductos" name="presupuestoForm" indexId="index"> 
                        <tr id="${index}" bgcolor="#c1c1c1">
                                <bean:define id="esfera" type="String">
                                    <bean:write name="productos" property="esfera"/>
                                </bean:define>
                                <bean:define id="cilindro" type="String">
                                    <bean:write name="productos" property="cilindro"/>
                                </bean:define>
                                <bean:define id="diametro" type="String">
                                    <bean:write name="productos" property="diametro"/>
                                </bean:define>
                                <bean:define id="cantidad" type="String">
                                    <bean:write name="productos" property="cantidad"/>
                                </bean:define>
                                <bean:define id="grupo" type="String">
                                    <bean:write name="productos" property="grupo"/>
                                </bean:define>
                                <bean:define id="descuento" type="String">
                                    <bean:write name="productos" property="descuento" format="###.####"/>
                                </bean:define>
                            <td id="txt5"  width="15%">
                            	<a href="#" onclick="javascript:seleccionarProducto('${index}','${esfera}','${cilindro}','${diametro}');">
                            	<bean:write name="productos" property="cod_barra" />
                            	</a>
                            </td>
                            <td id="txt5"  width="20%">
	                            <logic:notEqual value="true" property="descripcion_manual" name="productos">
	                            	<bean:write name="productos" property="descripcion"/>
	                            </logic:notEqual>
	                            <logic:equal value="true" property="descripcion_manual" name="productos">
	                            		<input type="text" name="cantidad" onblur="actualiza_descripcion('${index}', this)" id="descripcion_manual_${index}" size="45" align="left" class="fto" value='<bean:write name="productos" property="descripcion"/>'/>
	                            </logic:equal>
                            </td>
                            <td id="txt5"  width="13%"><bean:write name="productos" property="precio"  format="$###,###.##" /></td>
                            <td id="txt5"  width="12%"><bean:write name="productos" property="importe" format="$###,###.##" /></td>
 
                            
                            <td id="txt5"  width="9%">
                            	<logic:equal value="true" property="cerrado" name="presupuestoForm">
                            		<input type="text" name="cantidad" value='${cantidad}' readonly="true" size="3" align="left" class="fto"/>
                            	</logic:equal>
                            	<logic:notEqual value="true" property="cerrado" name="presupuestoForm">
                            		<logic:equal value="true" property="tiene_grupo" name="productos">
	                            		<input type="text" name="cantidad" value='${cantidad}' readonly="true" size="3" align="left" class="fto"/>
		                            </logic:equal>
		                            <logic:notEqual value="true" property="tiene_grupo" name="productos">
		                            	<input type="text" name="cantidad" onblur="actualiza_cantidad('${index}', this)" value='${cantidad}' size="3" align="left" class="fto"/>
		                            </logic:notEqual>
                            	</logic:notEqual>
                            </td>
                            
                            
                            
                            <td id="txt5"  width="10%">
                            	<logic:equal value="MUL" property="familia" name="productos">
                            	    <input type="text" name="descuento"  value='${descuento}' size="2" align="left" class="fto" readonly="true"/>
                            	</logic:equal>
                            	<logic:notEqual value="MUL" property="familia" name="productos">
                            		<input type="text" id="descuento_${index}"  onblur="actualiza_descuento('${index}', '${descuento}')" value='${descuento}' size="2" align="left" class="fto"  onkeypress="return validar_numerico_decimal(event)" onkeydown="return intercept(event,'${index}', this)"/>
                            	</logic:notEqual>
                            </td>
                            <!-- 
                            
                            <logic:equal value="true" property="tiene_grupo" name="productos">
                            	<td id="txt5" bgcolor="#c1c1c1" width="12%"><html:text property='${index}' size="3" value = '${grupo}' styleClass="fto"/></td>
                            </logic:equal>
                            <logic:notEqual value="true" property="tiene_grupo" name="productos">
                            	<td id="txt5" bgcolor="#c1c1c1" width="12%"></td>
                            </logic:notEqual>

                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="productos" property="estado"/></td>
                            
                            
                             <logic:equal value="true" property="tiene_suple" name="productos" >
                            	<td id="txt5" bgcolor="#c1c1c1" width="9%" align="center">
                            		<a href="#" onclick="javascript:seleccionTratamientos('${index}');" >
      									<img src="images/add.png" width="15" height="15" border="0" >
    								</a>
                            	</td>
                            </logic:equal>
                            <logic:notEqual value="true" property="tiene_suple" name="productos">
                            	<td id="txt5" bgcolor="#c1c1c1" width="9%"></td>
                            </logic:notEqual> 
                            -->
                            <td id="txt5"  width="9%" align="center">
                            	<a href="#" onclick="javascript:eliminarProducto('${index}');">
      								<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Producto">
    							</a>
    						</td>
                        </tr>
                    </logic:iterate>
                 </table>
                 </div>
                </logic:present>
       
        <table width="40%" cellspacing="0" align="center" >
        	<tr>
        		<td colspan="6" id="txt4" bgcolor="#373737" ><bean:message key="presupuesto.graduacion.articulo"/></td>
        	</tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.esfera"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<html:text property="esfera" styleId="esfera" readonly="true" value="" size="5" styleClass="fto"></html:text>
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.cilindro"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<html:text readonly="true" styleId="cilindro" property="cilindro" value="" size="5" styleClass="fto"/>
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.diametro"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<html:text readonly="true" styleId="diametro" property="diametro" value="" size="5" styleClass="fto"/>
		    </td>
		  </tr>
		</table>
		
		<table width="100%" cellspacing="0" align="center">
			<tr>
				<td id="txt4" bgcolor="#373737"><bean:message key="presupuesto.graduacion"/></td>
				<td id="txt4" bgcolor="#373737" align="right">
				<!-- 
					<a href="#" onclick="javascript:abrirGraduaciones()">
      						<img src="images/add.png" width="15" height="15" border="0" >
    				</a>
    			 -->
    			</td>
    			<td id="txt4" bgcolor="#373737" align="right" width="40">
    				<a href="#" onclick="javascript:detalle('detalle_graduacion')">
      						<img src="images/detalle.png" width="15" height="15" border="0" title="Ocultar / Mostrar detalles" >
    				</a>	
				</td>
			</tr>
			</table>
			<div id="detalle_graduacion" style="display:">
			<bean:define id="graduacion_seleccionada" name="presupuestoForm" property="graduacion"/>
			<table width="100%" cellspacing="1" cellpadding="1" align="center">
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.fecha"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="fecha"/>' size="6" id="fecha_graduacion">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1"></td>
			    <td id="txt5" bgcolor="#c1c1c1"></td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.esfera"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.cilindro"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.eje"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.adicion"/></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.esfera.cerca"/></td>
			    <td colspan="2" id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.np"/></td>
			  </tr>
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.orden"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="orden"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.o.d"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_esfera"/>' size="3" id="OD_esfera">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_cilindro"/>' size="3" id="OD_cilindro">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_eje"/>' size="3" id="OD_eje">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_adicion"/>' size="3" id="OD_adicion">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_esfera_cerca"/>' size="3" id="OD_esfera_cerca">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_n"/>' size="3" id="OD_n">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_p"/>' size="3" id="OD_p">
			    </td>
			  </tr>
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.doctor"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" colspan="3">
			    	<input type="text" class="fto" readonly="true"
							value='<bean:write name="graduacion_seleccionada" property="doctor"/>'
							size="31" id="doctor"></td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.o.i"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_esfera"/>' size="3" id="OI_esfera" >
			    </td>
			     <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_cilindro"/>' size="3" id="OI_cilindro">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto"  readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_eje"/>' size="3" id="OI_eje" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_adicion"/>' size="3" id="OI_adicion" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_esfera_cerca"/>' size="3" id="OI_esfera_cerca" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_n"/>' size="3" id="OI_n" >
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OI_p"/>' size="3" id="OI_p" >
			    </td>
			  </tr>
			</table>
			</div>
		<table width="100%" cellspacing="1">
		<tr><td colspan="6" id="txt4" bgcolor="#373737" ><bean:message key="presupuesto.totales"/></td></tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
		    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.subtotal"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.desc"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.porcentaje.descuento"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.total"/></td>
		  </tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.f.entrega"/></td>
		    <td id="txt5" bgcolor="#c1c1c1"><html:text property="fecha_entrega" size="10" name="presupuestoForm" styleClass="fto" readonly="true"  styleId="popupDatepicker" onchange="cambiaEstadoNOGrabado();" /></td>
		    <td id="txt5" bgcolor="#c1c1c1"><html:text property="subTotal" readonly="true" size="10" name="presupuestoForm" styleClass="fto" readonly="true"/></td>
		    <td id="txt5" bgcolor="#c1c1c1">
		    	<bean:define id="dto_total_monto" property="descuento" name="presupuestoForm"/>
		    	<input type="text" value="<bean:write name="presupuestoForm" property="descuento"/>" size="10"  class="fto" id="dtototal" onblur="actualiza_descuento_total_monto('dtototal', '${dto_total_monto}')" onchange="cambiaEstadoNOGrabado();">
		    </td>
			<td id="txt5" bgcolor="#c1c1c1">
					<bean:define id="dto_total" property="dtcoPorcentaje" name="presupuestoForm"></bean:define>
		    	<input type="text"
						value='<bean:write name="presupuestoForm" property="dtcoPorcentaje"/>'
						size="10" class="fto" id="%dtototal"
						onkeypress="return validar_numerico_decimal(event)"
						onblur="actualiza_descuento_total('%dtototal','${dto_total}')"
						onchange="cambiaEstadoNOGrabado();">
					</td>
		    <td id="txt5" bgcolor="#c1c1c1"><html:text property="total" size="10" readonly="true" name="presupuestoForm" styleClass="fto" readonly="true"/></td>
		  </tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="presupuesto.notas"/></td>

		    <td colspan="5" id="txt5" bgcolor="#c1c1c1" align="left"><html:text property="nota" size="100" name="presupuestoForm" styleClass="fto" styleId="nota" onchange="cambiaEstadoNOGrabado();" /></td>
		  </tr>
		</table>
		 </html:form>
	<br>
	</div>
</body>

</html:html>

