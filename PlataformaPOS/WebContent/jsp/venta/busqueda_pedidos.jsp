<%-- 
    Document   : busqueda_pedidos
    Created on : 28-dic-2011, 10:29:14
    Author     : Advice70
--%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <script type="text/javascript" src="js/utils.js"></script>
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
        <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>	
        <script type="text/javascript" src="js/venta/busqueda_pedidos.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>		
		<script type="text/javascript" src="js/jquery.datepick.js""></script>			
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>	
		<script type="text/javascript">
			load();
			var $j = jQuery.noConflict();
		
			$j(function() {
				$j('#popupDatepicker').datepick();
			});
			
		</script>
        
        <title><bean:message key="title.pos"/></title>
    </head>
    <body onload="if(history.length>0)history.go(+1)" >
        <html:form action="/BusquedaPedidos?method=buscar" styleId="busqueda">
        	
        <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			<bean:message key="busqueda.pedidos.titulo" />
      		</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Encargos"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	
        <table width="100%" align="center">    	
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="busqueda.pedidos.codigo" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="encargo" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="busqueda.pedidos.rut"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="cliente" styleClass="fto" maxlength="8" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%">
    		<bean:message key="busqueda.pedidos.fecha"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2" width="70%">
				<html:text property="fecha" styleClass="fto" readonly="true" styleId="popupDatepicker"/>
			</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%">
    		<bean:message key="busqueda.pedidos.agente"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2" width="70%">
				<html:select property="agente" name="busquedaPedidosForm" styleClass="fto"> 
					<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
					<html:optionsCollection name="busquedaPedidosForm" property="lista_agentes" label="usuario" value="usuario" />
				</html:select>
			</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<a href="#" onclick="javascript:buscarPedidos()" id="enviar">
      						<img src="images/lupa.png" width="16" height="16" border="0" title="Buscar" />
    				</a>
				</td>
    	</tr>
        </table>
        <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="10%">Agente</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Codigo</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Fecha Pedido</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Hora</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Fecha Entrega</td>                    
                    <td id="txt4" bgcolor="#373737" width="25%">Anticipo</td>
                    <td id="txt4" bgcolor="#373737" width="5%" align="right">
                    </td>
                </tr>
        </table>
       <logic:present property="lista_pedidos" name="busquedaPedidosForm">
       <div id="scrolling">
       <table width="100%" cellspacing="0">
       			<logic:equal value="" name="estado_lista" scope="session">
	                <tr>
	                	<td colspan="6" id="txt5" bgcolor="#c1c1c1" align="center">
	                		NO SE ENCONTRARON RESULTADOS
	                	</td>
	                </tr>
                </logic:equal>
                <logic:notEmpty property="lista_pedidos" name="busquedaPedidosForm">
	                <logic:iterate property="lista_pedidos" name="busquedaPedidosForm" id="pedidos">
	                        <tr bgcolor="#66FFFF">
	                            
	                                <bean:define id="agente" type="String">
	                                    <bean:write name="pedidos" property="agente"/>
	                                </bean:define>
	                                <bean:define id="fechaPedido" type="String">
	                                    <bean:write name="pedidos" property="fechaPedido"/>
	                                </bean:define>
	                                  <bean:define id="fechaEntrega" type="String">
	                                    <bean:write name="pedidos" property="fechasEntragas"/>
	                                </bean:define>                            
	                                <bean:define id="anticipo" type="String">
	                                    <bean:write name="pedidos" property="anticipo"/>
	                                </bean:define>
	                                 <bean:define id="cdg" type="String">
	                                    <bean:write name="pedidos" property="cdg"/>
	                                </bean:define>
	                                
	                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="pedidos" property="agente"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="cdg"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="fechaPedido"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="horaP"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="fechasEntragas"/></td>  
	                            <td id="txt5" bgcolor="#c1c1c1" width="25%">$ <bean:write name="pedidos" property="anticipo"/></td>                           
	                            <td id="txt5" bgcolor="#c1c1c1" width="10%">                            	
	                            	<a href="#" onclick="javascript:seleccionaPedido('${agente}','${fechaPedido}','${fechaEntrega}','${anticipo}','${cdg}');">
	      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Cliente" />
	    							</a>
	                            </td>
	                        </tr>
	                    </logic:iterate>
	                </logic:notEmpty>
               </table>
               </div>
               </logic:present>
        </html:form>
    </body>
</html>
