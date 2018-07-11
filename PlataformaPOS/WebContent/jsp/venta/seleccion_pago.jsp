	
	<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
	<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
	
	<!DOCTYPE html>
	<html:html>
	
	<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<link href="css/estilos.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/subModal.css" />
	<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>	
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>		
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/subModal.js"></script>
	<script type="text/javascript" src="js/utils.js"></script>
	<script type="text/javascript" src="js/venta/seleccion_pago.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css"/>
	
	<script type="text/javascript" src="js/jquery.datepick.js""></script>
	<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
	<script type="text/javascript">
		var $j = jQuery.noConflict();
		load();
	
		$j(function() {
			$j('#popupDatepicker').datepick();
		});
	
		function calculaTotal() {
			var descuento_max = document.getElementById('descuento_max').value;
			var dto = parseFloat(document.getElementById('descuentoTotal').value);
			document.getElementById('descuentoTotal').value = dto;
			if (parseInt(dto) <= parseInt(descuento_max)) {
				calcula();
				calcula_anticipo_minimo();
			} else {
				if(document.getElementById('origen').value == "PEDIDO")
				{
					var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaAutorizadorDescuento";		
						showPopWin(url, 690, 130, devuelve_descuento, false);
	
				}
				else
				{
					alert("El descuento debe ser menor o igual al " + descuento_max + "%");
					document.getElementById('descuentoTotal').value = 0.0;
				}
			}
		}
		
		function imprimirBoleta() 
		{
	        	$j("#accion",window.parent.document).val("Pago_Exitoso");
	        	
	        	$j("#accion").val("valida_boleta");
	        	
	        	document.forms[0].submit();
		}
		
		
		/*LMARIN 20140416*/
		function reimprimirBoleta() 
		{
				$j.ajax({
					  type: "POST",
					  url: 'SeleccionPago.do?method=reimpresionBoletaelec',
					  dataType: "text",
					  data:"boleta_fecha="+$j("#fpago").val()+"&serie="+$j("#serie").val()+"&boleta_tienda=T002",
					  asycn:false,
					  success: function(data){				  		
					  		if(data != ""){
					  			var tipoimpresion = $j("#tipoimp").val() == "1" ? "Carta": "Termica";
	 							var urlbol = "http://srvgmosignaturepos/PRD/"+tipoimpresion+"/"+data+".pdf";
					  			window.open(urlbol);
					  			dialogo("<%=request.getContextPath()%>/SeleccionPago.do?method=imprime_documento&tipo=BOLETA");				  			
					  		}
				 	  }
			 	});
				
		}
		
		function imprimirGuia() 
		{
			//var voucher;
	       	//voucher = window.open("<%=request.getContextPath()%>/CreaGuiaServlet");
	       	window.open("<%=request.getContextPath()%>/SeleccionPago.do?method=imprime_documento&tipo=GUIA");
			popup('Numero_Documento' , ancho, alto);
		}
		function eliminar_pago_albaran(forma_pago, fecha_pago){
			document.getElementById('accion').value="eliminarFormaPagoSeleccionPago";
			document.getElementById('f_pago').value=forma_pago;	
			document.getElementById('fech_pago').value=fecha_pago;
			var x = document.forms[0];		
			x.action = "<%=request.getContextPath()%>/SeleccionPago.do?method=eliminaFPagoBoleta";
			x.submit();	
		}
	</script>
	<style type="text/css">
	<!--
	#blanket {
	   display: block;
	   position: absolute;
	   top: 0%;
	   left: 0%;
	   width: 100%;
	   height: 100%;
	   background-color: black;
	   z-index:9001;
	   opacity:0.6;
	   filter:alpha(opacity=60);
	}
	#documentos {
	position:absolute;
		z-index: 9002; /*ooveeerrrr nine thoussaaaannnd*/
	}
	
	#Numero_Documento {
	position:absolute;
		z-index: 9003; /*ooveeerrrr nine thoussaaaannnd*/
	}
	#Confirmacion {
	position:absolute;
		z-index: 9004; /*ooveeerrrr nine thoussaaaannnd*/
	}
	#Documento_cambio_folio {
	position:absolute;
		z-index: 9005; /*ooveeerrrr nine thoussaaaannnd*/
	}
	-->
	</style>
	  <title><bean:message key="title.pos"/></title>
	
	
	
	</head>
	<body>
		<bean:define id="msje" type="String">
			<bean:write name="mensaje" scope="session"/>
		</bean:define>
	<logic:equal scope="session" name="error" value="BLOQUEADO">
		<body onload="venta_bloqueada();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="inicio">
		<body onload="inicio();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="pago_repetido">
		<body onload="pago_repetido();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="error_fecha_anterior">
		<body onload="pago_fecha_anterior();if(history.length>0)history.go(+1)">
	</logic:equal>
	
	<logic:equal scope="session" name="error" value="ELIMINA_PAGO_FALLA">
		<body onload="inicio_pagina();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="ELIMINA_PAGO_EXITO">
		<body onload="inicio_pagina();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="imprime_guia">
		<body onload="imprimirGuia();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="BOLETA_FALLA">
		<body onload="vuelve_confirmacion('falla', '${msje}');if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="BOLETA_EXITO">
		<body onload="vuelve_confirmacion('exito', '${msje}');if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="BOLETA_CAMBIO_FOLIO">
		<body onload="pregunta_cambio_folio('${msje}');if(history.length>0)history.go(+1)">
	</logic:equal>
	
	<logic:equal scope="session" name="error" value="PAGADO_TOTAL">
		<body onload="generaBoleta2();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="valida_100">
		<body onload="valida_100();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="ERROR_OA">
		<body onload="error_fpago_oa();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="error_fpago_convenio_oa">
		<body onload="error_fpago_oa_convenio();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="error_fpago_convenio_oa_2">
		<body onload="error_fpago_oa_convenio_2();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="caja_cerrada">
		<body onload="error_caja_cerrada();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="error" value="error_guia_pago_oa">
		<body onload="error_guia_pago_oa();if(history.length>0)history.go(+1)">
	</logic:equal>
	
	
	
	
	
		<html:form action="/SeleccionPago?method=IngresaPago" styleId="form1">
			<html:hidden property="accion" value="" styleId="accion"/>
			<html:hidden property="estado" styleId="estado" name="seleccionPagoForm"/>
			<html:hidden property="tipo_doc" styleId="tipo_doc"/>
			<html:hidden property="tiene_pagos" styleId="tiene_pagos" name="seleccionPagoForm"/>
			<html:hidden property="origen" styleId="origen"/>
			<html:hidden property="tiene_pagos_actuales" styleId="tiene_pagos_actuales" name="seleccionPagoForm"/>
			<html:hidden property="giro_descripcion" styleId="giro_descripcion"/>
			<html:hidden property="provincia_descripcion" styleId="provincia_descripcion"/>
			<html:hidden property="f_pago" value="" styleId="f_pago"/>
			<html:hidden property="fech_pago" value="" styleId="fech_pago"/>
			<html:hidden property="exitopago"  styleId="exitopago"/>
			<html:hidden property="tiene_documentos" styleId="tiene_doc" name="seleccionPagoForm"/>
			<html:hidden property="tiene_fomas_pago" styleId="tiene_fomas_pago" name="seleccionPagoForm"/>
			
			<html:hidden property="autorizador"  value="" styleId="autorizador" name="seleccionPagoForm"/>		
			<html:hidden property="tipoaccion"  value="" styleId="tipoaccion" name="seleccionPagoForm"/>
		    <html:hidden property="numero_boleta_up"  value="" styleId="numero_boleta_up" name="seleccionPagoForm"/>
		    <html:hidden property="rut_vs"  value="" styleId="rut_vs" name="seleccionPagoForm"/>
		    <html:hidden property="monto_des_vs"  value="" styleId="monto_des_vs" name="seleccionPagoForm"/>
			
			
			
			<logic:equal value="PEDIDO" name="seleccionPagoForm" property="origen">
				<html:hidden property="porcentaje_descuento_max" styleId="descuento_max" name="ventaPedidoForm"/>
				<html:hidden property="tipo_pedido" styleId="tipo_pedido" name="ventaPedidoForm"/>
				
			</logic:equal>
			<logic:equal value="DIRECTA" name="seleccionPagoForm" property="origen">
				<html:hidden property="porcentaje_descuento_max" styleId="descuento_max" name="ventaDirectaForm"/>
				<html:hidden property="descuento" styleId="dto" name="seleccionPagoForm"/>
			</logic:equal>
			<logic:equal value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
				<html:hidden property="porcentaje_descuento_max" styleId="descuento_max" name="seleccionPagoForm"/>
			</logic:equal>
			<logic:equal value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
				<html:hidden property="porcentaje_descuento_max" styleId="descuento_max" name="seleccionPagoForm"/>
			</logic:equal>
			<table width="680" cellspacing="0" align="center">
				<tr>
					<td  align="left" bgcolor="#373737" id="txt4"><bean:message key="seleccion.pago"/></td>
					<td  align="right" bgcolor="#373737" id="txt4">
					
						 		<logic:equal value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
	                            	<a href="" onclick="refreshAlbaran()"> 
											<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar"> 
									</a>
	                            </logic:equal>
	                           
	                            
	                            <logic:notEqual value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
	                            
	                            	<logic:equal value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
		                            	<a href="" onclick="refreshAlbaran()"> 
											<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar"> 
										</a>
	                            	</logic:equal>
	                            	<logic:notEqual value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
			                            <a href="" onclick="refresh()"> 
											<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar"> 
										</a>
		                            </logic:notEqual>
	                            </logic:notEqual>
					
					
						
						
						
						
					</td>
				</tr>
				</table>
			<table width="680" cellspacing="1" align="center">
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.fecha"/></td>
					<td colspan="3" id="txt5" bgcolor="#c1c1c1">
					<logic:equal value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
						<html:text readonly="true"	property="fecha" size="8" styleClass="fto" />&nbsp;&nbsp;&nbsp;
					</logic:equal>
					<logic:notEqual value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
						<html:text readonly="true"	property="fecha" size="8" styleClass="fto" styleId="popupDatepicker"/>&nbsp;&nbsp;&nbsp;
					</logic:notEqual>
							
							 
					<bean:message key="seleccion.numero.serie"/> <html:text property="serie" styleId="serie" size="10" styleClass="fto" readonly="true"/></td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.nif"/></td>
					<td id="txt5" bgcolor="#c1c1c1"><html:text property="nif" styleId="nif" size="15" styleClass="fto" readonly="true" />
					</td>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.razon.social"/></td>
					<td id="txt5" bgcolor="#c1c1c1"><html:text property="razon"
							size="35" styleClass="fto" readonly="true" />
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.direccion"/></td>
					<td id="txt5" bgcolor="#c1c1c1"><html:text property="direccion"  readonly="true"  
							size="30" styleClass="fto"/>
					</td>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.provincia"/></td>
					<td id="txt5" bgcolor="#c1c1c1">
						<html:text property="provincia_descripcion" readonly="true" styleClass="fto"></html:text>
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" height="23" style="height: 23px"><bean:message
							key="seleccion.poblacion" />
					</td>
					<td id="txt5" bgcolor="#c1c1c1" height="23"><html:text  property="poblacion" styleClass="fto" readonly="true" />
					</td>
					<td id="txt5" bgcolor="#c1c1c1" align="left" height="23"><bean:message key="seleccion.giro"/></td>
					<td id="txt5" bgcolor="#c1c1c1" height="23">
						<html:text property="giro_descripcion" styleId="giro"  readonly="true" styleClass="fto"></html:text>
						</td>
				</tr>
				</table>
				<table width="680" cellspacing="0" align="center">
				<tr>
					<td align="left" bgcolor="#373737" id="txt4" width="75%"><bean:message key="seleccion.cobro"/>
					
					</td>
					<td bgcolor="#373737" id="txt4" align="right" width="5%">
					<logic:notEqual value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
						<a id="gurdar" href="#"  style="color:#FFFFFF;
																		font-family:Helvetica, Arial, sans-serif;
																		font-size:10px;
																		font-weight:bold;
																		height:10px;
																		padding:1px;">
							<bean:message key="seleccion.guardar"/>
						</a>
					</logic:notEqual>	
					<logic:equal value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
						<a id="gurdar" href="#" onclick="guarda_PagoAlbaran()" style="color:#FFFFFF;
																		font-family:Helvetica, Arial, sans-serif;
																		font-size:10px;
																		font-weight:bold;
																		height:10px;
																		padding:1px;">
							<bean:message key="seleccion.guardar"/>
						</a>
					</logic:equal>
					</td>
					<td bgcolor="#373737" id="txt4" align="right" width="5%">	
					<logic:notEqual value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">	
								
							<a id="imprimir" href="#" onclick="generaBoleta()" style="color:#FFFFFF;
																				font-family:Helvetica, Arial, sans-serif;
																				font-size:10px;
																				font-weight:bold;
																				height:10px;
																				padding:1px;">
								<bean:message key="seleccion.imprimir"/>
							</a>
					</logic:notEqual>	
					</td>
					<!--<td bgcolor="#373737" id="txt4" align="right" width="5%">
						<a id="reimprimir" href="javascript:void(0)"  style="color:#FFFFFF;font-family:Helvetica, Arial, sans-serif;font-size:10px;font-weight:bold;height:10px;">
								<p>ReimprImir</p>
						</a>		
					</td>-->
				</tr>
				</table>
				<html:hidden property="v_total" styleId="v_total" name="seleccionPagoForm"/>
				<table  width="680" cellspacing="1" align="center">
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.valor.total.pago"/></td>
					<td id="txt5" bgcolor="#c1c1c1">
					<html:text
							name="seleccionPagoForm" property="v_total_parcial" styleId="sumaParcial" readonly="true" size="10" styleClass="fto"/>
							&nbsp; 
							<!-- 
							<bean:message key="seleccion.total.sd"/> = 
							<logic:equal value="PEDIDO" name="seleccionPagoForm" property="origen">
							<html:text name="ventaPedidoForm" property="total" styleId="sumaTotal" readonly="true" size="10" styleClass="fto"/>
							</logic:equal>
							 -->
							<logic:equal value="DIRECTA" name="seleccionPagoForm" property="origen">
							<html:text name="ventaDirectaForm" property="sumaTotal" styleId="sumaTotal" readonly="true" size="10" styleClass="fto"/>
							</logic:equal>
							<logic:equal value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
							<html:text name="seleccionPagoForm" property="suma_total_albaranes" styleId="sumaTotal" readonly="true" size="10" styleClass="fto"/>
							</logic:equal>
							<logic:equal value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
							<html:text name="seleccionPagoForm" property="suma_total_albaranes" styleId="sumaTotal" readonly="true" size="10" styleClass="fto"/>
							</logic:equal>
							
					</td>
					<td id="txt5" bgcolor="#c1c1c1" rowspan="5"  colspan="2">
					 
	<!-- TABLA QUE REGISTRA LOS PAGOS REALIZADOS -->
	
			<table  width="100%" cellspacing="0" cellpadding="0">
	        			<tr id="thead">
	                    <th scope="col" id="txt4" bgcolor="#373737" width="30%"><bean:message key="seleccion.fecha"/></th>
	                    <th scope="col" id="txt4" bgcolor="#373737" width="30%"><bean:message key="seleccion.forma.pago"/></th>
	                    <th scope="col" id="txt4" bgcolor="#373737" width="40%"><bean:message key="seleccion.cantidad"/></th>
	                    <th scope="col" id="txt4" bgcolor="#373737" width="40%"><bean:message key="seleccion.eliminar.pago"/></th>
	                </tr>
	           </table>
	           <logic:present property="listaPagos" name="seleccionPagoForm">
	                <div id="scrolling_pagos">
	                <table id="detalle_pagos" width="100%" cellspacing="0">
	                <logic:iterate id="pagos" property="listaPagos" name="seleccionPagoForm">
	                <bean:define id="forma_pago" type="String">
	                	<bean:write name="pagos" property="forma_pago"/>
	                </bean:define>
	                <bean:define id="fech_pago" type="String">
	                	<bean:write name="pagos" property="fecha" format="dd/MM/yyyy" />
	                </bean:define>
	                
	                        <tr >
	                            <td id="txt5" bgcolor="#c1c1c1" width="30%"><bean:write name="pagos" property="fecha" format="dd/MM/yyyy" /><input type="hidden" id="fpago" value="${fech_pago}" /></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="30%" align="center"><bean:write name="pagos" property="detalle_forma_pago" /><input type="hidden" id="dpago"  value="${forma_pago}"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="40%" align="center"><bean:write name="pagos" property="cantidad" format="$###,###.##" /></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="40%" align="center">
	                            
	                            <logic:equal value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
	                            	<a href="#" id="el" onclick="eliminar_pago_albaran('${forma_pago}','${fech_pago}');" >
		                            	<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Pago">
		                            </a>
	                            </logic:equal>
	                           
	                            
	                            <logic:notEqual value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
	                            
	                            	<logic:equal value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
		                            	<a href="#" id="el" onclick="eliminar_pago_albaran('${forma_pago}','${fech_pago}');" >
			                            	<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Pago">
			                            </a>
	                            	</logic:equal>
	                            	<logic:notEqual value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
			                            <a href="#" id="el"  onclick="eliminar_pago('${forma_pago}','${fech_pago}','<%=request.getContextPath()%>');" >
			                            	<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Pago">
			                            </a>
		                            </logic:notEqual>
	                            </logic:notEqual>
	                            
	                            	
	                            </td>
	                        </tr>
	                    </logic:iterate>
	               </table> 
	               </div> 
	            </logic:present> 
	<!-- FIN -->
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.valor.pagar"/></td>
					<td id="txt5" bgcolor="#c1c1c1"><html:text size="10" name="seleccionPagoForm" property="v_a_pagar" styleId="sumaPagar" value="" onkeypress="return validar_numerico(event)" onblur="javascript: valida_monto()" styleClass="fto"/>
						<logic:equal value="PEDIDO" name="seleccionPagoForm" property="origen">
							<bean:message key="seleccion.valor.anticipo"/>
								<html:text name="seleccionPagoForm" property="anticipo_pedido" styleId="anticipo_def" readonly="true" size="10" styleClass="fto" />
								<html:hidden name="seleccionPagoForm" property="porcentaje_anticipo_pedido" styleId="porc_anticipo_def" styleClass="fto"/>
						</logic:equal>
					
					</td>
				</tr>
				<logic:equal value="DIRECTA" name="seleccionPagoForm" property="origen">
				<tr>
					
					<td id="txt5" bgcolor="#c1c1c1">
					
						<bean:message key="seleccion.descuento"/></td>
					<td id="txt5" bgcolor="#c1c1c1">
						<logic:equal property="tiene_pagos" name="seleccionPagoForm" value="0">
							<input type="text" value='<bean:write name="seleccionPagoForm" property="descuento"/>' size="5" class="fto" id="descuentoTotal" onblur="javascript: calculaTotalvtaDirecta()" onkeypress="return validar_numerico(event)"/>%
						</logic:equal>	
						<logic:equal property="tiene_pagos" name="seleccionPagoForm" value="1">
							<html:text	name="seleccionPagoForm" property="descuento" size="5"
								styleId="descuentoTotal" readonly="true" styleClass="fto"/>%
						</logic:equal>
						
					
					</td>
						
				</tr>
				</logic:equal>
				<logic:equal value="ALBARAN_DIRECTA" name="seleccionPagoForm" property="origen">
				<tr>
					
					<td id="txt5" bgcolor="#c1c1c1">
					
						<bean:message key="seleccion.descuento"/></td>
					<td id="txt5" bgcolor="#c1c1c1">
						<logic:equal property="tiene_pagos" name="seleccionPagoForm" value="0">
							<html:text	styleClass="fto" name="seleccionPagoForm" property="descuento" size="5"
								styleId="descuentoTotal" onblur="javascript: calculaTotal()" value="0"
								onkeypress="return validar_numerico(event)" />%
						</logic:equal>	
						<logic:equal property="tiene_pagos" name="seleccionPagoForm" value="1">
							<html:text	name="seleccionPagoForm" property="descuento" size="5"
								styleId="descuentoTotal" readonly="true" styleClass="fto"/>%
						</logic:equal>					
					
					</td>
						
				</tr>
				</logic:equal>
				<logic:equal value="ALBARAN_DEVOLUCION" name="seleccionPagoForm" property="origen">
				<tr>
					
					<td id="txt5" bgcolor="#c1c1c1">
					
					<bean:message key="seleccion.descuento"/></td> 
					<td id="txt5" bgcolor="#c1c1c1">
						<logic:equal property="tiene_pagos" name="seleccionPagoForm" value="0">
							<html:text	styleClass="fto" name="seleccionPagoForm" property="descuento" size="5"
								styleId="descuentoTotal" onblur="javascript: calculaTotal()" value="0"
								onkeypress="return validar_numerico(event)" readonly="true" />%
						</logic:equal>			
					</td>
						
				</tr>
				</logic:equal>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.diferencia"/></td>
					<td id="txt5" bgcolor="#c1c1c1">
						
					<html:text property="diferencia" size="10" name="seleccionPagoForm" styleId="diferencia" readonly="true" styleClass="fto"/>
					
					<bean:define id="diferencia_total" type="String">
	                     <bean:write name="seleccionPagoForm" property="diferencia"/>
	                </bean:define>
	                <html:hidden value ='${diferencia_total}' styleId="diferencia_total" property="diferencia_total"/>
	                
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.forma.pago"/></td>
					<td id="txt5" bgcolor="#c1c1c1" style="position:relative;">
						<html:select property="forma_pago" styleId="forma_pago" styleClass="fto" value="">
							<html:option value="0"><bean:message key="seleccion.forma.pago"/></html:option>
							<html:optionsCollection property="listaFormasPago" name="seleccionPagoForm" label="descripcion" value="id"/>
						</html:select>
						<div id="crb_input" style="display:none; float:left;">&nbsp;<label>N° Doc Isapre</label><html:text property="n_isapre" styleId="n_isapre" size="15" styleClass="fto" maxlength="14" onkeypress="return validar_numerico(event);" ></html:text> </div>
					</td>
				</tr>
			</table>
			<div id="blanket" style="display:none;"></div>
			<div id="documentos" style="display: none" align="center">
				<table width="200"  cellspacing="0"> 
					<tr>
						<td colspan="1" bgcolor="#373737" id="txt4"><bean:message key="seleccion.documento"/></td>
						<td colspan="1" bgcolor="#373737" id="txt4">
							<a href="#" onclick="cierra_ventana('documentos')"> 
							<img src="images/cancel.png" width="10" height="10" border="0"> 
						</a>
						</td>
					</tr>
				</table>
				<div id="prueba"></div>
				<table width="200" cellspacing="0"> 
					<logic:notEqual value="true" property="solo_guia" name="seleccionPagoForm">
					<tr>
						<td id="txt5" bgcolor="#c1c1c1" align="left"><input type="radio"
							name="radio" id="radio" value="radio"   onclick="seleccion_documento('B')"/> <bean:message key="seleccion.boleta"/></td>
					</tr>
					</logic:notEqual>
					<logic:notEqual value="true" property="solo_boleta"    name="seleccionPagoForm">
					<tr>
						<td id="txt5" bgcolor="#c1c1c1" align="left">
							<logic:equal value="PEDIDO" property="origen" name="seleccionPagoForm">
							<input type="radio"	name="radio" id="radio2" value="radio" onclick="seleccion_documento('G')"/> <bean:message key="seleccion.guia.despacho"/>
							</logic:equal>
						</td>
					</tr>
					</logic:notEqual>
						<tr>
						<td id="txt5" bgcolor="#c1c1c1" align="right">
							<a href="#" onclick="numeroDocumento()" id="enviar"> 
								<img src="images/checkprint.png" width="15" height="15" border="0" title="Confirmar Impresión" />
						</a>
						</td>
					</tr>
				</table>
			</div>
			<div id="Documento_cambio_folio" style="display: none" align="center">
				<table width="200" cellspacing="1">
					<tr>
						<td colspan="3" align="center" bgcolor="#373737" id="txt4"><bean:message key="seleccion.documento.cambio.folio"/></td>
					</tr>
					<tr>
						<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.numero"/></td>
						<td id="txt5" bgcolor="#c1c1c1">
							<html:text property="numero_boleta_conf" styleId="numero_1_cambio" value="" size="10"  styleClass="fto" onkeypress="return validar_numerico(event)"/>
						</td>
					</tr>																																																																																																																																																																																																																																																																																																																							
					<tr>
						<td id="txt5" bgcolor="#c1c1c1" colspan="2" align="right">
							<a href="#" onclick="javascript: confirmaCambioFolio()"> <img
								src="images/check.png" width="15" height="15" border="0">
						</a></td>
					</tr>
				</table>
			</div>
			<div id="Numero_Documento" style="display: none">
				<table width="200" cellspacing="1">
					<tr>
						<td colspan="3" align="center" bgcolor="#373737" id="txt4"><bean:message key="seleccion.numero.documento"/></td>
					</tr>
					<tr>
						<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.numero"/></td>
						<td id="txt5" bgcolor="#c1c1c1">
							<html:text property="numero_boleta" styleId="numero_1" value="" size="10"  styleClass="fto" onkeypress="return validar_numerico(event)"/>
						</td>
					</tr>
					<tr>
						<td id="txt5" bgcolor="#c1c1c1"><bean:message key="seleccion.numero"/></td>
						<td id="txt5" bgcolor="#c1c1c1">
							<html:text property="numero_boleta_conf" styleId="numero_2" value="" size="10"  styleClass="fto" onkeypress="return validar_numerico(event)"/>
						</td>
					</tr>																																																																																																																																																																																																																																																																																																																							
					<tr>
						<td id="txt5" bgcolor="#c1c1c1" colspan="2" align="right"><a href="#"
							onclick="javascript: confirmaNumeroDocumento()"> <img
								src="images/check.png" width="15" height="15" border="0">
						</a></td>
					</tr>
				</table>
			</div>
			<div id="Confirmacion" style="display: none">
				<table width="200" cellspacing="1">
					<tr>
						<td colspan="2" align="center" bgcolor="#373737" id="txt4"><p id="msj_impresion"></p></td>
					</tr>
					<tr>
						<td id="txt5" bgcolor="#c1c1c1" align="center">
							<a class ="ticket" data-value = "S" href="javascript:void(0)"> 
						    <img src="images/check.png" width="15" height="15"
								border="0"> </a></td>
						<td id="txt5" bgcolor="#c1c1c1" align="center">
							<a class ="ticket" data-value = "N" href="#"> <img src="images/cancel.png" width="15"
						height="15" border="0"> </a></td>
					</tr>
					
				</table>
			</div>
	</html:form>
	<script>					 	
			 	var convenio = $j.trim($j('#convenio',window.parent.document).val());
			 	var tipoconvenio = $j.trim($j('#isapre',window.parent.document).val());
			 	var diferencia = $j.trim($j("#diferencia").val());
			 	var paso_grp = 0;
			 	var cont = 0;
			 	var dent = 0;
			 	
			 	//GROUPON 
			 	$j("#detalle_pagos #dpago").each(function(){
			 		if($j.trim($j(this).val()) == "GRPON" || $j.trim($j(this).val()) == "ISAPR" ){
			 			paso_grp = 1;
			 		}
			 	});
			 	
			 	//GARANTIAS 20170811
			 	$j("#contenido tr",window.parent.document).each(function(a){
			 		var familia  = $j(this).find("td > a").attr("data-grupfam");
			 		
			 		if(familia == "DES"){
					 	$j("#forma_pago option").each(function(i){
							  	 if($j(this).val() == "GAR" || $j(this).val() =="ISAPR" || $j(this).val() =="EXCED" || $j(this).val() =="CRB"  ){						  		   
						  			$j(this).attr("disabled","disabled");
						  		 }					  		   
							 
						});
					}
			 	});
			
			    if(paso_grp != 1 ){	    
				 	if($j.cookie('convenio') != "sdg"){
				 	
				 		//GROUPON
				 		//LMARIN SE EXTRAE EL CONVENIO 50471 DE DTOS CON FORMA DE PAGO J&J 
					 	if(convenio =="50368" || convenio =="50369"  || convenio =="50472" || convenio =="50473" || convenio =="50474" ){  
							  $j("#forma_pago option").each(function(i){
							  		if($j(this).val() !="GRPON" && $j(this).val() !="0"){
							  		    tmp ="paso";
							  			$j(this).attr("disabled","disabled");
							  		}
							  });
							  $j.cookie('convenio','sdg');
						 }else{
						 	borra_grpn();
						 }
						 
						 if(convenio =="51001" || convenio =="51002"){  
							  $j("#forma_pago option").each(function(i){
							  		if($j(this).val() !="OA" && $j(this).val() !="0"){
							  		    tmp ="paso";
							  			$j(this).attr("disabled","disabled");
							  		}
							  });
							  $j.cookie('convenio','sdg');
						 }
						 
					
						 if(convenio =="50472"){
							$j("#sumaPagar").val("80000").attr("readonly",true);
						 }
						 if(convenio =="50473"){
							$j("#sumaPagar").val("120000").attr("readonly",true);
						 }
						 if(convenio =="50474"){
							$j("#sumaPagar").val("160000").attr("readonly",true);
						 }
						 if(convenio =="50368"){
							$j("#sumaPagar").val("30000").attr("readonly",true);
						 }
						 if(convenio =="50369"){
							$j("#sumaPagar").val("15000").attr("readonly",true);
						 }
						 if(convenio =="51001"){
							$j("#sumaParcial").val("41650").attr("readonly",true);
							$j("#sumaPagar").val("41650").attr("readonly",true);
							$j("#diferencia").val("41650").attr("readonly",true);
							$j("#v_total").val("41650").attr("readonly",true);
							$j("#diferencia_total").val("41650").attr("readonly",true);
						 }
						 if(convenio =="51002"){
							//$j("#sumaPagar").val("83300").attr("readonly",true);
							$j("#sumaParcial").val("83300").attr("readonly",true);
							$j("#sumaPagar").val("83300").attr("readonly",true);
							$j("#diferencia").val("83300").attr("readonly",true);
							$j("#v_total").val("83300").attr("readonly",true);
							$j("#diferencia_total").val("83300").attr("readonly",true);
						 }
						 
						 // CRUZ BLANCA
						 // 20141203 - SE MODIFICA A PETICION DE PAULO BARRERA.
						 if($j("#tiene_doc").val()=="false"){
						 		 if(tipoconvenio =="S"){  
						 		 	  $j("#crb_input").css("display","block");	
									  $j("#forma_pago option").each(function(i){
									  		if($j(this).val() !="ISAPR" && $j(this).val() !="EXCED" && $j(this).val() !="0"){						  		   
									  			$j(this).attr("disabled","disabled");
									  		}
									  });
									  $j.cookie('convenio','sdg');
								  }else{
								  	 $j("#forma_pago option").each(function(i){
									  		if($j(this).val() =="ISAPR" || $j(this).val() =="EXCED"){						  		   
									  			$j(this).attr("disabled","disabled");
									  		}
									  });
								  }
						 }else{
						 		borra_crb();		 		
						 		
						 }
					 	 
					}
				}else{
					borra_grpn();
				}
				
				function borra_grpn(){
					$j("#forma_pago option").each(function(i){
						  		if($j(this).val() =="GRPON"){					  		    
						  			$j(this).remove();
						  		}
				    });
				}
				
				
				//valida doc convenio cruz blanca
			 	if($j("#tiene_doc").val()=="false"){
			 		 if(tipoconvenio =="S"){  
			 		 	  $j("#crb_input").css("display","block");	
						  $j("#forma_pago option").each(function(i){
						  		if($j(this).val() !="ISAPR" && $j(this).val() !="EXCED" && $j(this).val() !="0"){						  		   
						  			$j(this).attr("disabled","disabled");
						  		}
						  });
					  }else{
					  	  $j("#forma_pago option").each(function(i){
						  		if($j(this).val() =="ISAPR"  || $j(this).val() =="EXCED"){						  		   
						  			$j(this).attr("disabled","disabled");
						  		}
						  });
					  }
			 	}else{
			 		borra_crb();		 		
			 		
			 	}
				
				
				//GROUPON 
				function borra_crb(){
					$j.cookie("crb","crb_2");
					var alb = $j("#origen").val();
					if(alb.toLowerCase().indexOf("albaran") < 0){
						$j("#forma_pago option").each(function(i){
							if($j(this).val() =="ISAPR"  || $j(this).val() =="EXCED"){					  		    
					  			$j(this).remove();
					  		}else{
					  			$j(this).attr("enabled","enabled");
					  		}
							//NORMAL
					  		/*if($j(this).val() =="ISAPR"){					  		    
					  			$j(this).remove();
					  		}else{
					  			$j(this).attr("enabled","enabled");
					  		}*/
					    });
					}
				}
				
				$j("#reimprimir").on('click',function(){
					reimprimirBoleta(); 
				});
				$j("#detalle_pagos #dpago").each(function(){
			 		cont++;
			 	});
				
			 	if(cont == "0"){
			 		$j("#reimprimir").css("display","none");
			 	}
			 	//agrego clase para mostrar siempre la ultima forma de pago
			 	$j("#detalle_pagos #el").each(function(i){
			 		if((cont-1) != i){
			 			$j(this).css("display","none");
			 		}
			 	});	
			 	
			 	if($j.cookie('crb') == "crb_2"){		 	
		 		  if($j("#tiene_doc").val()=="true"){
			 		$j("#n_isapre").attr("readonly",true);
			 	  }
			 	}	
			 	
			 	//valido ingreso de voucher  no vacio 
			 	$j("#gurdar").on("click",function(){
			 	
			 		var tmpcrb = 1;
			 		
			    	$j("#detalle_pagos #dpago").each(function(){
		    			 if($j(this).val()=="ISAPR" || $j(this).val() == "EXCED"){
		    				 tmpcrb++;			 	
		    			 }		 					
		 			});
		 			
			 		
			 		if(tipoconvenio =="S" && cont == "0"){//&& cont == "0"){
			 			if($j.trim($j("#n_isapre").val()) == ""){
			 				alert("Debes ingresar el N° Doc Isapre para guardar pago.");
			 			}else{
			 				 if(tmpcrb >= 2 ){
			 				 	$j.cookie('imp_guia','7');
			 				 	$j.cookie('preg','1');
			 				 	generaBoleta(); 		 									   		
						   	 }else{
						   	 	guarda_Pago();
						   	 	$j.cookie('preg','7');					   	 	
						   	 }				   	
			 			}
			 		}else{
			 			guarda_Pago();
			 		}	
			 	});	
			 	
			 	var tipod = $j("#tipo_doc").val();
			 	
			    if(tipod == "B"){
			    	$j("#msj_impresion").text("Deseas imprimir ticket de Cambio?");
			    }else{
			    	$j("#msj_impresion").text("¿Impresión Correcta?");
			    }
			    
			    //LMARIN 
			    
			    $j(".ticket").on('click',function(){
			    	var tipodoc = $j("#tipo_doc").val();
			    	$j.cookie("estado_boleta","");
			    	if(tipodoc =="B"){
			    			returnVal = "Pago_Exitoso";
			    			window.parent.hidePopWin(true);	
			    			$j(".pantalla2",window.parent.document).css("display","block");
			    				    				
					    		/*if($j(this).attr("data-value") == "S"){
					  				$j.ajax({
									  	type: "POST",
									  	url: 'VentaPedido.do?method=imprime_ticket_cambio',
									  	dataType: "text",
									  	data:"imprime=1",
									  	asycn:false,
									 	success: function(data){
											switch(data){
												case "-1":
													returnVal = "Pago_Exitoso";
													window.parent.hidePopWin(true);
													//console.log("no se pudo generar el archivo");
												break;
												case "1":
													returnVal = "Pago_Exitoso";
													window.parent.hidePopWin(true);
													//console.log("no se elimino el archivo");
												break;
												case "2":
													returnVal = "Pago_Exitoso";
													window.parent.hidePopWin(true);
													//console.log("se elimino el archivo");
												break;
												default:
													returnVal = "Pago_Exitoso";
													window.parent.hidePopWin(true);
													//alert("Capa 8.");
												break;
											}
											
										}													  												  					 	  
						 			});	
				    		}else{
				    			returnVal = "Pago_Exitoso";
				    			window.parent.hidePopWin(true);
				    		}	*/	    		
				    }else{    				    				  
					     if($j(this).attr("data-value") == "S"){
					        returnVal = "Pago_Exitoso";
					     	window.parent.hidePopWin(true);	
			    			$j(".pantalla2",window.parent.document).css("display","block");
					     	
					     }else{
					     	popup('Confirmacion' , ancho, alto);
							popup('documentos' , ancho, alto);
					     }	
				    }
			    });
			    		   
			    //Modificación ISAPR		    		    
			    
			    if(tipoconvenio =="S"){			    
			    		if($j.cookie('preg') == '7'){
							   	 	if(confirm("Deseas imprimir Guía de despacho ?") == true){
							   	 		
							   	 		$j.cookie('imp_guia','7');
					 					generaBoleta();			 								       		    		 							
							   		}else{				
							   			guarda_Pago();
							   			 $j("#forma_pago option").each(function(i){
										  		if($j(this).val() !="ISAPR" && $j(this).val() !="EXCED" && $j(this).val() !="0"){						  		   
										  			$j(this).attr("disabled","disabled");
										  		}
										 });
							   		} 	
							   		$j.cookie('preg','');
					   	}
			    				    				    			    	
			   	    			 							
						if($j.cookie('imp_guia') == '7'){
				 					 					 								   			 				
							    borra_crb();
										
							    $j("#forma_pago option").each(function(i){
							  			if($j(this).val() !="ISAPR" && $j(this).val() !="EXCED" && $j(this).val() !="0"){						  		   
								  			$j(this).removeAttr("disabled");
							 	}
							});
												
				 		} 
			 			if($j("#diferencia").val() == "0"){
							$j("#imprimir").css("display","block");
						}else{
							$j("#imprimir").css("display","none");
						}						
							 		    																																				 	
			 	}		   		   	
			 	
			 	//FUERZO PRIMER PAGO VENTA SEGURO
			 	//COMPRUEBO SI HAY VENTA DE SEGURO
				 $j("#contenido tr",window.parent.document).each(function(a){
		      	   var familia  = $j(this).find("td > a").attr("data-grupfam");
		      	   var articulo = $j(this).find("td > a").attr("data-barra");
		      	   var precio = $j.trim($j(this).find("td > a").attr("data-precio"));
		           if(familia == "DES"){
		           		hab1();
		           		if($j("#tiene_doc").val() == "false"){
	       					$j("#sumaPagar").val(parseInt(precio)).attr("readonly",true);
	       					
		           		}
						
		       	   }
			     });
			 	
				 //console.log("tipo_pedido ==>"+$j("#tipo_pedido",window.parent.document).val());
				 if($j("#tipo_pedido",window.parent.document).val() == 'SEG'){
					 
				 	var valor = parseInt($j("#anticipo_def").val());
					
					if($j("#tiene_doc").val() == "false"){
						$j("#sumaPagar").val(valor).attr("readonly",true);
						$j("#forma_pago option").each(function(i){
						  	 if($j(this).val() != "RSIN"){					  		   
						  		$j(this).remove();
						  	 }
						  	 
					    });
	           		}
				 }
				 //FORMA DE PAGO VENTA PERSONAL
				 /*$j("#forma_pago").on("change",function(){
					  if($j(this).val() =="8"){
						  
						  if(parseInt($j.trim($j("#sumaPagar").val())) > 0){
					      	showPopWin('<%=request.getContextPath()%>/VentaPedido.do?method=abre_valida_usuario_vp', 300, 130,null,false);
					  	  }else{
					  		  alert("EL monto ingresado a pagar deber mayor a 0.");
					  		  $j("#forma_pago").val("0");
					  	  }
					  }
				 });*/
				 
				
			 	 function hab1()
			 	 {
		 			$j("#forma_pago option").each(function(i){
					  	 if($j(this).val() == "GAR"){					  		   
					  		$j(this).removeAttr('disabled');
					  	 }
					  	 
				    });
			 	 }	   
			 	
			 			
		</script>
	</body>
	</html:html>
