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
		 <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/venta/presupuesto_clientes.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.min.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript">
		load();
		</script>
		
       	<title><bean:message key="title.pos"/></title>
        
    </head>
    <body>
        <html:form action="/Presupuesto?method=cargaPresupuestos" styleId="busqueda">
            <html:hidden property="accion" styleId="tipo" value=""/>
            
        <logic:present property="listaPresupuestos" name="presupuestoForm">
        <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="15%">Agente</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Fecha Encargo</td>  
                    <td id="txt4" bgcolor="#373737" width="15%">Código</td>
                    <td id="txt4" bgcolor="#373737" width="15%" align="left">Estado</td>
                    <td id="txt4" bgcolor="#373737" width="15%" align="right">
                    	<a href="#" onclick="window.parent.hidePopWin(false);">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar">
    					</a>
                    </td>
                </tr>
        </table>
       <div id="scrolling">
       <table width="100%" cellspacing="0">
                <logic:iterate property="listaPresupuestos" id="presup" indexId="index" name="presupuestoForm">
                        <tr bgcolor="#66FFFF">
                                                     
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="presup" property="id_agente"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="presup" property="fecha"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="presup" property="codigo"/></td>  
                            <logic:equal value="N" property="cerrado" name="presup">
                            	 <td id="txt5" bgcolor="#c1c1c1" width="15%">Abierto</td>                      
                            </logic:equal>  
                            <logic:equal value="S" property="cerrado" name="presup">
                            	 <td id="txt5" bgcolor="#c1c1c1" width="15%">Cerrado</td>                      
                            </logic:equal> 
                            <td id="txt5" bgcolor="#c1c1c1" width="15%">                            	
                            	<a href="#" onclick="javascript:seleccionaPresupuesto('${index}');">
      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Presupuesto" />
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

