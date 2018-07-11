<%-- 
    Document   : busqueda_clientes
    Created on : 28-dic-2011, 10:29:14
    Author     : Advice70
--%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<link rel="stylesheet" type="text/css" href="css/estiloFormularios.css" />
       	<script type="text/javascript" src="js/mantenedores/busquedaGiro.js"></script>
       	<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.min.js"></script>
		<script type="text/javascript">
		load();
		</script>
        
               	<title><bean:message key="title.pos"/></title>
        
    </head>
    <body onload="if(history.length>0)history.go(+1)">
        <html:form action="/Cliente?method=busquedaGiro" styleId="busqueda">
            <html:hidden property="accion" styleId="tipo" value=""/>
        	        
        <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			<bean:message key="buscar.cliente.giro.titulo" />
      		</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Clientes"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	
        <table width="100%" align="center">    	
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="buscar.cliente.giro.codigo" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="giro" styleClass="fto"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="buscar.cliente.giro.descripcion"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="descripcionGiro" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<a href="#" onclick="javascript:Seleccion('busqueda')" id="enviar">
      						<img src="images/lupa.png" width="16" height="16" border="0" title="Buscar Giro" />
    				</a>
				</td>
    	</tr>
        </table>
        
        
        <br>
                  
        
        <logic:present property="listaGiros" name="clienteForm">
        <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="10%"><bean:message key="buscar.cliente.giro.codigo"/></td>
                    <td id="txt4" bgcolor="#373737" width="25%"><bean:message key="buscar.cliente.giro.descripcion"/></td>
                   	<td id="txt5" bgcolor="#373737" width="10%">  </td>
                </tr>
        </table>
       <div id="scrolling">
       <table width="100%" cellspacing="0">
                <logic:iterate id="listaGirosId" property="listaGiros" name="clienteForm">
                        <tr bgcolor="#66FFFF">
                            
                                <bean:define id="giro" type="String">
                                    <bean:write name="listaGirosId" property="codigo"/>
                                </bean:define>
                                <bean:define id="descripcion" type="String">
                                    <bean:write name="listaGirosId" property="descripcion"/>
                                </bean:define>
                                
                                
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGirosId" property="codigo"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="25%"><bean:write name="listaGirosId" property="descripcion"/></td>
                          
                            <td id="txt5" bgcolor="#c1c1c1" width="10%">                            	
                            	<a href="#" onclick="javascript:seleccionaGiro('${giro}','${descripcion}');">
      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Giro" />
    							</a>
                            </td>
                        </tr>
                    </logic:iterate>
               </table>
               </div>
            </logic:present>
        </html:form>
    </body>
</html>
