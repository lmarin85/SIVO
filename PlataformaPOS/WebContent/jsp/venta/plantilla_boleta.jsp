
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<title>plantilla_boleta</title>
<script type="text/javascript"><!--
function imprSelec(muestra){

	var navInfo = window.navigator.appVersion.toLowerCase();
	var ficha=document.getElementById(muestra);
	
	if(navInfo.indexOf('nt 5') != -1)
	{
		ficha=document.getElementById('boleta_xp');
	}
	else
	{
		ficha=document.getElementById('boleta_7');
	}
	var ventimp=
	window.open('', '_blank', 'popimpr');
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
				  	<a href="#"	onclick="javascript:imprSelec('boleta')">
						 <img src="images/printer.png" width="20" height="20"	border="0" title="Imprimir Boleta">
					</a>
				</td> 
			</tr>
		</table>
<div id="boleta_xp" style="display:none;">
<table width="850" border="0" align="center">
  <tr>
    <td height="237">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr height="20" valign="middle">
        <td colspan="2" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_cliente"/></font></td>
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Fecha</font></td>
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fecha"/></font></td>
      </tr>
      <tr height="20">
        <td height="20"  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Rut</font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_rut"/></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_albaran"/></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_albaran"/></font></td>
      </tr>
      <tr height="20">
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Hora</font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_hora"/></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fecha_ent"/></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fecha_ent"/></font></td>
      </tr>
      <tr height="20">
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Tienda</font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_tienda"/></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Vendedor</font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_vendedor"/></font></td>
      </tr>
      <tr height="20">
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fecha_ped"/></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fecha_ped"/></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";></font></td>
        <td  valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";></font></td>
      </tr>
      <tr height="20">
        <td valign="middle" colspan="4" align="center"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Servicio de Atención al Cliente :	600 822 02 00</font></td>
        </tr>
    </table></td>
  </tr>
  <tr height="300" valign="top">
    <td>
    <table width="100%" border="0" >
      <tr height="20">
        <td width="50%" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Descripcion</font></td>
        <td width="10%" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Cantidad</font></td>
        <td width="15%" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Precio</font></td>
        <td width="10%" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Dto</font></td>
        <td width="15%" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Total</font></td>
      </tr>
         <logic:iterate id="productos" property="boletaListaProductos" name="seleccionPagoForm"  indexId="index">
	      <tr height="19">
	        <td valign="middle"><font size="2" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="descripcion"/></font></td>
	        <td valign="middle"><font size="2" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="cantidad"/></font></td>
	        <td valign="middle"><font size="2" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="precio"/></font></td>
	        <td valign="middle"><font size="2" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="descuento"/></font></td>
	        <td valign="middle"><font size="2" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="importe"/></font></td>
	      </tr>
      	</logic:iterate>
    </table>	
    </td>
  </tr>
  <tr>
    <td height="37"><table width="100%" border="0">
      <tr height="20">
        <td width="50%">&nbsp;</td>
        <td width="25%"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Formas de pago</font></td>
        <td width="25%">&nbsp;</td>
      </tr>
      <tr height="20">
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_resumen_total"/></font></td>
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_1"/></font></td>
        <td align="left" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_1"/></font></td>
      </tr>
      <tr height="20">
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_resumen_anticipo"/></font></td>
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_2"/></font></td>
        <td align="left" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_2"/></font></td>
      </tr>
      <tr height="20">
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_resumen_pendiente"/></font></td>
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_3"/></font></td>
        <td align="left" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_3"/></font></td>
      </tr>
      <tr height="20">
        <td>&nbsp;</td>
        <td valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_4"/></font></td>
        <td align="left" valign="middle"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_4"/></font></td>
      </tr>
      <tr  height="20">
        <td colspan="2" align="right"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_resumen_total_pagar"/>&nbsp&nbsp</font></td>
        <td align="left"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>$&nbsp<bean:write name="seleccionPagoForm" property="boleta_total_pagar"/></font></td>
      </tr>
      <tr height="20">
        <td>&nbsp;</td>
        <td><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><b></b></font></td>
        <td><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><b></b></font></td>
      </tr>
      <tr height="20">
        <td colspan="3" align="center"><font size=3 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><b>&quot;Es conveniente una evaluación Oftalmologica que permita prevenir riesgos de salud ocular&quot;</b></font></td>
        </tr>
    </table></td>
  </tr>
</table>
</div>
<div id="boleta_7">
<table width="850" border="0" align="center">
  <tr>
    <td height="237">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0">
      <tr height="20" valign="middle">
        <td colspan="2" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_cliente"/></font></td>
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Fecha Entrega </font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fecha_ent"/> desde las 18:30 hrs.</font></td>
        <!-- Se cambia por la fecha de entrega a peticion de C. HUAMANI 20140808 -->
         <!--<td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fecha"/></font></td>-->
      </tr>
      <tr height="20">
        <td height="20"  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Rut</font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_rut"/></font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_albaran"/></font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_albaran"/></font></td>
      </tr>
      <tr height="20">
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Hora</font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_hora"/></font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Fecha de Compra</font></td>
		<td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fecha"/></font></td>
      </tr>
      <tr height="20">
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Tienda</font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_tienda"/></font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Vendedor</font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_vendedor"/></font></td>
      </tr>
      <tr height="20">
      	<!-- Se comenta a peticion de C. Huamani 20140808 -->
        <!--<td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fecha_ped"/></font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fecha_ped"/></font></td>-->
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";></font></td>
        <td  valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";></font></td>
      </tr>
      <tr height="20">
        <!-- Se cambia a peticion de C. HUAMANI 20140808 -->
        <!--<td valign="middle" colspan="4" align="center"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Servicio de Atención al Cliente :	600 822 02 00</font></td>-->
        <td valign="middle" colspan="4" align="center"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Recuerda contactar a su tienda al <bean:write name="seleccionPagoForm" property="telefono_tienda"/> para confirmar retiro.</font></td>
        </tr>
    </table></td>
  </tr>
  <tr height="300" valign="top">
    <td>
    <table width="100%" border="0" >
      <tr height="20">
        <td width="50%" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Descripcion</font></td>
        <td width="10%" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Cantidad</font></td>
        <td width="15%" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Precio</font></td>
        <td width="10%" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Dto</font></td>
        <td width="15%" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Total</font></td>
      </tr>
         <logic:iterate id="productos" property="boletaListaProductos" name="seleccionPagoForm"  indexId="index">
	      <tr height="19">
	        <td valign="middle"><font size="1" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="descripcion"/></font></td>
	        <td valign="middle"><font size="1" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="cantidad"/></font></td>
	        <td valign="middle"><font size="1" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="precio"/></font></td>
	        <td valign="middle"><font size="1" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="descuento"/></font></td>
	        <td valign="middle"><font size="1" style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="productos" property="importe"/></font></td>
	      </tr>
      	</logic:iterate>
    </table>	
    </td>
  </tr>
  <tr>
    <td height="37"><table width="100%" border="0">
      <tr height="20">
        <td width="50%">&nbsp;</td>
        <td width="25%"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>Formas de pago</font></td>
        <td width="25%">&nbsp;</td>
      </tr>
      <tr height="20">
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_resumen_total"/></font></td>
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_1"/></font></td>
        <td align="left" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_1"/></font></td>
      </tr>
      <tr height="20">
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_resumen_anticipo"/></font></td>
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_2"/></font></td>
        <td align="left" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_2"/></font></td>
      </tr>
      <tr height="20">
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_resumen_pendiente"/></font></td>
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_3"/></font></td>
        <td align="left" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_3"/></font></td>
      </tr>
      <tr height="20">
        <td>&nbsp;</td>
        <td valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_fpago_4"/></font></td>
        <td align="left" valign="middle"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_fpago_4"/></font></td>
      </tr>
      <tr  height="20">
        <td colspan="2" align="right"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><bean:write name="seleccionPagoForm" property="boleta_titulo_resumen_total_pagar"/>&nbsp&nbsp</font></td>
        <td align="left"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";>$&nbsp<bean:write name="seleccionPagoForm" property="boleta_total_pagar"/></font></td>
      </tr>
      <tr height="20">
        <td>&nbsp;</td>
        <td><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><b></b></font></td>
        <td><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><b></b></font></td>
      </tr>
      <tr height="20">
        <td colspan="3" align="center"><font size=1 style="letter-spacing: 0.1cm; font-family:Verdana, Geneva, sans-serif";><b>&quot;Una evaluación oftalmológica permite prevenir riesgos de salud ocular&quot;</b></font></td>
        </tr>
    </table></td>
  </tr>
</table>
</div>
</html:form>
</body>
</html>