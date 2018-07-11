
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<style type="text/css">
#ad{
		padding-top:220px;
		padding-left:10px;
	}
</style>

		<link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/prototype.js"></script>
		<script language="javascript" src="js/utils.js"></script>
		<script language="javascript" src="js/validaciones-graduacion.js"></script>
		<script type="text/javascript" src="js/mantenedores/cliente_graduacion.js"></script>
		

<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<script type="text/javascript" src="js/jquery.datepick-es.js"></script>

<title><bean:message key="title.pos"/></title>

<script language="javascript">	
		
		var $j = jQuery.noConflict();

		function cargaCliente(cliente)
		{				
			document.getElementById("clienteagregadoId").value = cliente[0];
			document.getElementById("codigo_cliente").value = cliente[0];				
        	document.getElementById("nifagregadoId").value = cliente[1];
        	document.getElementById("nombre_cliente").value = cliente[2]; 
        	var cerrarPagina = document.getElementById('cerrarPagina').value;
			       	        	      	
        	location.href("<%=request.getContextPath()%>/Graduaciones.do?method=cargaFormulario&cliente="+cliente[0]+"&nombre="+cliente[2]+"&apellido="+cliente[3]+"&cerrarPagina="+cerrarPagina+"");
        	//document.forms[0].submit();
	
		}

        $j(function() {
			$j('#fechaEmision').datepick();			
		});
		function cerrar_ventanas()
        	{		
        			var estaGrabado = document.getElementById('estaGrabado').value;
        			var pagina = document.getElementById('cerrarPagina').value;
        			
        			if(estaGrabado == 0){
        			
        				var boton = confirm("¿Desea salir de la página actual sin guardar?");
        				
        				if(pagina == 1){
							
							if (boton)
			        		{
								window.parent.hidePopWin(false);
							}	
						}else{
							
			        		if (boton)
			        		{	
			        			parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
			        			
			        		}
			        		else
			        		{
			        			self.close();
			        		}
	        			}   
        				
        			
        			}else{
	        			if(pagina == 1){
							var boton = confirm("\u00BFEst\u00E1 seguro(a) de cerrar la ventana?");
							if (boton)
			        		{
								window.parent.hidePopWin(false);
							}	
						}else{
							var boton = confirm("\u00BFEst\u00E1 seguro(a) de cerrar la ventana?");
			        		if (boton)
			        		{	
			        			parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
			        			
			        		}
			        		else
			        		{
			        			self.close();
			        		}
	        			}        			
        			}					
        		
        	}
		
		function busqueda_cliente()
			{							
				rut  = "";				
				showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&nif="+rut+"", 714, 425, cargaCliente, false);			   	
			   	
			}
			
			function ingreso_contactologia(){
				var estaGrabado = document.getElementById('estaGrabado').value;
				
				var cliente = document.getElementById('codigo_cliente').value;
				var nombre_cliente = document.getElementById('nombre_cliente').value;
				var cerrarPagina = document.getElementById('cerrarPagina').value;
				
				if(estaGrabado == 2){
					var boton = confirm("¿Desea salir de la página actual sin guardar?");
					
					if(boton){
						showPopWin("<%=request.getContextPath()%>/Contactologia.do?method=cargaFormulario&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"&cerrarPagina="+cerrarPagina+"",790, 435, null, false);
					}
					
				}else{
					showPopWin("<%=request.getContextPath()%>/Contactologia.do?method=cargaFormulario&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"&cerrarPagina="+cerrarPagina+"",790, 435, null, false);
				}
				
			}
				
			function buscarMedico()
			{								
				showPopWin("<%=request.getContextPath()%>/BusquedaMedicos.do?method=buscar", 714, 425, cargaMedico, false);
			}
		function ingreso_presupuesto(){
				var estaGrabado = document.getElementById('estaGrabado').value;
				
				var cliente = document.getElementById('codigo_cliente').value;
				var nombre_cliente = document.getElementById('nombre_cliente').value;				
				var pagina = document.getElementById('cerrarPagina').value;
				
				if(estaGrabado == 2){
					
					var boton = confirm("¿Desea salir de la página actual sin guardar?");
					if(boton){
						if(pagina == 1){
							parent.carga_url_padre_encargo("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
						}else{
							location.href("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
						}
					}
				}else{
					if(pagina == 1){
						parent.carga_url_padre_encargo("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}else{
						location.href("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}
				}			
			}
			
		function ingreso_encargo(){
			var estaGrabado = document.getElementById('estaGrabado').value;
			
			var cliente = document.getElementById('codigo_cliente').value;
			var nombre_cliente = document.getElementById('nombre_cliente').value;
			var pagina = document.getElementById('cerrarPagina').value;
			
			if(estaGrabado == 2){
				var boton = confirm("¿Desea salir de la página actual sin guardar?");
				if(boton){
					if(pagina == 1){							
						parent.carga_url_padre_encargo("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}else{					
						location.href("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}	
				}			
			}else{			
				if(pagina == 1){							
					parent.carga_url_padre_encargo("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
				}else{					
					location.href("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
				}		
			}		
					
		}
		function carga_url_padre_traspaso_vta_presupuesto(url)
        {
	    	parent.carga_url_padre_encargo(url);
        }
        function carga_url_padre_traspaso_vta_presupuesto_padre(url)
        {
	    	location.href(url);
        }	
        function buscarDoctorAjax()
        {        	
        	var nifdoctor = document.getElementById('nifdoctor').value;	
        	if("" != nifdoctor){
        		document.getElementById('nombre_doctorDIV').innerHTML = "";
        		document.getElementById('doctor').value = "";
        		document.getElementById('nifdoctor').value = "";
        		document.getElementById('nifdoctor').value = "Buscando...";
        		new Ajax.Request('<html:rewrite page="/Graduaciones.do?method=buscarDoctorAjax"/>', {
				      parameters: {nifdoctor: nifdoctor},      
				      onComplete: function(transport, json) {
				      	if("" != json.nifdoctor){
						      	document.getElementById('nifdoctor').value = json.nifdoctor;
						      	document.getElementById('doctor').value = json.codigodoctor;
						      	document.getElementById('dvnifdoctor').value = json.dvnifdoctor;					      	
						      	document.getElementById('nombre_doctorDIV').innerHTML = json.nombredoctor;
				      	}else{
				      		alert("El doctor con rut "+nifdoctor+" no existe");
				      		document.getElementById('nifdoctor').value = "";
					      	document.getElementById('doctor').value = "";
					      	document.getElementById('dvnifdoctor').value = "";					      	
					      	document.getElementById('nombre_doctorDIV').innerHTML = "";
				      	}					      			         		         
				      }
				   });
        		
        	}else{
        		alert("Debe ingresr rut de doctor.");
        	}	
        }
        
        function nuevoDoctor(){        	
        	showPopWin("<%=request.getContextPath()%>/Medico.do?method=cargaFormulario&pagina=optometria",790, 435, recibeNuevoDoctor, false);
        }        
        
        function recibeNuevoDoctor(doctor){
        	
        	document.getElementById('nifdoctor').value = doctor[1];
			document.getElementById('doctor').value = doctor[0];
			document.getElementById('dvnifdoctor').value = doctor[4];					      	
			document.getElementById('nombre_doctorDIV').innerHTML = doctor[2] +" "+ doctor[3];
			
        }
        </script> 
        
</head>
<body onload="inicio_pagina();if(history.length>0)history.go(+1)">

<html:form action="/Graduaciones?method=IngresaGraduacion" styleId="form1">
<html:hidden property="cerrarPagina" styleId="cerrarPagina"  />
<html:hidden property="pagina" styleId="pagina"  />
<html:hidden property="cliente" styleId="codigo_cliente"  />
<html:hidden property="accion" styleId="accion"/>
<html:hidden property="fecha_graduacion" styleId="fecha_graduacion"/>
<html:hidden property="numero_graduacion" styleId="numero_graduacion" />
<html:hidden property="exito" styleId="exito" />
<html:hidden property="codigo_cliente_agregado" styleId="clienteagregadoId"/>
<html:hidden property="nif_cliente_agregado" styleId="nifagregadoId"/>
<html:hidden property="existe_graduacion" styleId="existe_graduacion"/>
<html:hidden property="cod_doctor" styleId="doctor"/>
 
<html:hidden property="estaGrabado" styleId="estaGrabado" />

<table width="100%" cellspacing="0">

            <tr>
				<td align="left" bgcolor="#373737" id="txt4" width="90%" height="24"
					style="height: 24px"><bean:message
						key="cliente.graduacion.graduacion.cliente" /></td>
				<td align="right" bgcolor="#373737" id="txt4" height="24">
    			<div  id="graduaId" style="display:none" >	
	              		<a href="#"	onclick="nuevo_graduacion()">
								 <img src="images/nuevo.png" width="20" height="20"	border="0" title="Nueva Graduación" >
						</a>
					</div>	
    			</td>
    			<td align="right" bgcolor="#373737" id="txt4" height="24">              		
					<div id="presupuestoId" style="display:none" >
	              	    &nbsp;       		 
	              		<a href="#" onclick="ingreso_presupuesto();" title="Ingreso de Presupuesto" >	      					
	      					<img src="images/presupuestos.jpg" width="15" height="15" border="0" >
	    				</a>
    				</div>
    			</td>
    			<td align="right" bgcolor="#373737" id="txt4" height="24">              		
					<div id="ventaPedidoId" style="display:none" >
	              	    &nbsp;       		 
	              		<a href="#" onclick="ingreso_encargo();" title="Ingreso de Encargo" >	      					
	      					<img src="images/foto.jpg" width="15" height="15" border="0" >
	    				</a>
    				</div>
    			</td>
              	<td align="right" bgcolor="#373737" id="txt4" height="24">              		   
              		
					<div id="recetasId" style="display:none" >
	              	    &nbsp;       		 
	              		<a href="#" onclick="ingreso_contactologia();" title="Ingreso de Contactología" >	      					
	      					<img src="images/contactologia.jpg" width="15" height="15" border="0" >
	    				</a>
    				</div>
    			</td>
              	<td align="right" bgcolor="#373737" id="txt4" height="24">
              		<a href="#" onclick="insertar_graduacion();">
      						<img src="images/check.png" width="15" height="15" border="0" title="Ingreso de Graduación" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" height="24">
    				<a href="#" onclick="cerrar_ventanas();">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Salir de Graduación" >
    				</a>
    			</td>
              </tr>
</table>
<table cellspacing="1" width="100%" border="0">
	
	<tr>
		<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.cliente"/></td>
		<td id="txt5" bgcolor="#c1c1c1" colspan="8">
			<html:text property="nombre_cliente" size="30" styleId="nombre_cliente"  styleClass="fto"/>
			<a href="#" onclick="javascript:busqueda_cliente()">
      			<img src="images/lupa.png" width="15" height="15" border="0" title="Busqueda de Cliente" >
    		</a>
		</td>
		<td id="txt5" bgcolor="#c1c1c1" width="150px">
			<logic:equal name="graduacionesForm" property="diferenteAdd" value="true">
				<html:checkbox property="diferenteAdd" styleId="diferenteADD">Diferente Adicion</html:checkbox>
			</logic:equal>
			<logic:notEqual name="graduacionesForm" property="diferenteAdd" value="true">
				<html:checkbox property="diferenteAdd" styleId="diferenteADD">Diferente Adicion</html:checkbox>
			</logic:notEqual>
		</td>
	</tr>
	<tr>
		<td colspan="10" align="left" bgcolor="#373737" id="txt4"><bean:message key="cliente.graduacion.graduacion"/></td>
	</tr>
	
  <tr>
    <td id="txt5" bgcolor="#c1c1c1">&nbsp;</td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.esfera"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.cilindro"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.eje"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.cerca"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.adicion"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.dn.pl"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.dn.pc"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.avsr"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.avcc"/></td>
  </tr>
  <tr>
    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.od"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_esfera" size="5" styleId="OD_esfera" styleClass="fto" onblur="validaEsfera(this,'derecha');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_cilindro" size="5" styleId="OD_cilindro" styleClass="fto" onblur="validaCilindro(this, 'derecho');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_eje" size="5" styleId="OD_eje" disabled="false"   styleClass="fto" onblur="validaEje(this, 'derecho');"  onkeypress="return validar_numerico(event)" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_cerca"  size="5" styleId="OD_cerca" styleClass="fto" onblur="validacionCerca(this, 'derecha');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_adicion"  size="5" styleId="OD_adicion" styleClass="fto" onblur="validaAdicion(this, 'derecha');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_dnpl" styleId="OD_dnpl"  size="5" styleClass="fto" onblur="validaDNPL(this, 'derecha');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_dnpc" styleId="OD_dnpc" size="5" styleClass="fto" onblur="validaDNPC(this, 'derecha');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_avsc"  styleId="OD_avsc"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OD_avcc"  styleId="OD_avcc"  size="5" styleClass="fto"/></td>
  </tr>
  <tr>
    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.observacion"/></td>
    <td id="txt5" bgcolor="#c1c1c1" colspan="9"><html:text property="OD_observaciones"  size="100" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
  </tr>
  <tr>
    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.graduacion.oi"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_esfera"  size="5" styleId="OI_esfera" styleClass="fto" onblur="validaEsfera(this,'izquierda');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_cilindro"  size="5" styleId="OI_cilindro" styleClass="fto" onblur="validaCilindro(this, 'izquierda');"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_eje"  size="5" styleId="OI_eje"  disabled="false"   styleClass="fto" onblur="validaEje(this, 'izquierdo');"  onkeypress="return validar_numerico(event)" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_cerca"  size="5" styleId="OI_cerca" styleClass="fto" onblur="validacionCerca(this, 'izquierda');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_adicion" styleId="OI_adicion"  size="5" styleClass="fto" onblur="validaAdicion(this, 'izquierda');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_dnpl" styleId="OI_dnpl" size="5" styleClass="fto" onblur="validaDNPL(this, 'izquierda');" /></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_dnpc"   styleId="OI_dnpc" size="5" styleClass="fto" onblur="validaDNPC(this, 'izquierda');"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_avsc"  styleId="OI_avsc"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="OI_avcc"  styleId="OI_avcc"  size="5" styleClass="fto"/></td>
  </tr>
  <tr>
    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="cliente.graduacion.observacion"/></td>
    <td id="txt5" bgcolor="#c1c1c1" colspan="9"><html:text property="OI_observaciones" size="100" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0">
	<tr>
		<td id="txt4" bgcolor="#373737" align="center"><bean:message key="cliente.graduacion.historico"/>
		</td>
		<td id="txt4" bgcolor="#373737" align="center"><bean:message key="cliente.graduacion.prisma"/>
		</td>
		<td id="txt4" bgcolor="#373737" align="center">
		</td>
	</tr>
	<tr>
		<th id="txt5" bgcolor="#c1c1c1">
			<table width="100%" cellspacing="0" >
			  <tr>
			    <td scope="col" id="txt4" bgcolor="#373737" width="40%"><bean:message key="cliente.graduacion.fecha"/></td>
			    <td scope="col" id="txt4" bgcolor="#373737" width="40%"><bean:message key="cliente.graduacion.numero"/></td>
			    <td scope="col" id="txt4" bgcolor="#373737">&nbsp;Detalle</td>
			  </tr>
			 </table>
			<div id="scroll_historico">
				<table width="100%" height="100%">
				<% int i=1; %>
				<logic:present property="listaGraduaciones"
						name="graduacionesForm">
					<logic:iterate id="listaGraduaciones"  property="listaGraduaciones" name="graduacionesForm">
						<bean:define id="numero" type="String">
							<bean:write name="listaGraduaciones" property="numero" />
						</bean:define>
						<bean:define id="fecha" type="String">
							<bean:write name="listaGraduaciones" property="fecha" />
						</bean:define>
						<tr>
							<td scope="col" id="txt5" bgcolor="#c1c1c1" width="40%">
							<bean:write name="listaGraduaciones" property="fecha" /></td>
							<td  scope="col" id="txt5" bgcolor="#c1c1c1"  align="center" width="40%"><bean:write name="listaGraduaciones" property="numero" /></td>
							<td scope="col" id="txt5" bgcolor="#c1c1c1" width="" align="left">
								<a href="#" onclick="ver_graduacion('${numero}','${fecha}')">
									ver
								</a>
							</td>
						</tr>
						<%i++; %> 
					</logic:iterate>
				</logic:present>
				</table>
			</div>
		</th>
		<th id="txt5" bgcolor="#c1c1c1">
			<table width="100%" height="100%" cellspacing="0" align="top">
			  <tr>
			    <td id="txt5" bgcolor="#c1c1c1" colspan="2">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="cliente.graduacion.cantidad"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="cliente.graduacion.base"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="cliente.graduacion.altura"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" >Tipo</td>
			  </tr>
			  <tr>
			  	<td id="txt5" bgcolor="#c1c1c1" width="">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1" align="right"><bean:message key="cliente.graduacion.o.d"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center">					
					<html:select property="OD_cantidad" name="graduacionesForm" styleClass="fto"  styleId="OD_cantidad">						
						<html:optionsCollection name="graduacionesForm"
						property="listaCantidadOD" 	styleClass="fto" value="codigo" label="descripcion"  />
					</html:select>							
				</td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center">					
					<html:select property="OD_base" name="graduacionesForm" styleClass="fto"  styleId="OD_base">  
						
						<html:optionsCollection name="graduacionesForm"
						property="listaBaseOD" 	styleClass="fto" value="descripcion" label="descripcion"  />
					</html:select>			
				</td>
			    <td id="txt5" bgcolor="#c1c1c1"align="center">
			    	<html:text property="OD_altura"  styleId="OD_altura"  size="5" styleClass="fto" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1" width="">&nbsp;Interna 
					<html:radio property="tipo" value="I"  ></html:radio>
				</td>
			  </tr>
			  <tr>
			  	<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1" align="right"><bean:message key="cliente.graduacion.o.i"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center">			    	
			    	<html:select property="OI_cantidad" name="graduacionesForm" styleClass="fto"  styleId="OI_cantidad"> 						
						<html:optionsCollection name="graduacionesForm"
						property="listaCantidadOI" 	styleClass="fto" value="codigo" label="descripcion"  />
					</html:select>							
			  	</td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center">
			    	
			    	<html:select property="OI_base" name="graduacionesForm" styleClass="fto"  styleId="OI_base">						
						<html:optionsCollection name="graduacionesForm"
						property="listaBaseOI" 	styleClass="fto" value="descripcion" label="descripcion"  />
					</html:select>	
				</td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center">
			    	<html:text property="OI_altura" size="5" styleId="OI_altura" styleClass="fto" ></html:text>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" >&nbsp;Externa
					<html:radio property="tipo" value="E"  ></html:radio>
				</td>
			  </tr>

			</table>
			
		</th>
		<th id="txt5" bgcolor="#c1c1c1">
			<table width="100%" height="100%" border="0" cellspacing="0">
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"></td>
				</tr>
				<tr>
					<td  id="txt5" bgcolor="#c1c1c1">
							
					</td>
				</tr>
				<tr>
		
				</tr>
				<tr height="60">
					<td align="center" id="txt5" bgcolor="#c1c1c1"></td>
				</tr>
			</table>
		</th>
	</tr>
</table>

		<table width="100%" border="0" cellspacing="1">
			<tr  id="txt5" bgcolor="#c1c1c1">
				<td width="100" id="txt5" bgcolor="#c1c1c1" align="left"><bean:message
						key="cliente.graduacion.oftalmologo" />
						
				</td>
				<td id="txt5" bgcolor="#c1c1c1" align="left" style="width: 450px"  colspan="2" >
					<html:text property="nifdoctor" name="graduacionesForm" styleId="nifdoctor" styleClass="fto" size="15" maxlength="15" /> 
						-
					<html:text property="dvnifdoctor" size="2" readonly="true" styleClass="fto" styleId="dvnifdoctor" />
					
					<a href="#" onclick="javascript:buscarDoctorAjax();"  > <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de cliente"> </a> 
					<a href="#" onclick="javascript:buscarMedico();"
					title="Busqueda de Doctor"> <img src="images/lupa.png"
						width="15" height="15" border="0"> </a>
					<a href="#" onclick="javascript:nuevoDoctor();" id="imagen1" style="display: " > <img
						src="images/nuevo.png" width="15" height="15" border="0"
						title="Ingreso de nuevo doctor"> </a> 
				</td>
					
				<td colspan="6" id="txt5" bgcolor="#c1c1c1" style="width: 511px" width="511">
					
					<div id="nombre_doctorDIV"><bean:write name="graduacionesForm"  property="nombre_doctor"/></div>
				</td>
			</tr>

			<tr  id="txt5" bgcolor="#c1c1c1">
				<td id="txt5" bgcolor="#c1c1c1" align="left"><bean:message
						key="cliente.graduacion.atendido.por" /></td>
				<td id="txt5" bgcolor="#c1c1c1" align="left" width="450"><html:select
						property="agente" name="graduacionesForm" styleClass="fto"
						styleId="agente" title="">
						<html:option value="-1">
							<bean:message key="cliente.graduacion.seleccione.agente" />
						</html:option>
						<html:optionsCollection name="graduacionesForm"
							property="listaAgentes" label="usuario" value="usuario"
							styleClass="fto" />
					</html:select>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" align="left" style="width: 95px"><bean:message
						key="cliente.graduacion.f.emision" /></td>
				<td id="txt5" bgcolor="#c1c1c1" align="left"><html:text
						property="fechaEmision" readonly="true" size="10"
						name="graduacionesForm" styleClass="fto" styleId="fechaEmision"
						title="Haga click aquí para abrir calendario"
						onchange="suma_fecha();" /></td>
				<td id="txt5" bgcolor="#c1c1c1" align="left">F. Prox. Revisión</td>
				<td id="txt5" bgcolor="#c1c1c1" align="left" colspan="4"><html:text
						property="fechaProxRevision" readonly="true"
						styleId="fechaProxRevision" styleClass="fto" /></td>
			</tr>

		</table>
	</html:form>
</body>
</html:html>