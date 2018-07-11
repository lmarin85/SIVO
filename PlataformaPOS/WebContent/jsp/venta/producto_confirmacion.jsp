<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript">
			document.oncontextmenu=inhabilitar;	
			function inhabilitar(){return false;}
			
			var returnVal = "";
			
			function confirma_enter(estado)
			{
				if(event.keyCode == 13){
           		 	if("" == document.getElementById('codigo_confirmacion').value)
					{
						alert("Debe ingresar un Código de barra");
					}
					else
					{
						returnVal = new Array(estado, document.getElementById('codigo_confirmacion').value);
						window.parent.hidePopWin(true);
					}
           		}
			}
			function confirma_producto(estado)
			{
				if (estado == 'declina')
				{
					returnVal = new Array(estado,"");
					window.parent.hidePopWin(true);
				}
				else
				{
					if("" == document.getElementById('codigo_confirmacion').value)
					{
						alert("Debe ingresar un Código de barra");
					}
					else
					{
						returnVal = new Array(estado, document.getElementById('codigo_confirmacion').value);
						window.parent.hidePopWin(true);
					}
				}
				
			}
		</script>
        
       <title><bean:message key="title.pos"/></title>
       

    </head>
	<body onload="javascript: if(history.length>0)history.go(+1)">
    	
        <html:form action="/VentaPedido?method=carga_confirmacion" styleId="selecciona" >
          <html:hidden property="accion" value="" styleId="accion" name="ventaPedidoForm"/>  
            
    <table width="600px" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4"><bean:message key="confirmacion_producto_titulo"/></td>
    	</tr>
    </table>
    <table width="600px" >
    	<tr bgcolor="#c1c1c1">
    		<td align="left" bgcolor="#c1c1c1" id="txt5">
    			<bean:message key="confirmacion_producto_nombre"/>
       		</td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			<bean:write name="producto" property="descripcion" scope="session"/>
       		</td>
      	</tr>
      	<tr bgcolor="#c1c1c1">
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
    			<bean:message key="confirmacion_producto_codigo"/>
       		</td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			<html:text property="codigo_confirmacion" value="" styleId="codigo_confirmacion" onkeypress="confirma_enter('confirma')" />
       		</td>
      		
      	</tr>
      	<tr height="50">
      		<td id="txt5" bgcolor="#c1c1c1" colspan="2" align="center">
              		<a href="#" onclick="confirma_producto('confirma')">
      						<img src="images/check.png" width="15" height="15" border="0" title="Seleccionar">
    				</a>&nbsp&nbsp&nbsp
    				<a href="#" onclick="confirma_producto('declina')">
      						<img src="images/cancel.png" width="15" height="15" border="0"title="Cancelar" >
    				</a>
    		</td>
      	</tr>
    </table>
  </html:form>
 </body>
</html:html>