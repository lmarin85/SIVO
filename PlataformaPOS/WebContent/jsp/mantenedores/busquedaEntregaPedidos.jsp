
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/mantenedores/busquedaEntregaPedidos.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.min.js"></script>
		<script type="text/javascript">
		load();
		</script>
       	<title><bean:message key="title.pos"/></title>
        
    </head>
    <body onload="if(history.length>0)history.go(+1)">
        <html:form action="/EntregaPedido?method=buscarPedidos" styleId="busqueda">
            <html:hidden property="accion" styleId="accion" value=""/>
        	        
        <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			Busqueda de Entrega de Pedidos
      		</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda Entrega de Pedido"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	
        <table width="100%" align="center">    	
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="mantenedor.cliente"/> &nbsp;<bean:message key="mantenedor.cliente.rut"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="cliente" styleClass="fto"/>
						
						
				</td>
    	</tr>  
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%">
					<bean:message key="mantenedor.cliente.nombre"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%" ><html:text
						property="nombre_cliente" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
						
						
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="mantenedor.fecha_pedido"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="fecha_pedido" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2" width="70%">
			<a href="#" onclick="javascript:Seleccion('busqueda')" id="enviar">
						<img src="images/lupa.png" width="16" height="16" border="0"
						title="Buscar Encargo">
				</a>
				</td>
    	</tr>
    	
        </table>
        
        
        <br>
                  
        
       <div>
			<table width="100%"  border="0" cellspacing="0">
				<tr>
					<td bgcolor="#373737" id="txt4" width="10%" align="left"><bean:message key="mantenedor.codigo"/></td>
					<td bgcolor="#373737" id="txt4" width="15%" align="left"><bean:message key="mantenedor.fecha_pedido"/></td>
					<td bgcolor="#373737" id="txt4" width="15%" align="left"><bean:message key="mantenedor.fecha_entrega"/></td>					
					<td bgcolor="#373737" id="txt4"  width="20%" align="center"><bean:message key="mantenedor.cliente"/></td>
					<td bgcolor="#373737" id="txt4" width="15%" align="left"><bean:message key="mantenedor.agente"/></td>					
					<td bgcolor="#373737" id="txt4"  width="10%" align="center"><bean:message key="mantenedor.seleccionar"/></td>
								
				</tr>
			</table>
		</div>				
		<div id="scrolling_entrega_pedido" >
			<logic:present property="listaPedidos"
						name="entregaPedidoForm">
				<logic:iterate id="listaPedidos" property="listaPedidos"
								name="entregaPedidoForm">
								<bean:define id="codigo" type="String" >
									<bean:write name="listaPedidos" property="cdg" />
								</bean:define>								
								<table width="100%" cellspacing="0" >
									<tr>
										<td id="txt5" bgcolor="#c1c1c1" width="10%" align="left"><bean:write
												name="listaPedidos" property="cdg" />
										</td>
										<td id="txt5" bgcolor="#c1c1c1" width="15%" align="left"><bean:write
												name="listaPedidos" property="fecha" />
										</td>
										<td id="txt5" bgcolor="#c1c1c1" width="15%" align="left"><bean:write
												name="listaPedidos" property="fecha_entrega" />
										</td>
										<td id="txt5" bgcolor="#c1c1c1" width="20%" align="center"><bean:write
												name="listaPedidos" property="cliente_completo" />
										</td>
										<td id="txt5" bgcolor="#c1c1c1" width="15%" align="center"><bean:write
												name="listaPedidos" property="agente" />
										</td>										
										<td bgcolor="#c1c1c1" id="txt5" width="10%" align="center" >			
											<a href="#" onclick="javascript:seleccionaPedido('${codigo}');">
      											<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Cliente" />
    										</a>
										</td>
									
									</tr>
								</table>
				</logic:iterate>
			</logic:present>
		</div>	
		<br>
            
            
        </html:form>
    </body>
</html>
