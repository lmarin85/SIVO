
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
		<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
       	<title><bean:message key="title.pos"/></title>
       	<script type="text/javascript">
       	var returnVal = "";
       	
       	function enviar()
       	{
       		if (document.getElementById('armazon').value != 0) {
				if (document.getElementById('puente').value != "") 
				{
					var comparacion = parseFloat("9") < parseFloat(document.getElementById('puente').value) && parseFloat(document.getElementById('puente').value)  < parseFloat("30");
					if (comparacion) {
					
						if (document.getElementById('diagonal').value != "") 
						{
							var comparacion = parseFloat("30") < parseFloat(document.getElementById('diagonal').value) && parseFloat(document.getElementById('diagonal').value) < parseFloat("100");
							if (comparacion) {
								
								if (document.getElementById('horizontal').value != "") 
								{
									var comparacion = parseFloat("25") < parseFloat(document.getElementById('horizontal').value) && parseFloat(document.getElementById('horizontal').value) < parseFloat("100");
									if (comparacion) {
										
										if (document.getElementById('vertical').value != "") 
										{
											var comparacion = parseFloat("18") < parseFloat(document.getElementById('vertical').value) && parseFloat(document.getElementById('vertical').value) < parseFloat("70");
											if (comparacion) {
												
												returnVal = new Array(document.getElementById('armazon').value,
																		document.getElementById('puente').value,
																		document.getElementById('diagonal').value,
																		document.getElementById('horizontal').value,
																		document.getElementById('vertical').value,
																		document.getElementById('productoSeleccionado').value);
												window.parent.hidePopWin(true);
											}
											else
											{
												alert("Vertical: esta fuera del rango permitido");
												document.getElementById('vertical').value = "";
											}
											
										}
										else
										{
											alert("Debe ingresar una Vertical");
										}
										
									}
									else
									{
										alert("Horizontal: esta fuera del rango permitido");
										document.getElementById('horizontal').value = "";
									}
									
								}
								else
								{
									alert("Debe ingresar una Horizontal");
								}
							}
							else
							{
								alert("Diagonal: esta fuera del rango permitido");
								document.getElementById('diagonal').value = "";
							}
							
						}
						else
						{
							alert("Debe ingresar uma diagonal");
						}
						
					}
					else
					{
						alert("Puente: esta fuera del rango permitido");
						document.getElementById('puente').value = "";
					}
					
				}
				else
				{
					alert("Debe ingresar un puente");
				}
			}
			else
			{
				alert("Debe ingresar un tipo de Armazón");
			}
       		
       	}
       	function valida_error(){
       		//NADA POR HACER
       	}
       	</script>
        
</head>
<bean:define id="error" type="String">
		<bean:write property="error" name="ventaPedidoForm"/>
	</bean:define>
<body onload="valida_error('${error}');if(history.length>0)history.go(+1)">        
	<html:form action="/VentaPedido?method=carga_Adicionales_Arcli" styleId="adicionales">
		<html:hidden property="addProducto" styleId="productoSeleccionado"/>
        <table width="400px" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			<bean:message key="venta.pedido.adicionales.arcli" />
      		</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      		</td>
    	</tr>
    	</table>
    	
        <table width="400px" cellspacing="1">    	
    	<tr>
			<td align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<bean:message key="venta.pedido.adicionales.arcli.tipoArmazon" />
			</td>
			<td  align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<html:select property="tipo_armazon" name="ventaPedidoForm"  style="width:150px;" styleClass="fto" styleId="armazon">
					<html:option value="0"><bean:message key="venta.pedido.seleccione" /></html:option>
					<html:option value="C"><bean:message key="venta.pedido.tipoArmazon.c" /></html:option>
					<html:option value="A"><bean:message key="venta.pedido.tipoArmazon.a" /></html:option>
					<html:option value="S"><bean:message key="venta.pedido.tipoArmazon.s" /></html:option>
					<html:option value="P"><bean:message key="venta.pedido.tipoArmazon.p" /></html:option>
					<html:option value="N"><bean:message key="venta.pedido.tipoArmazon.n" /></html:option>
				</html:select>
			</td>
    	</tr>
    	<tr>
			<td align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<bean:message key="venta.pedido.adicionales.arcli.puente" />
			</td>
			<td  align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<html:text property="puente" styleId="puente" name="ventaPedidoForm" size="10" styleClass="fto" onkeypress="return validar_numerico(event)" />
			</td>
    	</tr><tr>
			<td align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<bean:message key="venta.pedido.adicionales.arcli.diagonal" />
			</td>
			<td  align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<html:text property="diagonal" styleId="diagonal" name="ventaPedidoForm" size="10" styleClass="fto" onkeypress="return validar_numerico(event)" />
			</td>
    	</tr><tr>
			<td align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<bean:message key="venta.pedido.adicionales.arcli.horizontal" />
			</td>
			<td  align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
				<html:text property="horizontal" styleId="horizontal" name="ventaPedidoForm" size="10" styleClass="fto" onkeypress="return validar_numerico(event)" />
			</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
    			<bean:message key="venta.pedido.adicionales.arcli.vertical" />
    		</td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="50%">
    			<html:text property="vertical" styleId="vertical" name="ventaPedidoForm" size="10" styleClass="fto" onkeypress="return validar_numerico(event)" />
    		</td>
    	</tr>
    	<tr>
    		<td align="right" bgcolor="#c1c1c1" id="txt5" width="100%" colspan="2">
				<html:button value="Agregar" property="buscar"	styleClass="fto" title="Agregar" onclick="enviar()"/>
			</td>
    	</tr>
        </table>
        </html:form>
    </body>
</html:html>