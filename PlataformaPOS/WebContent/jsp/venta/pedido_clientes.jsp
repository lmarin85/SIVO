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
        <link rel="stylesheet" type="text/css" href="css/estilos.css" />
        <script type="text/javascript" src="js/utils.js"></script>
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
        <script type="text/javascript" src="js/venta/pedido_clientes.js"></script>
        <script type="text/javascript" src="js/jquery-1.3.min.js"></script>
		<script type="text/javascript">
		load();
		</script>
        
        <title><bean:message key="title.pos"/></title>
    </head>
    <body onload="if(history.length>0)history.go(+1)" >
        <html:form action="/BusquedaClientes?method=buscar" styleId="busqueda">
            <html:hidden property="accion" styleId="tipo" value=""/>
        	<html:hidden property="pagina" styleId="pagina" />
            
        <logic:present name="listaPedidos">
        <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="10%">Agente</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Codigo</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Fecha Pedido</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Hora</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Fecha Entrega</td>                    
                    <td id="txt4" bgcolor="#373737" width="25%">Anticipo</td>
                    <td id="txt4" bgcolor="#373737" width="5%" align="right">
                    	<a href="#" onclick="window.parent.hidePopWin(false);">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar">
    					</a>
                    </td>
                </tr>
        </table>
       <div id="scrolling">
       <table width="100%" cellspacing="0">
                <logic:iterate name="listaPedidos" id="pedidos">
                        <tr bgcolor="#66FFFF">
                            
                                <bean:define id="agente" type="String">
                                    <bean:write name="pedidos" property="agente"/>
                                </bean:define>
                                <bean:define id="fechaPedido" type="String">
                                    <bean:write name="pedidos" property="fechaPedido"/>
                                </bean:define>
                                  <bean:define id="fechaEntrega" type="String">
                                    <bean:write name="pedidos" property="fechasEntragas"/>
                                </bean:define>                            
                                <bean:define id="anticipo" type="String">
                                    <bean:write name="pedidos" property="anticipo"/>
                                </bean:define>
                                 <bean:define id="cdg" type="String">
                                    <bean:write name="pedidos" property="cdg"/>
                                </bean:define>
                                
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="pedidos" property="agente"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="cdg"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="fechaPedido"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="horaP"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="pedidos" property="fechasEntragas"/></td>  
                            <td id="txt5" bgcolor="#c1c1c1" width="25%">$ <bean:write name="pedidos" property="anticipo"/></td>                           
                            <td id="txt5" bgcolor="#c1c1c1" width="10%">                            	
                            	<a href="#" onclick="javascript:seleccionaCliente('${agente}','${fechaPedido}','${fechaEntrega}','${anticipo}','${cdg}');">
      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Cliente" />
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
