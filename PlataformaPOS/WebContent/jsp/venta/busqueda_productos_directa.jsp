<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html>
<head>
<title>busqueda_directa_articulos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<link rel="stylesheet" type="text/css" href="css/estiloFormularios.css" />
		<script type="text/javascript" src="js/venta/busqueda_productos_directa.js"></script>
</head>
<body onload="javascript: document.busquedaProductosForm.producto.focus();if(history.length>0)history.go(+1)">
<html:form action="/BusquedaProductos?method=cargaBusquedaProductosDirecto">
<table width="300px" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4"><bean:message key="busqueda.productos.busqueda.productos"/></td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Productos"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	<table width="300" >
    	<tr>
			<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.codigo.barra"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			<input type="text" class="fto" onkeypress="javascript:pasar_Producto()" id="producto" name="producto" value=""/>
        		  
      		</td>
      </tr>
      </table>
</html:form>
</body>
</html>