<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script language="javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/reportes/listado_trabajos_pendientes.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/jquery.datepick.js""></script>
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
		
		
		
<title><bean:message key="title.pos"/></title>
<script type="text/javascript">
			var $j = jQuery.noConflict();
			load();
 
			$j(function() {
			$j('#popupDatepicker').datepick();
			});
			
			$j(function() {
			$j('#popupDatepicker2').datepick();
			});
           function imprimirlistadoTrabajosPendientes(){
           		var voucher;
           		
           		var fecha_fin= document.listadoTrabajosPendientesForm.fechaPedidoTer.value;
            	var fecha_ini = document.listadoTrabajosPendientesForm.fechaPedidoIni.value;
            	var cerrado = document.listadoTrabajosPendientesForm.cerrado.value;
            	var local = document.listadoTrabajosPendientesForm.local.value;
            	var anulado = document.listadoTrabajosPendientesForm.anulado.value;
            	var divisa = document.listadoTrabajosPendientesForm.divisa.value;
            	var codigo = document.listadoTrabajosPendientesForm.codigo.value;
            	var cliente = document.listadoTrabajosPendientesForm.cliente.value;
           		
           		var url = "/CreaListadoTrabajosPendientesServlet?cdg="+codigo+
           		"&cliente="+cliente+
           		"&divisa="+divisa+			
           		"&fecha_ini="+fecha_ini+
           		"&fecha_fin="+fecha_fin+
           		"&cerrado="+cerrado+
           		"&anulado="+anulado+
           		"&local="+local;	 
				window.open("<%=request.getContextPath()%>"+url);
           }
           function cerrar()
           {
           		parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
           }
           function busqueda_cliente()
			{			
				
				showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&pagina=pedido", 714, 425,cargaClientePedido, false);
			   	//window.open("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes","popup","width=800, height=400,location=no,top=100,left=120");
			
			}
			function validaBuscar(tipo)
            {	
            	/*
            	var cliente=document.getElementById("cliente").value;
            	var codigo = document.getElementById("codigo").value;
            	codigo = trim_trabajos_pendientes(codigo);
            	if(""==cliente && ""==codigo){
            		alert("Debe ingresar al menos un cliente o número de encargo para realizar la busqueda");
            		location.reload();
            	}else{
            		document.forms[0].submit();
            	}
            	*/
            	/*
            	 * LMARIN 20131230
            	 * Se corrije el mal ingreso de la fecha lo que producia errores en los informes de los listados.
            	 * Se ingresa como new Date(2000,12-1,01)
            	 */
            	var f1 = document.listadoTrabajosPendientesForm.fechaPedidoTer.value.split(",");
            	var f2 = document.listadoTrabajosPendientesForm.fechaPedidoIni.value.split(",");
            	
            	
            	var fecha_fin= new Date(f1[2],parseInt(f1[1])-1,f1[0]);
            	var fecha_ini = new Date(f2[2],parseInt(f2[1])-1,f2[0]);
            	
            	     	      
            	if(""==document.listadoTrabajosPendientesForm.fechaPedidoTer.value || ""==document.listadoTrabajosPendientesForm.fechaPedidoIni.value){
            		alert("Debe ingresar un rango de fechas para realizar la busqueda");
            		document.listadoTrabajosPendientesForm.action = '<%=request.getContextPath()%>/ListadoTrabajosPendientes.do?method=cargaFormulario';
            		document.listadoTrabajosPendientesForm.submit();
            	}else{
            		var diferencia = fecha_fin.getTime()-fecha_ini.getTime();
            		var dias = Math.floor(diferencia / (3600000*24)); 
            		if (dias > 731 || dias < 0) {
            			alert("El rango de fechas, no puede ser superior a dos años para realizar la busqueda");
            			document.listadoTrabajosPendientesForm.action = '<%=request.getContextPath()%>/ListadoTrabajosPendientes.do?method=cargaFormulario';
                		document.listadoTrabajosPendientesForm.submit();
    
					}
            		else
            		{
            			imprimirlistadoTrabajosPendientes();
            			//document.forms[0].submit();
            		}
            	}
            	
            	
                
            }
            
        </script>
