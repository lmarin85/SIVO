<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><bean:message key="title.pos"/></title>
<link href="css/estiloFormularios.css" rel="stylesheet" type="text/css" />
<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/login/menu_principal.js"></script>

<style type="text/css">
<!--
body {
	background-color: #001624;
	background-image: url(images/bg.png);
	background-repeat: repeat-x;
}
-->
</style></head>

<logic:equal scope="session" name="error" value="caja">
             <body onload="alert('Debe realizar apertura de caja');" onbeforeunload="ConfirmarCierre()">
</logic:equal>
<logic:notEqual scope="session" name="error" value="caja">
                <body onload="if(history.length>0)history.go(+1)" onbeforeunload="ConfirmarCierre()">
</logic:notEqual>
<html:form action="/Menu?method=SeleccionaAccion" styleId="form" >
 <html:hidden property="accion" value="" styleId="seleccion"/>
 
 
<div id="contenedor">
 <div class="header">
  <div class="menu">
     <!-- MENU-->
   <div id="menujq">
    <ul id="nav">
  	<li><a href="#"><bean:message key="menu.venta"/></a>
		<ul class="submenu">
        	<li><a href="#" onclick="Seleccion('Venta_Directa')"><bean:message key="menu.venta.directa"/></a></li>
            <li><a href="#" onclick="Seleccion('Presupuesto')"><bean:message key="menu.presupuesto"/></a></li>
            <li><a href="#" onclick="Seleccion('Venta_Pedido')"><bean:message key="menu.pedido"/></a></li>          
         	<li><a href="#" onclick="Seleccion('Liberaciones')"><bean:message key="menu.liberacion.encargo"/></a></li>
        </ul></li>
    <li><a href="#"><bean:message key="menu.mantenedores"/></a>
    	<ul class="submenu">
        	<li><a href="#" onclick="Seleccion('Clientes')"><bean:message key="menu.clientes"/></a></li>
            <li><a href="#" onclick="Seleccion('Graduacion')"><bean:message key="menu.graduacion.cliente"/></a></li>
            <li><a href="#" onclick="Seleccion('Medico')"><bean:message key="menu.medico"/></a></li>
            <li><a href="#" onclick="Seleccion('Devolucion')"><bean:message key="menu.devolucion"/></a></li>
            <!--  <li><a href="#" onclick="Seleccion('EntregaPedido')"><bean:message key="menu.entregaPedido"/></a></li>  -->
             <li><a href="#" onclick="Seleccion('cambioFolio')"><bean:message key="menu.mantenedoresCambioFolio"/></a></li>
        </ul>
    </li>
    <li><a href="#"><bean:message key="menu.informes"/></a>
    	<ul class="submenu">
    		<li><a href="#" onclick="Seleccion('listado_informe_optico')">Listado Informe Optico</a></li>
    		<li><a href="#" onclick="Seleccion('listado_total_dia')">Listado total del día</a></li>
    		<li><a href="#" onclick="Seleccion('listado_boletas')">Listado Boletas</a></li>
    		<li><a href="#" onclick="Seleccion('listado_presupuestos')">Listado Presupuestos</a></li>
    		<li><a href="#" onclick="Seleccion('listado_trabajos_pendientes')">Listado de Encargos Pendientes de Entrega</a></li>
    		<li><a href="#" onclick="Seleccion('busqueda_general_articulos')">Busqueda General Articulos</a></li>
    		<li><a href="#" onclick="Seleccion('CopiaGuiaBoleta')">Copia de Guias y Boletas</a></li>
    		
    		<!-- Lmarin 20130911  -->
   			<!--<li><a href="#" onclick="Seleccion('historial_requerimientos')">Historial de Requerimientos</a></li>-->
   			<!-- FIN -->
   			
        	<logic:equal name="menuForm" property="informeInformeTotalDia" value="mostrar"><li><a href="#"><bean:message key="menu.informe.dia"/></a></li></logic:equal>
        </ul>
    </li>   
</ul>
<table  align="right">
	<tr>
		<td  id="txt4">
			USUARIO:<bean:write scope="session" name="usuario"   />
		</td>
		<td  id="txt4">
			SUCURSAL:<bean:write scope="session" name="nombre_sucursal"  />
		</td>
		<td>
		<a href="#" onclick="javascript:cerrar_session();">
			<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Sesión"/>
		</a>	
		</td>
	</tr>
</table>
</div>
     <!-- CIERRE MENU-->
  </div>
 </div>
 <div id="right">
  <div class="blanco">
    <div id="info">    	
    	<logic:notEqual name="menuForm" property="include" value="">
    		<bean:define id="include" name="menuForm" property="include"></bean:define>
			 <iframe width="100%" height="425" id="menu_principal_id" name="menu_principal" src="<%=request.getContextPath()%>${include}" scrolling="yes" frameborder="0">
			 </iframe>
		</logic:notEqual>
    </div>
  </div>
 </div>
 <div class="footer">
  <div class="titu_footer"><img src="images/icon.png" width="46" height="36" /><bean:message key="pie.pagina.punto.venta"/></div>
<div class="info_footer"><bean:message key="pie.pagina.index.footer"/></div>
 </div>
</div>
</body>
</html:form>
<script type="text/javascript" src="js/jquery.cookie.js"></script>	
<script>
	$(".submenu > li > a ").on("click",function(){
	   $.cookie("util","0");
	});
	$.cookie("tienda","");
</script>
</html:html>

