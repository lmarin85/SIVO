<%-- 
    Document   : busqueda_pedidos
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
        <script type="text/javascript" src="js/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="js/venta/devolucion.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>		
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>			
		<script type="text/javascript" src="js/jquery.datepick.js"></script>			
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>	
		<script type="text/javascript">
		load();
		var $j = jQuery.noConflict();
		
			$j(function() {
			$j('#popupDatepicker').datepick();
			});
		
		function buscarAlbaranes(){
			var respuesta = false;
			var codigo1 = document.getElementById("codigo1").value;
			var codigo1 = document.getElementById("codigo2").value;
			
			var nif = document.getElementById("nif").value;
			var fecha = document.getElementById("popupDatepicker").value;
			var agente = document.getElementById("agente").value;
			var cdg = "";
			if("" != codigo1 && "" != codigo2){
				cdg = codigo1 +"/"+codigo2;
			}
			
			if(""==cdg && ""==nif && ""==fecha && 0==agente){
				alert("Debe ingresar al menos un campo para realizar la busqueda");
				respuesta = true;
			}else{
				respuesta = false;
			}
			
			if(respuesta==false){				
				document.devolucionForm.submit();
			}
		}
		function selecAlbaran(agente,fecha_albaran,cdg)
		{   
			
		    returnVal = new Array(agente,fecha_albaran,cdg);
		    window.parent.hidePopWin(true);
		}	
		</script>
        
        <title><bean:message key="title.pos"/></title>
    </head>
    <body onload="if(history.length>0)history.go(+1)" >
    	  
    <html:form action="/Devolucion?method=buscarAlbaran" >
        			 
        <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			Busqueda de Albarán
      		</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Encargos"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	
        <table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td id="txt4" bgcolor="#373737" width="10%">Agente</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Codigo</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Fecha Albaran</td>
                    <td id="txt4" bgcolor="#373737" width="15%">Hora</td>  
                    <td id="txt4" bgcolor="#373737" width="15%">NIF</td>                                  
                    <td id="txt4" bgcolor="#373737" width="10%" align="right">
                    </td>
                </tr>
        </table>
       <logic:present property="lista_albaranes" name="devolucionForm">
       <div id="scrolling">
        <table width="100%" cellspacing="0">
       			<logic:equal name="devolucionForm" property="estado_lista_albaran" value="0" >
	                <tr>
	                	<td colspan="6" id="txt5" bgcolor="#c1c1c1" align="center">
	                		NO SE ENCONTRARON RESULTADOS
	                	</td>
	                </tr>
                </logic:equal>
                <logic:notEmpty property="lista_albaranes" name="devolucionForm">
	                <logic:iterate property="lista_albaranes" name="devolucionForm" id="albaran">
	                        <tr bgcolor="#66FFFF">
	                            
	                                <bean:define id="agente_albaran" type="String">
	                                    <bean:write name="albaran" property="agente_albaran"/>
	                                </bean:define>
	                                <bean:define id="fecha_albaran" type="String">
	                                    <bean:write name="albaran" property="fecha_albaran"/>
	                                </bean:define>	                                                                
	                                 <bean:define id="codigo_albaran" type="String">
	                                    <bean:write name="albaran" property="codigo_albaran"/>
	                                </bean:define>
	                                
	                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="albaran" property="agente_albaran"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="albaran" property="codigo_albaran"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="albaran" property="fecha_albaran"/></td>
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="albaran" property="hora_albaran"/></td>	
	                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="albaran" property="nif_cliente"/>-<bean:write name="albaran" property="dv_nif"/></td>                                                              
	                            <td id="txt5" bgcolor="#c1c1c1" width="10%">                            	
	                            	<a href="#" onclick="javascript:selecAlbaran('${agente_albaran}','${fecha_albaran}','${codigo_albaran}');">
	      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Albaran" />
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