</head>
<body>
	<html:form action="/ListadoTrabajosPendientes?method=buscar">
		<html:hidden property="cliente" styleId="cliente" value=""/>
		<table width="100%" cellspacing="0">
			<tr>
				<td align="left" bgcolor="#373737" id="txt4"><bean:message
						key="listado.trabajos.listado.trabajos" />
				</td>
				<td align="right" bgcolor="#373737" id="txt4"><a href="#"
					onclick="validaBuscar()"> <img src="images/lupa.png" width="15"
						height="15" border="0" title="Buscar listado de trabajos pendientes" > </a></td>
				<td width="30" align="right" bgcolor="#373737" id="txt1"><a
					href="#" onclick="cerrar()"> <img src="images/cancel.png" width="15"
						height="15" border="0" title="Cerrar"> </a></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="1">
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message
						key="listado.trabajos.codigo" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text property="codigo"
						value="" styleClass="fto" styleId="codigo" size="15"/>
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message
						key="venta.directa.cliente" /></td>
				<td id="txt5" bgcolor="#c1c1c1">
						<input type="text" Class="fto" id="nombre" name="nombre" value=""/>
		    	<a href="#" onclick="javascript:busqueda_cliente()">
      						<img src="images/lupa.png" width="15" height="15" border="0" >
    			</a>
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message
						key="listado.trabajos.divisa" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1">
				<html:select property="divisa" styleClass="fto" style="width:150px;"> 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection  property="listaDivisas" label="descripcion" value="id" />
                    </html:select>
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message
						key="listado.trabajos.fecha.pedido" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text size="15"
						property="fechaPedidoIni" value="" styleClass="fto" styleId="popupDatepicker2" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1">Fecha Fin</td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text size="15"
						property="fechaPedidoTer"value="" styleClass="fto" styleId="popupDatepicker" readonly="true"/>
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message
						key="listado.trabajos.local" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3">
					<html:select property="local" styleClass="fto" title="Lista de Sucursales">
			            <html:optionsCollection property="colSucursales" label="descripcion" value="sucursal" styleClass="fto"/>
			    	</html:select>
				<td id="txt5" bgcolor="#c1c1c1">
					<!--<bean:message key="listado.trabajos.listado.detallado" />-->
					<bean:message
						key="listado.trabajos.cerrado" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1">
				<!--
					<html:select property="listadoDetallado" value="" styleClass="fto">
		    		<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
		    		<html:option value="N"><bean:message key="listado.presupuesto.no"/></html:option>
		    		<html:option value="S"><bean:message key="listado.presupuesto.si"/></html:option>
		    		</html:select>
		    	-->
		    		<html:select property="cerrado" value="" styleClass="fto">
		    		<html:option value="N"><bean:message key="listado.presupuesto.no"/></html:option>
		    		<!--
		    		<html:option value="S"><bean:message key="listado.presupuesto.si"/></html:option>
		    		-->
		    		
		    	</html:select>
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message
						key="listado.trabajos.anulado" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1">
					<html:select property="anulado" value="" styleClass="fto">
		    		<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
		    		<html:option value="N"><bean:message key="listado.presupuesto.no"/></html:option>
		    		<html:option value="S"><bean:message key="listado.presupuesto.si"/></html:option>
		    	</html:select>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="6"></td>
			</tr>
		</table>
		<br>



		<logic:present property="listaPendientes"
			name="listadoTrabajosPendientesForm">
			<div id="scrolling">

				<logic:iterate id="pendientes" property="listaPendientes"
					name="listadoTrabajosPendientesForm">
					<table width="100%" cellspacing="0" cellpadding="0">
						<tr bgcolor="#66FFFF">
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.serie.num" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.fecha" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.numero.caja" /></td>
							<td scope="col" id="txt4" bgcolor="#373737">Cliente</td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.nombre" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.apellidos" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.porcentaje.descuento" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.forma.pago" /></td>
							<td scope="col" id="txt4" bgcolor="#373737">Albarán</td>
						</tr>

						<tr bgcolor="#66FFFF">
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="serie" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="fecha" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="numeroCaja" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="cliente" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="nombre" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="apellidos" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="descuento1" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="fPago" /></td>
							<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="albaran" /></td>
						</tr>
					</table>

					<table width="100%" cellspacing="0" cellpadding="0">
						<tr bgcolor="#66FFFF">
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.articulo" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.descripcion" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.cantidad" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.precio" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="listado.trabajos.porcentaje.descuento" /></td>
							<td scope="col" id="txt4" bgcolor="#373737"></td>
						</tr>
					
					<logic:iterate id="linea" property="lineas" name="pendientes">
						
							<tr bgcolor="#66FFFF">
								<td id="txt5" bgcolor="#c1c1c1"><bean:write name="linea" property="articulo" /></td>
								<td id="txt5" bgcolor="#c1c1c1"><bean:write name="linea" property="descripcion" /></td>
								<td id="txt5" bgcolor="#c1c1c1"><bean:write name="linea" property="cantidad" /></td>
								<td id="txt5" bgcolor="#c1c1c1">$<bean:write name="linea" property="precio" /></td>
								<td id="txt5" bgcolor="#c1c1c1"><bean:write name="linea" property="descuento" /></td>
								<td id="txt5" bgcolor="#c1c1c1"><bean:write name="linea" property="tipo" /></td>
							</tr>
						
					</logic:iterate>
					</table>
				<table width="100%" cellspacing="0" cellpadding="0">
				<tr >
						<td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
						<td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
						<td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
						<td id="txt5" bgcolor="#c1c1c1">Total Encargo</td>
						<td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
						<td id="txt5" bgcolor="#c1c1c1">$<bean:write name="pendientes" property="total" /></td>
						<td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
						<td id="txt5" bgcolor="#c1c1c1">Boleta</td>
						<td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
						<td id="txt5" bgcolor="#c1c1c1"><bean:write name="pendientes" property="numeroBoleta" /></td>
					</tr>
					<tr >
						<td id="txt5" ><bean:write name="pendientes" property="notas" /></td>
					</tr>
					<tr >
						<td id="txt5" >&nbsp;</td>
					</tr>
				</table>
				</logic:iterate>
			</div>
		</logic:present>
	</html:form>

</body>
</html:html>