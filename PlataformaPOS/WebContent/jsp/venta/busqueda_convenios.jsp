<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
    	<script type="text/javascript" src="js/jquery-1.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/venta/busqueda_convenios.js"></script>
		<link rel="stylesheet" type="text/css" href="css/estiloFormularios.css" />
		<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript">
			load();
			document.oncontextmenu=inhabilitar;	
			function inhabilitar(){return false;}
			
			var returnVal;
			function seleccionaConvenio(indice)
			{
				var url = "<%=request.getContextPath()%>/BusquedaConvenios.do?method=selecciona_convenio&indice="+indice;	
								showPopWin(url, 620, 200, devuelve_descuento_ln, false);
			}
			
			function devuelve_descuento_ln(valores)
			{
				returnVal = new Array(valores[0], valores[1], valores[2], valores[3], valores[4]);
	            window.parent.hidePopWin(true);
			}
			
		</script>
        
       <title><bean:message key="title.pos"/></title>
       

    </head>
	<body onload="javascript: if(history.length>0)history.go(+1)">
    
        <html:form action="/BusquedaConvenios?method=buscar" styleId="busqueda" >
            <html:hidden property="accion" styleId="accion" value="" name="busquedaConveniosForm"/>
            <html:hidden property="indice" styleId="indice" value="" name="busquedaConveniosForm"/>
            
    <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4"><bean:message key="busqueda.convenios"/></td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Convenios"> 
				</a>
      		</td>
    	</tr>
    </table>
    <table width="100%" >
    	<tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.convenio.codigo"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      				<html:text property="codigo" value=""/>
       		</td>
      </tr>
      <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.convenio.nombre"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
    				<html:text property="nombre" value=""/>
      		</td>
      </tr>
       <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.convenio.empresa"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      				<html:text property="empresa"/> 
      		</td>
      </tr>
      <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			<a href="#" onclick="javascript:Seleccion('buscar')" id="enviar">
      					<img src="images/lupa.png" width="14" height="14" border="0" title="Buscar Convenios" />Buscar
    			</a>
      		</td>
      </tr>
    </table>
        <table width="100%" cellspacing="0" cellpadding="0">
        		<tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%" align="left"><bean:message key="busqueda.convenio.cdg"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="85%" align="left"><bean:message key="busqueda.convenio.descripcion"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="5%"></th>
                </tr>
           </table>
       		   <logic:present property="lista_convenios" name="busquedaConveniosForm">
                <div id="scrolling_articulos_buscar">
                <table width="100%" cellspacing="0">
                <logic:empty property="lista_convenios" name="busquedaConveniosForm">
	                <tr>
	                	<td colspan="3" id="txt5" bgcolor="#c1c1c1" align="center">
	                		NO SE ENCONTRARON RESULTADOS
	                	</td>
	                </tr>
                </logic:empty>
                <logic:notEmpty property="lista_convenios" name="busquedaConveniosForm">
                <logic:iterate id="listaConvenioId" property="lista_convenios" name="busquedaConveniosForm" indexId="indice">
                        <tr>
                        	<td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaConvenioId" property="id" /></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="85%"><bean:write name="listaConvenioId" property="descripcion"/></td>
                          	<td align="right" bgcolor="#c1c1c1" id="txt5" width="5%">
                            	<a href="#" onclick="javascript:seleccionaConvenio('${indice}');">
      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar"/>
    							</a>
                            </td>
                        </tr>
               </logic:iterate>
               </logic:notEmpty>
               </table> 
               </div> 
     		</logic:present> 
        </html:form>
    </body>
</html:html>
