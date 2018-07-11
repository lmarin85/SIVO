
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
        <script type="text/javascript" src="js/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="js/venta/busqueda_presupuestos.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>		
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>			
		<script type="text/javascript" src="js/jquery.datepick.js""></script>			
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>	
		<script type="text/javascript">
		load();
		var $j = jQuery.noConflict();
		
			$j(function() {
			$j('#popupDatepicker').datepick();
			});
		</script>
        
        <title><bean:message key="title.pos"/></title>
    </head>
    <body onload="if(history.length>0)history.go(+1)" >
        <html:form action="/BusquedaPresupuestos?method=buscar" styleId="busqueda">
        	
        <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			<bean:message key="busqueda.presupuesto.titulo" />
      		</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Presupuestos"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	
        <table width="100%" align="center">    	
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="busqueda.presupuesto.codigo" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="presupuesto" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="busqueda.presupuesto.rut"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="cliente" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%">
    		<bean:message key="busqueda.presupuesto.fecha"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2" width="70%">
				<html:text property="fecha" styleClass="fto" readonly="true" styleId="popupDatepicker"/>
			</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%">
    		<bean:message key="busqueda.presupuesto.agente"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2" width="70%">
				<html:select property="agente" name="busquedaPresupuestosForm" styleClass="fto"> 
					<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
					<html:optionsCollection name="busquedaPresupuestosForm" property="lista_agentes" label="usuario" value="usuario" />
				</html:select>
			</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<a href="#" onclick="javascript:buscarPresupuestos()" id="enviar">
      						<img src="images/lupa.png" width="16" height="16" border="0" title="Buscar" />
    				</a>
				</td>
    	</tr>
        </table>
        <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="20">Codigo</td>
                    <td id="txt4" bgcolor="#373737" width="20%">agente</td>
                    <td id="txt4" bgcolor="#373737" width="20%">Fecha</td>                    
                    <td id="txt4" bgcolor="#373737" width="20%">Estado</td>
                    <td id="txt4" bgcolor="#373737" width="10%" align="right">
                    </td>
                </tr>
        </table>
        <logic:present property="lista_presupuestos" name="busquedaPresupuestosForm">
       <div id="scrolling">
       <table width="100%" cellspacing="0">
       			<logic:equal value="" name="estado_lista" scope="session">
	                <tr>
	                	<td colspan="6" id="txt5" bgcolor="#c1c1c1" align="center">
	                		NO SE ENCONTRARON RESULTADOS
	                	</td>
	                </tr>
                </logic:equal>
                <logic:notEmpty property="lista_presupuestos" name="busquedaPresupuestosForm">
	                <logic:iterate property="lista_presupuestos" name="busquedaPresupuestosForm" id="presupuestos">
	                        <tr bgcolor="#66FFFF">
	                            
	                                <bean:define id="agente" type="String">
	                                    <bean:write name="presupuestos" property="agente"/>
	                                </bean:define>
	                                <bean:define id="fecha" type="String">
	                                    <bean:write name="presupuestos" property="fecha"/>
	                                </bean:define>                           
	                                <bean:define id="estado" type="String">
	                                    <bean:write name="presupuestos" property="cerrado"/>
	                                </bean:define>
	                                 <bean:define id="cdg" type="String">
	                                    <bean:write name="presupuestos" property="codigo"/>
	                                </bean:define>
	                                
	                            <td id="txt5" bgcolor="#c1c1c1" width="20%" align="center"><bean:write name="presupuestos" property="codigo"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="20%" align="center"><bean:write name="presupuestos" property="agente"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="20%" align="center"><bean:write name="presupuestos" property="fecha"/></td>
	                            <logic:equal value="N" property="cerrado" name="presupuestos">
                            	 <td id="txt5" bgcolor="#c1c1c1" width="15%" align="center">Abierto</td>                      
	                            </logic:equal>  
	                            <logic:equal value="S" property="cerrado" name="presupuestos">
	                            	 <td id="txt5" bgcolor="#c1c1c1" width="15%" align="center">Cerrado</td>                      
	                            </logic:equal>                            
	                            <td id="txt5" bgcolor="#c1c1c1" width="10%">                            	
	                            	<a href="#" onclick="javascript:seleccionaPresupuesto('${agente}','${fecha}','${estado}','${cdg}');">
	      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Presupuesto" />
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
</html>
