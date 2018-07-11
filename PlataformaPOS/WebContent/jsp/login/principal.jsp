<%-- 
    Document   : index2
    Created on : 05-dic-2011, 16:55:21
    Author     : Advise64
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><bean:message key="title.pos"/></title>
<script type="text/javascript">
function validar(){
	if(menuForm.codigoSucursal.value==0){
		alert("El campo sucursal es requeridos");
		return false;
	}else{
	 return true;
	}
}
</script>
<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><bean:message key="title.pos"/></title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #001624;
	background-image: url(images/bg.png);
	background-repeat: repeat-x;
}
-->
</style>
    </head>
    
    <body onload="if(history.length>0)history.go(+1)">
<div id="contenedor">
 <div class="header">
  
</div>
 <div id="left">
   <div class="logo2"><img src="images/logo_gmo.png" width="165" height="51" /></div>
   <!--<div class="logo3"><img src="images/logo_econopticas.jpg" width="121" height="42" /></div>
  <div class="logo3"><img src="images/logo_sunplanet.jpg" width="129" height="28" /></div>--> 
  <div class="log">
  <html:form action="/Menu.do?method=validaSucursal" >
    <table width="100%">
      <tr>
        <td><img src="images/sucursal.png" width="154" height="35" /></td>
      </tr>
      <tr>
        <td>
        	<html:select property="codigoSucursal" styleClass="fto2" title="Lista de Sucursales">
            <html:option value="0"><bean:message key="seleccion.sucursal.seleciona.sucursal"/></html:option>
            <html:optionsCollection name="menuForm" property="colSucursales" label="descripcion" value="sucursal" styleClass="fto"/>
    	</html:select>
    	</td>
      </tr>
      <tr>
        <td> <html:submit property="submit" value="Ingresar Sucursal" styleClass="fto2" title="Ingreso de Sucursal"/></td>
      </tr>
    </table>
     </html:form>
  </div>
 </div>
<div id="right">
   <div class="imagen">
     <!--<div class="info_imagen"><img src="images/icon.png" width="40" height="31" /><bean:message key="pie.pagina.punto.venta"/></div>-->
</div>
 </div>
 <div class="footer">
  <div class="info_footer"><bean:message key="pie.pagina.index.footer"/></div>
 </div>
</div>
</body>
   
</html:html>









