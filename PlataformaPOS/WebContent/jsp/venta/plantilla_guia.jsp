
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<title>plantilla_guia</title>
<script type="text/javascript"><!--
function imprSelec(muestra){
	var ficha=document.getElementById(muestra);
	var ventimp=window.open('', '_blank', 'popimpr');
		//window.open(' ','popimpr');
		ventimp.document.write('<body onload="window.focus();window.print()">'+
	    ficha.innerHTML+'</body>');
		//ventimp.document.write(ficha.innerHTML);
		ventimp.document.close();
		//ventimp.print();
		ventimp.close();
		}
	//--></script>
	<style>
@media print { 
 #cabecera, #pie { 
  display: none;
 } 
}
</style> 
</head>
<body>
<html:form action="/SeleccionPago?method=IngresaPago">
		<table width="100%" border="0">
			<tr>
				<td align="right" bgcolor="#373737" id="txt1" width="850">
				  	<a href="#"	onclick="javascript:imprSelec('guia')">
						 <img src="images/printer.png" width="20" height="20"	border="0" title="Imprimir guia">
					</a>
				</td> 
			</tr>
		</table>
<div id="guia">
<table width="850" border="0" align="center">
  <tr>
    <td height="195">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
     <tr>
      	<td width="40" height="20"></td>
        <td width="30" height="20"></td>
        <td height="20" valign="middle" colspan="2" ><font size=6 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="titulo"/></font></td>
        <td height="20"></td>
      </tr>
      <tr height="50">
        <td colspan="4"></td>
      </tr>
      <tr>
      	<td width="40" height="20"></td>
        <td width="30" height="20"></td>
        <td height="20" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_fecha"/></font></td>
        <td height="20"></td>
      </tr>
      <tr>
        <td width="40"></td>
        <td colspan="2" width="600" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_cliente"/></font></td>
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_rut"/></font></td>
      </tr>
      <tr>
		<td width="40"></td>
        <td  colspan="2" width="600" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_direccion"/></font></td>
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_comuna"/></font></td>
      </tr>
      <tr>
		<td width="40"></td>
		<td  colspan="2" width="600" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_giro"/></font></td>
        <td></td>
      </tr>
      <tr height="80">
        <td colspan="4"></td>
        </tr>
    </table></td>
  </tr>
  <tr height="600" valign="top">
    <td>
    <table width="100%" border="0" >
         <logic:iterate id="productos" property="guiaListaProductos" name="seleccionPagoForm"  indexId="index">
	      <tr height="20">
	        <td valign="middle" width="20%"><font  style="letter-spacing: 0.1cm; font-size:8px; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="codigo"/></font></td>
	        <td valign="middle" width="60%"><font  style="letter-spacing: 0.1cm; font-size:8px; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="descripcion"/></font></td>
	        <td valign="middle" width="10%"> <font  style="letter-spacing: 0.1cm; font-size:8px; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="cantidad"/></font></td>
	        <td valign="middle" width="10%"><font  style="letter-spacing: 0.1cm; font-size:8px; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="total"/></font></td>
	      </tr>
      	</logic:iterate>
    </table>	
    </td>
  </tr>
  <tr>
    <td height="37"><table width="100%" border="0">
      <tr height="20">
        <td width="50%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_ticket"/></font></td>
        <td align="right" width="30%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>SUBTOTAL</font></td>
		<td align="left" valign="middle">&nbsp&nbsp<font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_subtotal"/></font></td>
      </tr>
      <tr height="20">
		<td width="50%"></td>
        <td align="right" width="30%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>DESCUENTO</font></td>
        <td align="left" valign="middle">&nbsp&nbsp<font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_descuento"/></font></td>
      </tr>
      <tr>
      	<td width="50%"></td>
        <td align="right" width="30%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>TOTAL</font></td>
        <td align="left" valign="middle">&nbsp&nbsp<font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_total"/></font></td>
      </tr>
      <tr>
      	<td width="50%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_pie_nombre"/></font></td>
        <td align="right" width="30%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_convenio_titulo_diferencia"/></font></td>
        <td align="left" valign="middle">&nbsp&nbsp<font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_convenio_diferencia"/></font></td>
      </tr>
      <tr>
      	<td width="50%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_pie_rut"/></font></td>
        <td align="right" width="30%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_convenio_titulo_total_facturar"/></font></td>
        <td align="left" valign="middle" width="10%">&nbsp&nbsp<font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="guia_convenio_total_facturar"/></font></td>
      </tr>
      <tr>
      	<td width="50%"></td>
        <td align="right" width="30%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";></font></td>
        <td align="left" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";></font></td>
      </tr>
    </table></td>
  </tr>
</table>
</div>
</html:form>
</body>
</html>