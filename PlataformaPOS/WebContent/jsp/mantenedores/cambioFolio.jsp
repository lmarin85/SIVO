<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
		<script type="text/javascript" src="js/mantenedores/cambioFolio.js"></script>     	
       	<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.min.js"></script>
		<script language="javascript">
			function  cerrarVentana(){
					var estaGrabado = document.getElementById('estaGrabado').value;
        			var boton = false;
        			if(estaGrabado == 0){
        				boton = confirm("¿Desea salir de la página actual sin guardar?");
        			}else{
        				boton = confirm("¿Está seguro de salir de la página actual?");
        			}
					
	        		if (boton)
	        		{
	        			parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
	        		}
	        		else
	        		{
	        			self.close();
	        		}
			}
		</script> 
   	<title><bean:message key="title.pos"/></title>
        
    </head>
    <body onload="inicio_pagina();" >
        <html:form action="/CambioFolio?method=cambioFolio" styleId="busqueda">
            <html:hidden property="accion" name="cambioFolioForm" styleId="tipo" value=""/>
        	<html:hidden property="habilitaCampo" name="cambioFolioForm"  styleId="habilitaCampo" />
        	<html:hidden property="retornoMOdificacion" name="cambioFolioForm"  styleId="retornoMOdificacion" />
        	<html:hidden property="estaGrabado" styleId="estaGrabado" />
        	<html:hidden property="localErrorFolio" name="cambioFolioForm"  styleId="localErrorFolio" />
        	<html:hidden property="mensaje" name="cambioFolioForm"  styleId="mensaje" />
        	
        <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">
      			<bean:message key="cambio.folio.titulo" />
      		</td>
      		
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="habilitarCampos();"> 
					<img src="images/nuevo.png" width="15" height="15" border="0" title="Habilitar Folios a Modificar">	
				</a>
      		</td>
      		<td align="right" bgcolor="#373737" id="txt4" width="30">
              		<a href="#" onclick="cerrarVentana();">      						
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Cambio Folio"> 
    				</a>
    		</td>
    	</tr>
    	</table>
    	
        <table width="100%" align="center">
        <tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" colspan="3" width="30%">    		
    		</td>
    	</tr> 
        <tr>
    		<td align="left" bgcolor="#373737" id="txt4" colspan="3" width="30%">
    		<bean:message key="cambio.folio.guia.titulo" />
    		</td>
    	</tr>   	
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="cambio.folio.desde.guia" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="desdeGuia" styleId="desdeGuia" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="cambio.folio.hasta.guia"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="hastaGuia" styleId="hastaGuia" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#373737" id="txt4" colspan="3" width="30%">
    	<bean:message key="cambio.folio.boleta.titulo" /></td> 
    	</tr>
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="cambio.folio.desde.boleta" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="desdeBoleta" styleId="desdeBoleta"  styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="cambio.folio.hasta.boleta"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="hastaBoleta" styleId="hastaBoleta" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#373737" id="txt4" colspan="3" width="30%">
    	<bean:message key="cambio.folio.notas.titulo" /></td> 
    	</tr>
    	<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5"
					width="30%"><bean:message key="cambio.folio.desde.notas" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%"><html:text
						property="desdeNota"  styleId="desdeNota" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>    	
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"><bean:message key="cambio.folio.hasta.notas"/></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<html:text property="hastaNota" styleId="hastaNota" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
    	</tr>
    	<tr>
    		<td align="left" bgcolor="#c1c1c1" id="txt5" width="30%"></td>
    		<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2" width="70%">
    		<a href="#" id="Guardar" onclick="guardarFolio();" >
      			<img src="images/check.png" width="16" height="16" border="0" title="Ingresar Folio" />
    		</a>
			</td>
    	</tr>
        </table>
              
            
        </html:form>
    </body>
</html>
