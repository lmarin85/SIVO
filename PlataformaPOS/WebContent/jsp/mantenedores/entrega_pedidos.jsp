
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/subModal.css" />
<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/subModal.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/mantenedores/entrega_pedidos.js"></script>

<script language="javascript">
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

	function buscar_pedido(){
		showPopWin("<%=request.getContextPath()%>/EntregaPedido.do?method=cargabuscarPedidos", 714, 425, cargaPedido, false);
	}	
	function cargaPagina(){	
			var pagina = document.getElementById("pagina").value;
			if(pagina != "encontrado"){
				showPopWin("<%=request.getContextPath()%>/EntregaPedido.do?method=cargabuscarPedidos", 714, 425, cargaPedido, false);
			}	
					
		}
	
		
 </script>
<style type="text/css">
<!--
TABLE {
	border-color: white
}
-->
</style>
<title><bean:message key="title.pos"/></title>
</head>
<body onload="cargaPagina();if(history.length>0)history.go(+1)">
<html:form action="/EntregaPedido?method=buscarPedidos">
		<html:hidden property="accion" styleId="accion" value="" />	
		<html:hidden property="cdg_busqueda" styleId="cdg_busqueda"/>
		<html:hidden property="pagina" styleId="pagina"/>	
		
	<table width="100%" border="0" cellspacing="0" align="center">
		<tr>
			<td align="left" bgcolor="#373737" id="txt4">
				<bean:message key="mantenedor.entrega.entrega"/>
			</td>
			<td align="right" bgcolor="#373737" id="txt4" width="380">
				<a href="#" onclick="buscar_pedido();"> <img src="images/lupa.png" width="15"
						height="15" border="0"  title="Ingreso de Graduación"  >
				</a>
				</td> 
			<td align="right" bgcolor="#373737" id="txt4"></td>
			<td width="30" align="right" bgcolor="#373737" id="txt4">
			</td>
			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="cerrar_ventanas();">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Salir" >
    				</a>
    			</td>
		</tr>
	</table>
	
	
		
		
	<table width="100%" cellspacing="1">
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.codigo"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:text property="codigo_suc" readonly="true" name="entregaPedidoForm" size="2" styleClass="fto"/>
                	<html:text property="codigo" readonly="true" name="entregaPedidoForm" size="8" styleClass="fto"/>
                </td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.cliente"/></td> 
				<td align="justify" bgcolor="#c1c1c1" id="txt5">
					<html:text property="cliente"  readonly="true"  size="15" styleId="nombre" styleClass="fto"/>
					<a href="#" onclick="javascript:buscar_pedido();">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar Cliente" >
    				</a>
				<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.divisa"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">  
                    <html:select property="divisa" name="entregaPedidoForm" style="" styleClass="fto" style="width:150px;" disabled="true" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="entregaPedidoForm" property="listaDivisas" label="descripcion" value="id" />
                    </html:select>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.fecha"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:text property="fecha_pedido"  readonly="true"  name="entregaPedidoForm" size="8" styleClass="fto"/>
                </td>
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="venta.pedido.forma.pago"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                    <html:select property="forma_pago" name="entregaPedidoForm" styleClass="fto" style="width:150px;" disabled="true" > 
                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="entregaPedidoForm" property="listaFormasPago" label="descripcion" value="id" />
                    </html:select>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                </td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" height="16"
					style="height: 16px">
					<bean:write name="entregaPedidoForm" property="nombre_cliente"/>  
					</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="venta.pedido.idioma"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                    <html:select property="idioma" name="entregaPedidoForm" styleClass="fto" style="width:150px;"  disabled="true" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="entregaPedidoForm" property="listaIdiomas" label="descripcion" value="id" />
                    </html:select>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="venta.pedido.hora"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16">
                	<html:text property="hora" readonly="true" name="entregaPedidoForm" size="8" styleClass="fto"/>
                </td>
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30"><bean:message key="venta.pedido.tipo.pedido"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">
                	<html:select property="tipo_pedido" name="entregaPedidoForm" styleClass="fto" style="width:150px;" disabled="true" > 
                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="entregaPedidoForm" property="listaTiposPedidos" label="descripcion" value="codigo" />
                    </html:select>
                </td>
                <td align="right" bgcolor="#c1c1c1" id="txt5" height="30"></td>
                <td align="right" bgcolor="#c1c1c1" id="txt5" height="30"></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30"><bean:message key="venta.pedido.convenio"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="30">
                	<html:select property="convenio" name="entregaPedidoForm" styleClass="fto" style="width:150px;"  disabled="true" >
						<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
						<html:optionsCollection name="entregaPedidoForm"
							property="listaConvenios" label="descripcion" value="id" />
					</html:select>	
                </td>
                <td align="right" bgcolor="#c1c1c1" id="txt5" height="30"></td>
                <td align="right" bgcolor="#c1c1c1" id="txt5" height="30"></td>
              </tr>
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.numero.sobre"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><html:text property="sobre" size="10" name="entregaPedidoForm" readonly="true"  styleClass="fto"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.agente"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:select property="agente" name="entregaPedidoForm" styleClass="fto"  disabled="true" > 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection name="entregaPedidoForm" property="listaAgentes" label="usuario" value="usuario" />
                    </html:select>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.promocion"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:select property="promocion" name="entregaPedidoForm" styleClass="fto" style="width:150px;" disabled="true" >
						<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
						<html:optionsCollection name="entregaPedidoForm"
							property="listaPromociones" label="descripcion" value="id" />
					</html:select>		
                </td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="venta.pedido.cambio"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt5">
					<html:text property="cambio" readonly="true" name="entregaPedidoForm" size="8" styleClass="fto"/>
				</td>
              </tr>
            </table>				
		
			
			
			<table width="100%" cellspacing="0" >
                <tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" width="25%"><bean:message key="venta.pedido.articulo"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="25%"><bean:message key="venta.pedido.descripcion"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="venta.pedido.precio.iva"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="venta.pedido.importe"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="venta.pedido.cantidad"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="venta.pedido.grupo"/></td>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="venta.pedido.estado"/></td>                    
                    <th scope="col" id="txt4" bgcolor="#373737" width="15%">                    	
                    </th>
                </tr>
              </table>			
			
			<!-- lineas del articulo -->
			<logic:present property="listaProductos" name="entregaPedidoForm">
                <div id="scrolling_pedido">
                <table width="100%" cellspacing="0" cellpadding="0">
               		<logic:iterate id="productos" property="listaProductos" name="entregaPedidoForm" >
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
                                <bean:define id="grupo" type="String">
                                    <bean:write name="productos" property="grupo"/>
                                </bean:define>
               		 
                        <tr>                              
                            <td id="txt5" bgcolor="#c1c1c1" width="25%" align="center">       
                            <a href="#" onclick="javascript:seleccionarProducto('${esfera}','${cilindro}','${diametro}');">                     	
                            	<bean:write name="productos" property="cod_barra" />  
                            </a>	                          	
                            </td>                            
                            <td id="txt5" bgcolor="#c1c1c1" width="25%">
                            	<bean:write name="productos" property="descripcion"/>
                            </td>                            
                            <td id="txt5" bgcolor="#c1c1c1" width="13%">
                            	<bean:write name="productos" property="precio"/>
                            </td>
                            <td id="txt5" bgcolor="#c1c1c1" width="12%">
                            	<bean:write name="productos" property="importe"/>
                            </td>
                            
                            <td id="txt5" bgcolor="#c1c1c1" width="9%">
                            	<bean:write name="productos" property="cantidad"/>
                            </td>                            
                            
                            <td id="txt5" bgcolor="#c1c1c1" width="12%">
                            	<bean:write name="productos" property="grupo"/>
                            </td>
 
                            <td id="txt5" bgcolor="#c1c1c1" width="10%">
                            	<bean:write name="productos" property="estado"/>
                            </td>
                            
                            <td id="txt5" bgcolor="#c1c1c1" width="9%" align="center">
                            	
    						</td>
                        </tr>
                    </logic:iterate>
                 </table>
                 </div>
                </logic:present>
				
				
				<table width="40%" cellspacing="0" align="center" >
		        	<tr>
		        		<td colspan="6" id="txt4" bgcolor="#373737" ><bean:message key="venta.pedido.graduacion.articulo"/></td>
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
				  	</tr>
				</table>
				<!-- informacion de graduacion -->
			<table width="100%" cellspacing="0" align="center">
			<tr>
				<td id="txt4" bgcolor="#373737"><bean:message key="venta.pedido.graduacion"/></td>
				<td id="txt4" bgcolor="#373737" align="right">
    			</td>
    			<td id="txt4" bgcolor="#373737" align="right" width="40">
    				<a href="#" onclick="javascript:detalle('detalle_graduacion')">
      						<img src="images/detalle.png" width="15" height="15" border="0" title="Ocultar / Mostrar Detalle">
    				</a>	
				</td>
			</tr>
			</table>
			<div id="detalle_graduacion" style="display:">
			<bean:define id="graduacion_seleccionada" name="entregaPedidoForm" property="graduacion"/>
			<table width="100%" cellspacing="1" cellpadding="1" align="center">
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.fecha"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="fecha"/>' size="6">
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
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="orden"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.o.d"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_esfera"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_cilindro"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_eje"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_adicion"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_esfera_cerca"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_n"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="true" value='<bean:write name="graduacion_seleccionada" property="OD_p"/>' size="3">
			    </td>
			  </tr>
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.doctor"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="doctor"/>' size="15">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.o.i"/></td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="OI_esfera"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="OI_cilindro"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto"  readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="OI_eje"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="OI_adicion"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="OI_esfera_cerca"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="OI_n"/>' size="3">
			    </td>
			    <td id="txt5" bgcolor="#c1c1c1">
			    	<input type="text" class="fto" readonly="readonly" value='<bean:write name="graduacion_seleccionada" property="OI_p"/>' size="3">
			    </td>
			  </tr>
			</table>
			</div>
				
				
				<!--  -->
				<!-- informacion de total -->
				
				<table width="100%" cellspacing="1">
					<tr><td colspan="7" id="txt4" bgcolor="#373737" >
						<bean:message key="venta.pedido.totales"/></td>
					<td id="txt4" bgcolor="#373737" >						
					</td>
					</tr>
					<tr>
					    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
					    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.subtotal"/></td>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.desc"/></td>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.porcentaje.descuento"/></td>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.total"/></td>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.anticipo"/></td>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.total.pendiente.anticipo"/></td>
					  </tr>
					  <tr>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.f.entrega"/></td>
					    <td id="txt5" bgcolor="#c1c1c1"><html:text property="fecha_entrega" size="10" name="entregaPedidoForm" styleClass="fto" readonly="true" /></td>
					    <td id="txt5" bgcolor="#c1c1c1"><html:text property="subTotal" size="10" name="entregaPedidoForm" styleClass="fto" readonly="true" /></td>
					    <td id="txt5" bgcolor="#c1c1c1"><html:text property="descuento" size="10" name="entregaPedidoForm" styleClass="fto" readonly="true" /></td>
					    <td id="txt5" bgcolor="#c1c1c1"><html:text property="dtcoPorcentaje" size="10" name="entregaPedidoForm" styleClass="fto" readonly="true" /></td>
					    <td id="txt5" bgcolor="#c1c1c1"><html:text property="total" size="10" name="entregaPedidoForm" styleClass="fto" styleId="total" readonly="true" /></td>
					    <td id="txt5" bgcolor="#c1c1c1"><html:text property="anticipo" size="10" name="entregaPedidoForm" styleClass="fto" readonly="true" /></td>
					    <td id="txt5" bgcolor="#c1c1c1"><html:text property="totalPendiante" size="10" name="entregaPedidoForm" styleClass="fto" readonly="true" /></td>
					  </tr>
					  <tr>
					    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="venta.pedido.notas"/></td>
					    <td colspan="7" id="txt5" bgcolor="#c1c1c1" align="left"><html:text property="nota" size="100" name="entregaPedidoForm" styleClass="fto" readonly="true" /></td>
					  </tr>
				</table>
									
		
	</html:form>
</body>
</html>