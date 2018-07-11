<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
<head>
<title><bean:message key="title.pos"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/utils.js"></script>
        <script type="text/javascript" src="js/jquery-1.3.min.js"></script>
		<script type="text/javascript">
			load();
			function cerrar()
           {
           		parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
           }
			</script>
</head>
<body>
<html:form action="/FichaClientes?method=cargaFormulario">
<table width="100%" cellspacing="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="ficha.cliente.ficha.cliente"/></td> 
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#" onclick="" id="enviar">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar ficha cliente" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="">
      						<img src="images/printer.png" width="15" height="15" border="0" title="Cerrar pagína" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt1"><a
					href="#" onclick="cerrar()"> <img src="images/cancel.png" width="15"
						height="15" border="0" title="Cerrar"> </a></td>
              </tr>
     </table>
		<table width="50%" border="0" cellspacing="1" align="center">
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="ficha.cliente.cliente"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text property="cliente"
						value="" styleClass="fto"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="ficha.cliente.graduacion"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3" align="left"><select name="select"
					id="select">
						<option class="fto"><bean:message key="ficha.cliente.seleccionar.graduacion"/></option>
				</select></td>
			</tr>
		</table>
<br>
<table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="ficha.cliente.articulo"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="ficha.cliente.descripcion"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="ficha.cliente.cantidad"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="ficha.cliente.precio"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="ficha.cliente.porcentaje.descuento"/></td>
                </tr>
</table>
         <logic:present property="listaArticulos" name="fichaClienteForm">
             <div id="scrolling">
                <table width="100%" cellspacing="0" cellpadding="0">
               		<logic:iterate id="articulos" property="listaArticulos" name="fichaClienteForm">
                        <tr bgcolor="#66FFFF">
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="articulo"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="descripcion"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="cantidad"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="precio"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="descuento"/></td>
                        </tr>
                    </logic:iterate>
                    </table>
               </div>
         </logic:present>
</html:form>
</body>
</html>