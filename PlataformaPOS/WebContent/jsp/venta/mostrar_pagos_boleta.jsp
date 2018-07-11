<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html>
<html:html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/subModal.css" />
<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/subModal.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/venta/mostrar_pago_boleta.js"></script>

		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
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
			var voucher;
        	voucher = window.open("<%=request.getContextPath()%>/CreaBoletaServlet");
        	
			popup('documentos' , ancho, alto);
			popup('Numero_Documento' , ancho, alto);
	}
	function cerrarPagina(){
		returnVal = 'volver';
		window.parent.hidePopWin(true);
	}
	function inicio_pagina(){
		var exito_pago = document.getElementById('exitopago').value;
		
		if("TRUE" == exito_pago){
			alert("El Pago fue eliminado correctamente");
			document.getElementById('exitopago').value="";
		}else if("FALSE" == exito_pago){
			alert("No se puede eliminar pagos cuando la caja esta CERRADA");
			document.getElementById('exitopago').value="";
		}
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
-->
</style>
  <title><bean:message key="title.pos"/></title>



</head>
<body onload="inicio_pagina();if(history.length>0)history.go(+1)">

	<html:form action="/SeleccionPago?method=IngresaPago" styleId="form1">
	<html:hidden property="accion" value="" styleId="accion"/>
	<html:hidden property="f_pago" value="" styleId="f_pago"/>
	<html:hidden property="fech_pago" value="" styleId="fech_pago"/>
	<html:hidden property="exitopago"  styleId="exitopago"/>	
	<html:hidden property="serie"  styleId="serie"/>
	<html:hidden property="fecha"  styleId="fecha"/>	
	<html:hidden property="autorizador"  value="" styleId="autorizador" name="seleccionPagoForm"/>		
	<html:hidden property="tipoaccion"  value="" styleId="tipoaccion" name="seleccionPagoForm"/>	
		
		<table width="690" cellspacing="0" align="center">
			<tr>
				<td  align="left" bgcolor="#373737" id="txt4"><bean:message key="seleccion.pago"/></td>
				<td  align="right" bgcolor="#373737" id="txt4">
					<a href="#" onclick="cerrarPagina()"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar"> 
					</a>
				</td>
			</tr>
		</table>
		
		
		
		
		<table width="690" cellspacing="1" align="center">
			
		<tr>
			<td id="txt5" bgcolor="#c1c1c1" colspan="2" width="500">
			<!-- TABLA QUE REGISTRA LOS PAGOS REALIZADOS -->

				<table width="100%" cellspacing="0" cellpadding="0">
        			<tr id="thead">
	                    <th scope="col" id="txt4" bgcolor="#373737" width="22%"><bean:message key="seleccion.fecha"/></th>
	                    <th scope="col" id="txt4" bgcolor="#373737" width="22%"><bean:message key="seleccion.forma.pago"/></th>
	                    <th scope="col" id="txt4" bgcolor="#373737" width="32%"><bean:message key="seleccion.cantidad"/></th>
	                    <th scope="col" id="txt4" bgcolor="#373737" width="15%"><bean:message key="seleccion.eliminar.pago"/></th>
                	</tr>
           		</table>
	           		<logic:present property="listaPagos" name="seleccionPagoForm">
	                <div  id="scrolling_pagos_boleta" >
	                <table width="100%" cellspacing="0">
	                <logic:iterate id="pagos" property="listaPagos" name="seleccionPagoForm">
	                <bean:define id="forma_pago" type="String">
	                	<bean:write name="pagos" property="forma_pago"/>
	                </bean:define>
	                <bean:define id="fech_pago" type="String">
	                	<bean:write name="pagos" property="fecha" format="dd/MM/yyyy" />
	                </bean:define>
	                
	                        <tr >
	                            <td id="txt5" bgcolor="#c1c1c1" width="23%"><bean:write name="pagos" property="fecha" format="dd/MM/yyyy" /><input type="hidden" id="fpago" value="${fech_pago}" /></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="23%" align="center"><bean:write name="pagos" property="detalle_forma_pago"/><input type="hidden" id="dpago"  value="${forma_pago}"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="33%" align="center"><bean:write name="pagos" property="cantidad" format="$###,###.##" /></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%" align="center">
	                            <a href="#"  onclick="eliminar_pago_boleta('${forma_pago}','${fech_pago}','<%=request.getContextPath()%>');" >
	                            	<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Pago">
	                            </a>	
	                            </td>
	                        </tr>
	                    </logic:iterate>
	               </table> 
	               </div> 
	            </logic:present> 
			
			
			
			<!-- FIN TABLA QUE REGISTRA LOS PAGOS REALIZADOS -->
			</td>
				
				
			<td id="txt5" bgcolor="#c1c1c1" colspan="2" width="300">
				<!-- BOLETAS -->
					
	           <table width="300" cellspacing="1" align="center">			
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" colspan="2">					
	
						 <table width="100%" cellspacing="0" cellpadding="0">
					        			<tr id="thead">
						                    <th scope="col" id="txt4" bgcolor="#373737" width="30%" align="left"><bean:message key="seleccion.fecha"/></th>
						                    <th scope="col" id="txt4" bgcolor="#373737" width="30%" align="left"><bean:message key="seleccion.forma.boleta"/></th>
						                    <th scope="col" id="txt4" bgcolor="#373737" width="15%" align="left"><bean:message key="seleccion.forma.boleta.tipo"/></th>
						                    <th scope="col" id="txt4" bgcolor="#373737" width="40%" align="left"><bean:message key="seleccion.forma.boleta.importe"/></th>
						                    <th scope="col" id="txt4" bgcolor="#373737" width="50%" align="center"><bean:message key="seleccion.forma.boleta.cdg_vta"/></th>
					                	</tr>
				          </table>
	           		<logic:present property="lista_boletas" name="seleccionPagoForm">
		                <div id="scrolling_pagos_boleta">
			                <table width="100%" cellspacing="0">
			                <logic:iterate id="boleta" property="lista_boletas" name="seleccionPagoForm">     
			               
			                        <tr >
			                            <td id="txt5" bgcolor="#c1c1c1" width="30%" align="left"><bean:write name="boleta" property="fecha" format="dd/MM/yyyy" /></td>
			                            <td id="txt5" bgcolor="#c1c1c1" width="30%" align="left"><bean:write name="boleta" property="numero" /></td>
			                            <td id="txt5" bgcolor="#c1c1c1" width="15%" align="center"><bean:write name="boleta" property="tipo" /></td>
			                            <td id="txt5" bgcolor="#c1c1c1" width="40%" align="center"><bean:write name="boleta" property="importe" /></td>
			                            <td id="txt5" bgcolor="#c1c1c1" width="50%" align="center"><bean:write name="boleta" property="pedvtcb" /></td>                             
			                        </tr>
			                </logic:iterate>
			               </table> 
		               	</div> 
	            	</logic:present> 
					
					</td>
					
				</tr>
				
				
				</table>
			<!-- FIN BOLETAS -->
			</td>
		</tr>
		</table>	
	</html:form>
</body>



</html:html>
