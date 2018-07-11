<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>



<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><bean:message key="title.pos"/></title>

<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/venta/carga_caja.js"></script>

</head>


<html:form action="/VentaDirecta?method=carga" styleId="form1" onsubmit="return validar();">
            <html:hidden property="accion" value="fffffffff" styleId="seleccion"/>
<body onload="if(history.length>0)history.go(+1)">
  <table>
    <tr>
      <td align="left" bgcolor="#373737" id="txt1" width="1151"><bean:message key="carga.caja.datos.caja"/></td>
    </tr>
    <tr>
      <td align="left" bgcolor="#c1c1c1" id="txt2" width="1151"><bean:message key="carga.caja.numero.caja"/>
        <html:select property="numero_caja" name="ventaDirectaForm" styleClass="fto">
            <html:optionsCollection name="ventaDirectaForm" property="listaCajas" label="descripcion" value="codigo"/>
    	</html:select>
        </td>
    </tr    >
    <tr>
     <td align="left" bgcolor="#c1c1c1" id="txt2" width="1151"><bean:message key="carga.caja.cajero"/>
     <html:select property="nombreCajero" name="ventaDirectaForm" styleClass="fto">
            <html:option value="0"><bean:message key="carga.caja.seleccione.cajero"/></html:option>
            <html:optionsCollection name="ventaDirectaForm" property="listaAgentes" label="usuario" value="usuario"/>
    </html:select>
    </td>
    </tr>
      <tr>
				<td ><label> </label>
					<table>
						<tbody>
							<tr>
								<td><input type="submit" value="Aceptar" class="fto"
									title="Aceptar Caja  y Cajero" /></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
    <tr>
      <td align="left" width="1151">&nbsp;</td>
    </tr>
  </table>
  
  
    </body>         
    </html:form>


 </html:html>   
            
            
            
            
            

       

