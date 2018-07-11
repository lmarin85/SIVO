
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
<title><bean:message key="title.pos"/></title>
<style type="text/css">
#ad{
		padding-top:220px;
		padding-left:10px;
	}
</style>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/subModal.css" />
<script language="javascript" src="js/utils.js"></script>	
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/subModal.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/validaciones-graduacion.js"></script>
<script type="text/javascript" src="js/mantenedores/medico.js"></script>
<script language="javascript">
		function cerrar_ventanas()
        	{		var estaGrabado = document.getElementById('estaGrabado').value;
					var pagina = document.getElementById("pagina").value;
					var exito = document.getElementById("exito").value;					
					
					
					if(estaGrabado == 0){
					
						var boton = confirm("¿Desea salir de la página actual sin guardar?");
						if (boton)
		        		{
		        			if("optometria" == pagina){
		        				if("optometria" == pagina && ("0" == exito || "2" == exito)){
		        					enviaMedico();	        					
		        				}else{
		        					window.parent.hidePopWin(false);
		        				}
		        			}else{
		        				parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
		        			}	
		        		}
						
						
					}else{
						var boton = confirm("\u00BFEsta seguro de cerrar la ventana?");
						if (boton)
		        		{	
		        			if("optometria" == pagina){
		        				if("optometria" == pagina && ("0" == exito || "2" == exito)){
		        					enviaMedico();	        					
		        				}else{
		        					window.parent.hidePopWin(false);
		        				}
		        			}else{
		        				parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
		        			}	
		        			
		        			
			        	}
			        	else
			        	{
			        		self.close();
			        	}
        		
					}        		
        	}

		function buscarMedico()
			{
			   	var rut = document.getElementById('rut').value;		
				rut  = trim(rut);							
				showPopWin("<%=request.getContextPath()%>/BusquedaMedicos.do?method=buscar&nif="+rut+"", 714, 425, cargaCliente, false);
			}
		function enviaMedico(){
			var codigo_doctor = document.getElementById("medicoagregadoId").value;
	        var nif_doctor = document.getElementById("nifagregadoId").value;
	        var dvnif_doctor = document.getElementById("dvnif_medico_agregado").value;
	        var nombre_doctor = document.getElementById("nombre_medico_agregado").value;
	        var apellido_doctor = document.getElementById("apellido_medico_agregado").value;
			returnVal = new Array(codigo_doctor, nif_doctor, nombre_doctor, apellido_doctor, dvnif_doctor);
			
			window.parent.hidePopWin(true);
		}	
        </script> 

</head>
<body onload="inicio_pagina();if(history.length>0)history.go(+1)">

	<html:form action="Medico?method=ingresaMedico" >
	<html:hidden property="accion" value=""/>
	<html:hidden property="exito" styleId="exito" />
	<html:hidden property="codigo_medico_agregado" styleId="medicoagregadoId"/>
	<html:hidden property="nif_medico_agregado" styleId="nifagregadoId"/>
	<html:hidden property="nombre_medico_agregado" styleId="nombre_medico_agregado"/>
	<html:hidden property="apellido_medico_agregado" styleId="apellido_medico_agregado"/>
	<html:hidden property="dvnif_medico_agregado" styleId="dvnif_medico_agregado"/>
	<html:hidden property="pagina"  styleId="pagina" />
	<html:hidden property="estaGrabado" styleId="estaGrabado" />
	
		<table width="100%" cellspacing="0" border="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="medico.medicos"/></td> 
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#" onclick="ingresaMedico();">
      						<img src="images/check.png" width="15" height="15" border="0" title="Ingreso de Doctor">
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="cerrar_ventanas();">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Salir" >
    				</a>
    			</td>
              </tr>
            </table>
		<table cellspacing="1" width="100%">
			<tr>
				<td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:message key="medico.codigo"/></td>
				<td id="txt5" bgcolor="#c1c1c1" width="116" style="width: 116px"><html:text
						property="codigo" size="10" styleClass="fto" readonly="true" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="2" width="696"><bean:message key="medico.rut"/>
				<html:text property="rut" size="15" maxlength="15" styleId="rut" styleClass="fto" onblur="retornaDv(this);"/>
				-<html:text property="dv" size="2" styleClass="fto" readonly="true" styleId="dv"/>
				<a href="#" onclick="javascript:buscarMedico();" style="display:" id="buscarDocID" >
      						<img src="images/lupa.png" width="15" height="15"  border="0" title="Buscar">
    				</a>
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.apellidos"/></td>
				<td colspan="3" id="txt5" bgcolor="#c1c1c1" ><html:text maxlength="34" property="apellidos" styleId="apellidos" size="40" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"  maxlength="20" /></td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.nombres"/>
				</td>
				<td colspan="3" id="txt5" bgcolor="#c1c1c1"> <html:text maxlength="25"  property="nombres" styleId="nombres" size="40" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"  maxlength="20" /></td>
			</tr>			
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.direccion"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> <html:text property="direccion" size="60" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();" maxlength="20" />
				</td>
				
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="menu.locali"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> <html:text maxlength="25"  property="locali" size="60" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
				
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.provincia"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> 
					<html:select
								property="provinci" styleClass="fto" styleId="provincia" > 
								<html:option value="-1"><bean:message key="medico.seleccione.provincia"/></html:option>
								<html:optionsCollection name="medicoForm" property="listaProvincia"
									label="descripcion" value="codigo" />
					</html:select>
				</td>
				
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.externo"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> 
					<html:checkbox property="externo" value="S"></html:checkbox>
				</td>
				
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.telefono"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> <html:text property="tfno" maxlength="12"  size="60" styleClass="fto"  onblur="javascript:this.value=this.value.toUpperCase();"  maxlength="20" />
				</td>
				
			</tr>	
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.fax"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> <html:text property="fax"  maxlength="15" size="60" styleClass="fto"  onblur="javascript:this.value=this.value.toUpperCase();"  maxlength="20" />
				</td>
				
			</tr>	
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.email"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> <html:text property="email" maxlength="20"  size="60" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"  maxlength="20" />
				</td>
				
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="medico.postal"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"> <html:text maxlength="6"  property="codpos" size="60" styleClass="fto"  onblur="javascript:this.value=this.value.toUpperCase();"  maxlength="20" />
				</td>
				
			</tr>			
			
		</table>
	</html:form>

</body>
</html:html>