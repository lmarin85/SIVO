<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script language="javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/reportes/listado_boletas.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/jquery.datepick.js""></script>
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
<title><bean:message key="title.pos"/></title>
<script type="text/javascript">
	   var $j = jQuery.noConflict();	
       $j(function() {
			$j('#popupDatepicker').datepick();
			});   
       function imprimirListadoBoletas() {
		var voucher;
        voucher = window.open("<%=request.getContextPath()%>/CreaListadoBoletasServlet");    
	}
	function cerrar()
           {
           		parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
           }
        </script>

</head>
<body>
	<html:form action="/ListadoBoletas?method=buscar">
	<table width="100%" cellspacing="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="listado.boletas.listado.boletas"/></td> 
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#" onclick="validaBuscar()">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar listado de boletas" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="imprimirListadoBoletas()">
      						<img src="images/printer.png" width="15" height="15" border="0" title="Cerrar página">
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt1"><a
					href="#" onclick="cerrar()"> <img src="images/cancel.png" width="15"
						height="15" border="0" title="Cerrar"> </a></td>
              </tr>
     </table>
            
		<table width="100%" border="0" cellspacing="1">
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.boletas.fecha.inicio"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" >
		    	<html:text property="fecha_inicio" value="" styleClass="fto" styleId="popupDatepicker" readonly="true"/>
		   
		  </tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.boletas.numero.boleta"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><html:text property="numero_boleta" value=""  styleId="numero_boleta" styleClass="fto" onkeypress="return validar_numerico(event)"/></td>
		  </tr>
		 
		</table>
		<br>
		
        	
                <logic:present property="listaBoletas" name="listadoBoletasForm">
                <div id="scrolling">
                <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    		<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.boletas.numero.boleta"/></td>
                    		<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.boletas.codigo"/></td>
                    		<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.boletas.CancelacionAbono"/></td>
                    		<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.boletas.importe"/></td>
                    		<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.boletas.fechas.emision"/></td>
                		</tr>
               		<logic:iterate id="boletas" property="listaBoletas" name="listadoBoletasForm">
               		 	
                        <tr bgcolor="#66FFFF">
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="boletas" property="numero"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="boletas" property="codigo"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="boletas" property="tipo"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="boletas" property="importe" format="$###,###.##"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="boletas" property="fecha"/></td>
                        </tr>
                    </logic:iterate>
                    </table>
                    </div>
                    </logic:present>
                   
	</html:form>

</body>
</html:html>