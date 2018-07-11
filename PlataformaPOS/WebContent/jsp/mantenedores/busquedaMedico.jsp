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
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<link rel="stylesheet" type="text/css" href="css/estiloFormularios.css" />
       	<script type="text/javascript" src="js/mantenedores/busquedaMedico.js"></script>
       	<title><bean:message key="title.pos"/></title>

    </head>
    <bean:define id="error" type="String">
		<bean:write property="error" name="busquedaMedicoForm"/>
	</bean:define>
	
    <body onload="javascript:estado('${error}');if(history.length>0)history.go(+1)">
        <html:form action="/BusquedaMedicos?method=buscarMedico" styleId="busqueda">
            <html:hidden property="accion" styleId="tipo" value=""/>
        	
        
        <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			<bean:message key="medico.buscar.medico" />
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
					width="30%"><bean:message key="buscar.cliente.codigo" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="codigo" styleClass="fto"/>
				</td>
    	</tr> 
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="buscar.cliente.nif" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%" ><html:text
						property="nif" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="buscar.cliente.apellido"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="apellido" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%">
    		<bean:message key="buscar.cliente.nombre"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2" width="70%">
				<html:text property="nombre" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
			</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:button
						value="buscar" onclick="javascript:Seleccion('busquedaMedicos')"
						property="buscar" styleClass="fto" title="Buscar Doctor"/>
				</td>
    	</tr>
        </table>
        
        
        <br>
                  
        
        <logic:present property="listaOftalmologos" name="busquedaMedicoForm">
        <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="10%"><bean:message key="buscar.cliente.nif"/></td>
                    <td id="txt4" bgcolor="#373737" width="25%"><bean:message key="buscar.cliente.apellido"/></td>
                    <td id="txt4" bgcolor="#373737" width="25%"><bean:message key="buscar.cliente.nombre"/></td>                    
                    <td id="txt4" bgcolor="#373737" width="10%"><bean:message key="buscar.cliente.agregar"/></td>
                </tr>
        </table>
       <div id="scrolling">
       <table width="100%" cellspacing="0">
                <logic:iterate id="oftalmologo" property="listaOftalmologos" name="busquedaMedicoForm">
                        <tr bgcolor="#66FFFF">
                            
								                            
                                <bean:define id="codigo" type="String">
                                    <bean:write name="oftalmologo" property="codigo"/>
                                </bean:define>
                               
                               
	                            <bean:define id="nif" type="String">
	                            	<bean:write name="oftalmologo" property="nif"/>
	                            </bean:define>
                               
                                
                                <bean:define id="lnif" type="String">
                                    <bean:write name="oftalmologo" property="lnif"/>
                                </bean:define>
                               
                                <bean:define id="nombre" type="String">
                                    <bean:write name="oftalmologo" property="nombre"/>
                                </bean:define>
                                
                                <bean:define id="apelli" type="String">
                                    <bean:write name="oftalmologo" property="apelli"/>
                                </bean:define>
                                
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="oftalmologo" property="nif"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="25%"><bean:write name="oftalmologo" property="apelli"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="25%"><bean:write name="oftalmologo" property="nombre"/></td>                            
                            <td id="txt5" bgcolor="#c1c1c1" width="10%">                            	
                            	<a href="#" onclick="javascript:seleccionaMedico('${codigo}','${nif}','${lnif}','${nombre}','${apelli}');">
      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Medico" />
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
