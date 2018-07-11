<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/venta/liberacion_encargos.js"></script>
<script type="text/javascript" src="js/utils.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>		
		<script type="text/javascript" src="js/prototype.js"></script>	
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>			
		<script type="text/javascript" src="js/jquery.datepick.js""></script>			
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
<script type="text/javascript">

var $j = jQuery.noConflict();

$j(function() {
	$j('#popupDatepicker2').datepick();
});

$j(function() {
	$j('#popupDatepicker2hasta').datepick();
});

function cerrar_ventanas()
        	{
					
					var boton = confirm("Se perderan todos los datos, \u00BFEsta seguro de cancelar la venta?");
	        		if (boton)
	        		{	
	        			parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
	        			
	        		}
	        		else
	        		{
	        			self.close();
	        		}
        		
        		
        	}
 </script>

<title><bean:message key="title.pos"/></title>
</head>
<!-- MODIFICADO 20141009 A PEDIDO DE ISAAC SANTANA , SE ELIMINA "Marcar" "Cant.Solicitar" "No solicitar"  -->
<body onload="carga_inicial();if(history.length>0)history.go(+1);inicio_pagina_liberacion()">
	<table width="100%" border="0" cellspacing="0" align="center">
		<tr>
			<td align="left" bgcolor="#373737" id="txt4">
				<bean:message key="liberacion.encargos.liberacion.encargos"/>
			</td>
			<td align="right" bgcolor="#373737" id="txt4" width="550">
			<a href="#" onclick="javascript:busar_liberacion()"  >
      						<img src="images/lupa.png" width="15" height="15" border="0" >
    		</a>
    		</td>
			<td align="right" bgcolor="#373737" id="txt4">
			   		
			<a href="#" onclick="liberacion_pedidod();" id="enviar"> <img src="images/check.png" width="15" height="15"
					border="0"  title="Liberación de Encargos" > </a></td>
			<td width="30" align="right" bgcolor="#373737" id="txt4"><a
				href="#" onclick="cerrar_ventanas()"> <img src="images/cancel.png" width="15"
					height="15" border="0" title="Cerrar página liberación" > </a></td>
		</tr>
	</table>
	
	
	<html:form action="Liberaciones?method=buscarLiberacion">
		<html:hidden property="accion" styleId="accion" value="" />
		<html:hidden property="identPedtv" styleId="identPedtv"  />
		<html:hidden property="mensaje" styleId="mensaje"  />
		<html:hidden property="codigoLocal" styleId="codigoLocal"  />
		<html:hidden property="codigoDetalle" styleId="codigoDetalle"  />
		<html:hidden property="grupoDetalle" styleId="grupoDetalle"  />
		<html:hidden property="poscroll" styleId="poscroll"  />
		<html:hidden property="index" styleId="indexForm"  />
		<html:hidden property="index2" styleId="index2"  />
		<html:hidden property="pagina_status" styleId="pagina_status"  />
		<html:hidden property="respuestaLiberacion" styleId="respuestaLiberacion"  />
		<html:hidden property="lineaDetalle" styleId="lineaDetalle"  />
				
		<div id="id_tabla0">
			<table width="100%"  border="0" cellspacing="0">
				<tr id="" bgcolor="#c1c1c1">
					<td id="txt5"   width="10%" align="center" colspan="9"  >
						Fecha desde: <html:text property="fecha" readonly="true" name="busquedaLiberacionesForm"  styleId="popupDatepicker2" size="8" styleClass="fto" />
					</td>
					<td id="txt5"   width="10%" align="center" colspan="1"  >
						Fecha hasta: <html:text property="fechaHasta" readonly="true" name="busquedaLiberacionesForm"  styleId="popupDatepicker2hasta" size="8" styleClass="fto" />
					</td>					
				</tr>
				<tr id="" bgcolor="#c1c1c1">
				</tr>
			</table>		
		</div>
			
			
		<div id="id_tabla1" >		
			<table width="100%"  border="0" cellspacing="0">
				<tr>
					<td bgcolor="#373737" id="txt4" width="10%" align="left"><bean:message key="liberacion.encargos.codigo"/></td>
					<td bgcolor="#373737" id="txt4" width="100px" align="left"><bean:message key="liberacion.encargos.fecha.pedido"/></td>
					<td bgcolor="#373737" id="txt4" width="100px" align="left"><bean:message key="liberacion.encargos.fecha.entrega"/></td>
					<td bgcolor="#373737" id="txt4"  width="80px" align="center"><bean:message key="liberacion.encargos.cliente"/></td>
					<td bgcolor="#373737" id="txt4" width="80px" align="left"><bean:message key="liberacion.encargos.agente"/></td>
					<td bgcolor="#373737" id="txt4"  width="80px" align="center"><bean:message key="liberacion.encargos.grupo"/></td>
					<td bgcolor="#373737" id="txt4"  width="80px" align="center">
						<html:select styleId="txt4"  property="estado_encargo" style=" background-color:#373737;" name="busquedaLiberacionesForm">
							<html:option value="-1">Estado Encargo</html:option>
							<html:optionsCollection name="busquedaLiberacionesForm" property="listaEstados" label="descripcion" value="id"  />  
						</html:select>
					</td>
					<!-- ELIMINADO 0 -->
					<td bgcolor="#373737" id="txt4"  width="80px" align="center"><bean:message key="liberacion.encargos.seleccionar"/></td>
								
				</tr>
			</table>
		</div>				
		<div id="scrolling_liberacion" >
			<logic:present property="listaPedidos"
						name="busquedaLiberacionesForm">
				<logic:iterate id="listaPedidos" property="listaPedidos"
								name="busquedaLiberacionesForm" indexId="index">						
								<bean:define id="codigo" type="String" >
									<bean:write name="listaPedidos" property="cod_lista_lib" />
								</bean:define>
								<bean:define id="linea" type="String" >
									<bean:write name="listaPedidos" property="linea" />
								</bean:define>
								<bean:define id="grupo" type="String" >
									<bean:write name="listaPedidos" property="grupo" />
								</bean:define>
								
								<logic:equal value="OK" name="listaPedidos" property="respuestaValidaLiberacion" >
										
								<table width="100%" cellspacing="0" id="contenido">
									<tr id="${index}" bgcolor="#c1c1c1">

										<td id="txt5"  width="10%" align="left">
										<a href="#" class="cod" data-key="${codigo}/${grupo}" onclick="seleccionaDetalle('${codigo}','${grupo}','${index}','${linea}');" title="Ver detalle Encargo" >
											<bean:write name="listaPedidos" property="cod_lista_lib" />
										</a>	
										</td>
										<td id="txt5" class="row${index}" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha" />
										</td>
										<td id="txt5" class="row${index}" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha_entrega" />
										</td>
										<td id="txt5" class="row${index}" width="80px" align="center"><bean:write
												name="listaPedidos" property="cliente" />
										</td>
										<td id="txt5" class="row${index}" width="80px" align="left"><bean:write
												name="listaPedidos" property="agente" />
										</td>
										<td id="txt5" class="row${index}" width="80px" align="center"><bean:write
												name="listaPedidos" property="grupo" />
										</td>
										
										<td id="txt5" class="row${index}" width="80px" align="center" >	
										<logic:equal value="true" name="listaPedidos" property="conTriosValidos">	
											<html:checkbox name="listaPedidos" property="checked" indexed="true"  title="Seleccionar encargo a Liberar" styleClass="chk">												
											</html:checkbox>
										</logic:equal>	
										<logic:notEqual value="true" name="listaPedidos" property="conTriosValidos">
											<html:checkbox name="listaPedidos" property="checked" disabled="true" indexed="true" title="Seleccionar encargo a Liberar">												
											</html:checkbox>
										</logic:notEqual>
										</td>
									
									</tr>
								</table>
								</logic:equal>
								
								<logic:equal value="GRADUACION" name="listaPedidos" property="respuestaValidaLiberacion" >
								
								<table width="100%" cellspacing="0" id="contenidoError" bgcolor="#DF0101" >
									<tr id="${index}" bgcolor="#DF0101"  >

										<td id="txt5"  width="10%" align="left">
										<a href="#" onclick="mensajeError('GRADUACION');" title="Ver detalle Encargo" >
											<bean:write name="listaPedidos" property="cod_lista_lib" />
										</a>	
										</td>
										<td id="txt5" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha" />
										</td>
										<td id="txt5"  width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha_entrega" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="cliente" />
										</td>
										<td id="txt5"  width="80px" align="left"><bean:write
												name="listaPedidos" property="agente" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="grupo" />
										</td>
										
										<td id="txt5" width="80px" align="center" >			
											<html:checkbox name="listaPedidos" property="checked" disabled="true" indexed="true" title="Seleccionar encargo a Liberar" >												
											</html:checkbox>
										</td>
									
									</tr>
								</table>								
								</logic:equal>
								
								
								<logic:equal value="TRIO" name="listaPedidos" property="respuestaValidaLiberacion" >
								
								<table width="100%" cellspacing="0" id="contenidoError">
									<tr id="${index}" bgcolor="#DF0101">

										<td id="txt5"  width="10%" align="left">
										<a href="#" onclick="mensajeError('TRIO');" title="Ver detalle Encargo" >
											<bean:write name="listaPedidos" property="cod_lista_lib" />
										</a>	
										</td>
										<td id="txt5" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha" />
										</td>
										<td id="txt5"  width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha_entrega" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="cliente" />
										</td>
										<td id="txt5"  width="80px" align="left"><bean:write
												name="listaPedidos" property="agente" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="grupo" />
										</td>
										
										<td id="txt5" width="80px" align="center" >			
											<html:checkbox name="listaPedidos" property="checked" disabled="true" indexed="true" title="Seleccionar encargo a Liberar" >												
											</html:checkbox>
										</td>
									
									</tr>
								</table>
								</logic:equal>
								<logic:equal value="OK_L" name="listaPedidos" property="respuestaValidaLiberacion" >
										
								<table width="100%" cellspacing="0" id="contenido">
									<tr id="${index}" bgcolor="#c1c1c1">

										<td id="txt5"  width="10%" align="left">
										<a href="#" class="cod" data-key="${codigo}/${grupo}" onclick="seleccionaDetalle('${codigo}','${grupo}','${index}','${linea}');" title="Ver detalle Encargo" >
											<bean:write name="listaPedidos" property="cod_lista_lib" />
										</a>	
										</td>
										<td id="txt5" class="row${index}" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha" />
										</td>
										<td id="txt5" class="row${index}" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha_entrega" />
										</td>
										<td id="txt5" class="row${index}" width="80px" align="center"><bean:write
												name="listaPedidos" property="cliente" />
										</td>
										<td id="txt5" class="row${index}" width="80px" align="left"><bean:write
												name="listaPedidos" property="agente" />
										</td>
										<td id="txt5" class="row${index}" width="80px" align="center"><bean:write
												name="listaPedidos" property="grupo" />
										</td>
										
										
										<td id="txt5" class="row${index}" width="80px" align="center" >			
											<html:checkbox name="listaPedidos" property="checked" indexed="true" title="Seleccionar encargo a Liberar" styleClass="chk">												
											</html:checkbox>
										</td>
									
									</tr>
								</table>
								</logic:equal>
								
								<logic:equal value="GRADUACION_L" name="listaPedidos" property="respuestaValidaLiberacion" >
								
								<table width="100%" cellspacing="0" id="contenidoError" bgcolor="#DF0101" >
									<tr id="${index}" bgcolor="#DF0101"  >

										<td id="txt5"  width="10%" align="left">
										<a href="#" onclick="mensajeError('GRADUACION_L');" title="Ver detalle Encargo" >
											<bean:write name="listaPedidos" property="cod_lista_lib" />
										</a>	
										</td>
										<td id="txt5" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha" />
										</td>
										<td id="txt5"  width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha_entrega" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="cliente" />
										</td>
										<td id="txt5"  width="80px" align="left"><bean:write
												name="listaPedidos" property="agente" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="grupo" />
										</td>
										
										
										<td id="txt5" width="80px" align="center" >			
											<html:checkbox name="listaPedidos" property="checked" disabled="true" indexed="true" title="Seleccionar encargo a Liberar" >												
											</html:checkbox>
										</td>
									
									</tr>
								</table>								
								</logic:equal>
								
								
								<logic:equal value="OJO_L" name="listaPedidos" property="respuestaValidaLiberacion" >
								
								<table width="100%" cellspacing="0" id="contenidoError">
									<tr id="${index}" bgcolor="#DF0101">

										<td id="txt5"  width="10%" align="left">
										<a href="#" onclick="mensajeError('OJO_L');" title="Ver detalle Encargo" >
											<bean:write name="listaPedidos" property="cod_lista_lib" />
										</a>	
										</td>
										<td id="txt5" width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha" />
										</td>
										<td id="txt5"  width="100px" align="left"><bean:write
												name="listaPedidos" property="fecha_entrega" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="cliente" />
										</td>
										<td id="txt5"  width="80px" align="left"><bean:write
												name="listaPedidos" property="agente" />
										</td>
										<td id="txt5" width="80px" align="center"><bean:write
												name="listaPedidos" property="grupo" />
										</td>
										<td id="txt5" width="80px" align="center">
										</td>
										
										<td id="txt5" width="80px" align="center" >			
											<html:checkbox name="listaPedidos" property="checked" disabled="true" indexed="true" title="Seleccionar encargo a Liberar" >												
											</html:checkbox>
										</td>
									
									</tr>
								</table>
								</logic:equal>
								
				</logic:iterate>
			</logic:present>
		</div>	
		
							
		<br>
		
									
		<table width="100%" border="0" >				
			<tr>
				<td colspan="1" width="100%">
				 <div id="id_detalle_liberacion" >
					<table width="570px" border="0" cellspacing="0">
						<tr>
							<td colspan="9" align="left" bgcolor="#373737" id="txt4">
								<bean:message key="liberacion.encargos.detalle.encargo"/></td>
						</tr>
						<tr>
							<td bgcolor="#373737" id="txt4" width="2%"><bean:message key="liberacion.encargos.n"/></td>
							<td bgcolor="#373737" id="txt4" align="center" width="10%"><bean:message key="liberacion.encargos.articulo"/></td>
								<td bgcolor="#373737" id="txt4" align="center" width="40%">
								<bean:message key="liberacion.encargos.descripcion" />
								</td>
								<td bgcolor="#373737" id="txt4" align="left" width="6%"><bean:message
										key="liberacion.encargos.1hora" />
								</td>
								<td bgcolor="#373737" id="txt4" width="5%" align="center"><bean:message key="liberacion.encargos.ojo"/></td>
							<td bgcolor="#373737" id="txt4"  width="8%"  align="center"><bean:message key="liberacion.encargos.esfera"/></td>
							<td bgcolor="#373737" id="txt4"  width="5%"><bean:message key="liberacion.encargos.cilindro"/></td>
							<td bgcolor="#373737" id="txt4" width="5%"><bean:message key="liberacion.encargos.cantidad"/></td>
							<td bgcolor="#373737" id="txt4" width="5%"><bean:message key="liberacion.encargos.detalle"/></td>
						</tr>
					</table>
					</div>
					
					<div id="scroll_encargo_detalle">
						<table width="100%" cellspacing="0"  id="contenido2" >
							<% int n=1; %>
							<logic:present property="listaDetalle"
								name="busquedaLiberacionesForm">
								<logic:iterate id="listaDetalle" property="listaDetalle"
									name="busquedaLiberacionesForm" indexId="index2">
									
									<tr height="20px"  id="detalle${index2}"  bgcolor="#c1c1c1">


										<bean:define id="codigo" type="String">
											<bean:write name="listaDetalle" property="codigo" />
										</bean:define>
										
										<td id="txt5"   width="2%">
											<% out.print(n); %>
										</td>
										<td id="txt5"  align="left" width="10%" ><bean:write name="listaDetalle"
												property="articulo" /></td>
										<td id="txt5" align="center"  width="40%">
											<bean:write name="listaDetalle" property="descripcion" />
										</td>
										<td id="txt5"  align="left" width="5%"><bean:write
												name="listaDetalle" property="unahora" />
										</td>
										<td id="txt5"  align="left" width="5%"><bean:write
												name="listaDetalle" property="ojo" />
										</td>
										<td id="txt5"   align="left"  width="8%">
											<logic:notEqual value="999" property="esfera" name="listaDetalle" >
												<bean:write name="listaDetalle" property="esfera" />
											</logic:notEqual>
											<logic:equal value="999" property="esfera" name="listaDetalle" >
												&nbsp;
											</logic:equal>
										</td>
										<td id="txt5"   align="center"  width="5%">
											<logic:notEqual value="999" property="cilindro" name="listaDetalle" >
												<bean:write name="listaDetalle" property="cilindro" />
											</logic:notEqual>
											<logic:equal value="999" property="cilindro" name="listaDetalle" >
												&nbsp;
											</logic:equal>
										</td>
										<td id="txt5"   align="center"  width="5%"><bean:write
												name="listaDetalle" property="cantidad" />
										</td>
										<td id="txt5"   align="center"  width="5%">
											<a href="#" onclick="javascript:detalle_suplemento('${codigo}','${index2}');">
	      										<img src="images/add.png" width="15" height="15" border="0" title="Detalle de Suplemento" />
	    									</a>
										</td>
									</tr>
									<% n++; %>
								</logic:iterate>
							</logic:present>
						</table>
					</div>		
					</td>
					<td width="150px" colspan="1">
						<div id="scroll_suplemento"  >
							<table width="100%" border="0" cellspacing="0">
								<tr>
									<td colspan="8" align="left" bgcolor="#373737" id="txt4">
										<bean:message key="liberacion.encargos.suplementos"/></td>
								</tr>
								<tr>
									<td bgcolor="#373737" id="txt4" width="5%" >
										<bean:message key="liberacion.encargos.id"/>
									</td>
									<td bgcolor="#373737" id="txt4" align="center" width="50%" colspan="6">
										<bean:message key="liberacion.encargos.descripcion"/>
									</td>
									<td bgcolor="#373737" id="txt4" align="center" width="10%">
										<bean:message key="liberacion.encargos.valor"/>
									</td>
										
								</tr>
								<logic:present property="listaSuplementos"
								name="busquedaLiberacionesForm">
								<logic:iterate id="listaSuplementos" property="listaSuplementos"
									name="busquedaLiberacionesForm">									
								<tr>
									<td  id="txt5" bgcolor="#c1c1c1" width="5%" >
										<bean:write name="listaSuplementos" property="tratami" />
									</td>
									<td id="txt5" align="center" bgcolor="#c1c1c1" width="50%" colspan="6">
										<bean:write name="listaSuplementos" property="descripcion" />
									</td>
									<td bgcolor="#c1c1c1"  id="txt5" align="center" width="10%">
										<bean:write name="listaSuplementos" property="valor" />
									</td>
										
								</tr>
								</logic:iterate>
								</logic:present>
							</table>	
					</div>	
					
																		
				</td>				
			</tr>
		</table>
	</html:form>
</body>
<script>

	//$j(".chk").attr('checked', true);
	
	$j(function(){
		
		//Obtengo encargos repetidos	
		var arr = new Array();
		
		$j(".cod").each(function(i){
			arr[i] = $j(this).attr("data-key");
		});
		//ordeno arreglo
		var arr_or = arr.slice().sort();
	
		var res = [];
		
		for (var i = 0; i < arr.length - 1; i++) {
		    if(arr_or[i + 1] == arr_or[i]) {
		        res.push(arr_or[i]);
		    }
		}
		//Elimino encargos repetidos
		z = 1;
		$j(".cod").each(function(e){
			for(var i=0;i <=res.length;i++){	
					if ($j(this).attr("data-key") ==res[i]){
					    if(z%2){
				    		$j(this).parent().parent().parent().remove()
				    	}
						z++;	    
				    }
			}
		});
	
	});
</script>
</html>