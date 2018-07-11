<%-- 
    Document   : index2
    Created on : 05-dic-2011, 16:55:21
    Author     : Advise64
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>


<!DOCTYPE html>


<html:html>
    
    <head>
    	
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="title.pos"/></title>
		<link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/login/index.js"></script>
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
 <html:form action="/Index?method=validaLogin" onsubmit="return validar();">
        <logic:equal scope="session" name="error" value="falla">
             <body onload="alert('Usuario o Contrase\u00f1a invalida');">
        </logic:equal>
     
        <logic:notEqual scope="session" name="error" value="caja">
                <body>
        </logic:notEqual>
         <logic:equal scope="session" name="error_tienda" value="tienda_novalida">
                  <body onload="alert('Tienda no habilitada para generar boletas electr\u00f3nicas,favor ingresar al sistema que corresponda.');">
        </logic:equal>
<div id="contenedor">
 <div class="header">
  
 </div>
 <div id="left">
   <div class="logo2"><img src="images/logo_gmo.png" width="165" height="51" /></div>
   <!--<div class="logo3"><img src="images/logo_econopticas.jpg" width="121" height="42" /></div>
  <div class="logo3"><img src="images/logo_sunplanet.jpg" width="129" height="28" /></div>-->
  <div class="log">
    <table width="100%">
      <tr>
        <td><img src="images/login.png" width="154" height="35" /></td>
      </tr>
      <tr>
        <td><bean:message key="login.index.usuario"/></td>
      </tr>
      <tr>
        <td>
          <html:text size="16"  property="nombreUsuario" value="" styleClass="fto2" title="Ingrese Nombre de Usuario" onblur="javascript:this.value=this.value.toUpperCase();"/>        
       </td>
      </tr>
      <tr>
        <td><bean:message key="login.index.password"/></td>
      </tr>
      <tr>
         <td><html:password size="16"  property="claveUsuario" value="" styleClass="fto2" title="Ingrese Contraseña"/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td> <html:submit property="submit" value="Enviar" styleClass="fto2" title="Acceso a Sistema POS"/></td>
      </tr>
    </table>
    
</div>
 </div>
 <div id="right">
   <div class="imagen">
     <!--  <div class="info_imagen"><img src="images/icon.png" width="40" height="31" /><bean:message key="pie.pagina.punto.venta"/></div>-->
</div>
 </div>
 <div class="footer">
  <div class="info_footer">
  		<bean:message key="pie.pagina.index.footer"/> 
  </div>
 </div>
</div>
</html:form>
</body>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>	
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script>

var tienda = getUrlParameter('tienda');

$.cookie("tienda",tienda);

function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}          
</script>   
</html:html>
