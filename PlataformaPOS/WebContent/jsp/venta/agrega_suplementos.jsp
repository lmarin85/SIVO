
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
		<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>		
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/venta/agrega_suplementos.js"></script>
       	<title><bean:message key="title.pos"/></title>
        
</head>
<bean:define id="ojo" type="String">
		<bean:write property="seg_ojo" name="suplementosForm"/>
	</bean:define>
<bean:define id="error" type="String">
		<bean:write property="error" name="suplementosForm"/>
	</bean:define>
<body onload="valida_error('${error}');if(history.length>0)history.go(+1)">        
	<html:form action="/Suplementos?method=agregar" styleId="busqueda">
        <html:hidden property="suplemento_desc" name="suplementosForm"/>
        <html:hidden property="accion" name="suplementosForm" value=""/>
        <html:hidden property="seg_ojo" styleId="seg_ojo" name="suplementosForm" value="${ojo}"/>
        <table width="400px" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			<!--<bean:message key="suplementos.titulo" />-->
      			<p>SUPLEMENTOS OJO ${ojo}</p>
      		</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" id="cerrar"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	
        <table width="400px" cellspacing="1">    	
    	<tr>
			<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="50%"><bean:message key="suplementos.seleccionar" />
			</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%">
    			<logic:notEmpty name="suplementosForm" property="suplementos">
    			<html:select property="suplemento" name="suplementosForm" styleClass="fto"  onchange="recupera_suplemento(this)">
    				<html:option value="0">Seleccionar</html:option>
    				 <html:optionsCollection property="suplementos" label="descripcion" value="tratami" />
    			</html:select>	
    			</logic:notEmpty>
    			<logic:empty name="suplementosForm" property="suplementos">
    				Artículo no permite suplementos
    			</logic:empty>
    		</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%">
    		</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%" >
    		<label id="texto" title="hola"></label>
    		<logic:notEmpty name="suplementosForm" property="lista_valores_suplementos">
    		<html:select property="valor" styleClass="fto" name="suplementosForm">
    			<html:optionsCollection name="suplementosForm" property="lista_valores_suplementos" label="descripcion" value="codigo"/>
    		</html:select>
    		</logic:notEmpty >
    		
    		
				<html:button value="agregar" property="buscar"	styleClass="fto" title="Agregar Suplemento" onclick="enviar()"/>
				</td>
    	</tr>
        </table>
        
        
        <br>
        <logic:present property="listaSuplementos" name="suplementosForm">
        <table width="400px" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="20%"><bean:message key="suplementos.cdg"/></td>
                    <td id="txt4" bgcolor="#373737" width="60%"><bean:message key="suplementos.descripcion"/></td>
                    <td id="txt4" bgcolor="#373737" width="20%"><bean:message key="suplementos.valor"/></td>     
                </tr>
        </table>
       <div id="scrolling">
       <table width="400px" cellspacing="0">
                <logic:iterate id="suplementos" property="listaSuplementos" name="suplementosForm" indexId="index">
                        <tr bgcolor="#66FFFF">
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="suplementos" property="tratami"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="60%"><bean:write name="suplementos" property="descripcion"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="20%"><bean:write name="suplementos" property="valor"/></td>                            
                            <td id="txt5" bgcolor="#c1c1c1" width="5%">                            	
                            	<a href="#" onclick="eliminarSuplemento('${index}');">
      								<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar suplemento" />
    							</a>
                            </td>
                        </tr>
                    </logic:iterate>
               </table>
               </div>
            </logic:present>
        </html:form>
    </body>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script>    
    	
    	$("#cerrar").on("click",function(){    	    
    		 $.cookie('cris_esp_seg','1');
   			 document.suplementosForm.accion.value = "cerrar";
          	 document.suplementosForm.submit();	
    	});
    </script>
</html:html>