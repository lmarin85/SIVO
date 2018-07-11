
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title><bean:message key="title.pos"/></title>

<style type="text/css">
#ad{
		padding-top:220px;
		padding-left:10px;
	}
.mk{
	display:none;
}
</style>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/subModal.css" />
<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/prototype.js"></script>
<script language="javascript" src="js/utils.js"></script>	
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/subModal.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/mantenedores/cliente.js"></script>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<script type="text/javascript" src="js/jquery.datepick-es.js"></script>


<script language="javascript">
		var $j = jQuery.noConflict();
		var buscandoOnBlur = false;
		var val_rut = /^[0-9]{7,8}$/; 
		
		$j(function() {
		
			$j('#fnacimiento').datepick({
				yearRange: '1900:-0'	
			});	
		});
		function cerrar_ventanas()
        	{
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
	        			$j.cookie("venta_directa","0");
	        			self.close();
	        		}    
        	}
		function busqueda_cliente()
			{
				var rut = document.getElementById('rut').value;				
				rut  = trim(rut);				
				showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&nif="+rut+"", 714, 425, cargaCliente, false);
			   	//window.open("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&nif="+rut+"","popup","width=800, height=400,location=no,top=100,left=120");
			   	
			}
		function busqueda_cliente_factura(){
			var rut = document.getElementById('remitenteId').value;				
				rut  = trim(rut);				
				showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&nif="+rut+"", 714, 425, cargaClienteFactura, false);
		
		}
		function busqueda_cliente_giro(){
			
			showPopWin("<%=request.getContextPath()%>/Cliente.do?method=CargabusquedaGiro", 714, 425, cargaGiro, false);
		}		
		function cliente_graduacion()
			{	
				var estaGrabado = document.getElementById('estaGrabado').value;
				if(estaGrabado == 2){
					var boton = confirm("¿Desea salir de la página actual sin guardar?");
					
					if(boton){
						var codigo_cliente = document.getElementById('clienteagregadoId').value;
						var nombre = document.getElementById('nombre').value;
						var apellido = document.getElementById('apellido').value;
						showPopWin("<%=request.getContextPath()%>/Graduaciones.do?method=cargaFormulario&cliente="+codigo_cliente+"&nombre="+nombre+"&apellido="+apellido+"&cerrarPagina=1", 815, 415, null, false);
					}								
				}else{
					var codigo_cliente = document.getElementById('clienteagregadoId').value;
					var nombre = document.getElementById('nombre').value;
					var apellido = document.getElementById('apellido').value;
					showPopWin("<%=request.getContextPath()%>/Graduaciones.do?method=cargaFormulario&cliente="+codigo_cliente+"&nombre="+nombre+"&apellido="+apellido+"&cerrarPagina=1", 815, 415, null, false);
				}
				
			}
        	function buscarClienteAjax()
			{
			   var remitenteId = document.getElementById('remitenteId').value;			   
			   document.getElementById('accion').value = "traeClienteSeleccionadoFactura";
				if(val_rut.test(remitenteId) != false ){
				document.getElementById('remitenteId').value = "Buscando...";
				   new Ajax.Request('<html:rewrite page="/Cliente.do?method=traeClienteSeleccionadoFactura"/>', {
				      parameters: {remitenteId: remitenteId},      
				      onComplete: function(transport, json) {
				      	 if(val_rut.test(remitenteId) != false ){
				      	 	document.getElementById('remitenteId').value = json.remitenteId;	
				      	 	var nombre_cliente_facturaDIV1 = document.getElementById("nombre_cliente_facturaDIV1");	
							nombre_cliente_facturaDIV1.style.display="none";
							document.getElementById('nombre_cliente_facturaDIV').innerHTML="";//limpiar el div por si se habia realizado una busqueda anteriormente	
				      	 	var Seccion = document.getElementById('nombre_cliente_facturaDIV');	
				      	 	Seccion.style.display="";
				         	document.getElementById('nombre_cliente_facturaDIV').innerHTML=json.nombre_cliente_factura;
				         	document.getElementById("tipo_via_factura").value = json.tipo_via_factura;
				         	document.getElementById("via_factura").value = json.via_factura;
				         	document.getElementById("numero_factura").value = json.numero_factura;
				         	document.getElementById("localidad_factura").value = json.localidad_factura;
				         	document.getElementById("provincia_factura").value = json.provincia_factura;
				         	document.getElementById("clienteagregadoId_factura").value = json.clienteagregadoId_factura;
				         	document.getElementById("nifagregadoId_factura").value = json.nifagregadoId_factura;
				         	document.getElementById("dvFactura").value = json.dvFactura;								         
				      	 }else{
				      	 	alert("El cliente no existe.");
				      	 	document.getElementById('remitenteId').value = remitenteId;
				      	 	var nombre_cliente_facturaDIV1 = document.getElementById("nombre_cliente_facturaDIV1");	
							nombre_cliente_facturaDIV1.style.display="none";
				      	 	document.getElementById('nombre_cliente_facturaDIV').innerHTML="";
				      	 	document.getElementById("tipo_via_factura").value = "";
				         	document.getElementById("via_factura").value = "";
				         	document.getElementById("numero_factura").value = "";
				         	document.getElementById("localidad_factura").value = "";
				         	document.getElementById("provincia_factura").value = "";
				         	document.getElementById("clienteagregadoId_factura").value = "";
				         	document.getElementById("nifagregadoId_factura").value = "";
				         	document.getElementById("dvFactura").value = "";		
				      	 }				         		         
				      }
				   });
			   }else{
			   	alert("Debe ingresar un rut válido.");
			   }
			}
			
			function buscarGiroAjax()
			{
			   var giroID = document.getElementById('giroID').value;			   
			   document.getElementById('accion').value = "traeGiroSeleccionadoFactura";
				if("" != giroID){
				document.getElementById('giroID').value = "Buscando...";
				   new Ajax.Request('<html:rewrite page="/Cliente.do?method=traeGiroSeleccionadoFactura"/>', {
				      parameters: {giroID: giroID},      
				      onComplete: function(transport, json) {
				      	 if("" != json.giroID){
				      	 	document.getElementById('giroID').value = json.giroID;	
				      	 	var nombre_cliente_facturaDIV1 = document.getElementById("descripcionGiroDIV");
				      	 	document.getElementById('descripcionGiroDIV').innerHTML="";//limpiar el div por si se habia realizado una busqueda anteriormente	
							//nombre_cliente_facturaDIV1.style.display="";								
				      	 	document.getElementById('descripcionGiroDIV').innerHTML=json.descripcion;
				      	 	document.getElementById('descripcionGiro').value = json.descripcion;
				      	 }else{
				      	 	alert("El giro no existe.");
				      	 	document.getElementById('giroID').value = giroID;
				      	 	document.getElementById('descripcionGiroDIV').innerHTML="";
				      	 	document.getElementById('descripcionGiro').value = "";
				      	 }				         		         
				      }
				   });
			   }else{
			   	alert("Debe ingresar código de giro");
			   }
			}
		
			function buscarClientePrincipalAjax(boton)
			{
				var $j = jQuery.noConflict();
			    var remitenteId = document.getElementById('rut').value;  
			    if(boton == 'boton'){
					    if(!buscandoOnBlur)
					    {
								if(val_rut.test(remitenteId) != false ){
										document.getElementById('rut').value = "Buscando...";
										$j.ajax({
											  type: "POST",
											  url: 'BusquedaClientes.do?method=buscarClienteAjax',
											  dataType: "json",
											  data:"nif="+remitenteId,
											  asycn:false,
											  success: function(json){
										      	 if("" != json.codigo_cliente){				      	 		      	 	
						        					var miArray = new Array(10);
						        						
						        						miArray[0] = json.codigo_cliente;        						
												      	miArray[1] = json.nif;						      	
												      	miArray[2] = json.nombre;						      	
												      	miArray[3] = json.apellido;						      	
												      	miArray[4] = json.dvnif;	
										         		cargaCliente(miArray);
										         	
										      	 }else{
										      	 	alert("El cliente no existe.");
										      	 	document.getElementById('rut').value = "";
										      	 	
										      	 }				         		         
										      }
									     });
								   }else{
								   		alert("Debe ingresar un rut de cliente válido");
								   }
					    }else{	   
					   		alert("verificado rut, por favor espere.");
					   	}
			   		}else{
					   	//if("" != remitenteId){
					   	if(val_rut.test(remitenteId) != false ){
						   	buscandoOnBlur = true;
							document.getElementById('rut').value = "Buscando...";
							$j.ajax({
								  type: "POST",
								  url: 'BusquedaClientes.do?method=buscarClienteAjax',
								  dataType: "json",
								  data:"nif="+remitenteId,
								  asycn:false,
								  success: function(json){
							      	 if("" != json.codigo_cliente){				      	 		      	 	
			        					var miArray = new Array(10);
			        						
			        						miArray[0] = json.codigo_cliente;        						
									      	miArray[1] = json.nif;						      	
									      	miArray[2] = json.nombre;						      	
									      	miArray[3] = json.apellido;						      	
									      	miArray[4] =  json.dvnif;	
							         		cargaCliente(miArray);				   
							      	 }else{
							      	 	document.getElementById('rut').value = remitenteId;
							      	 	var dv = dvval($j("#rut").val());
							      	 	
							      	 	$j("#dv").val(dv);
							      	 	
							      	 }			         		         
							      }
							   });
					   }else{
					   		alert("Debe ingresar un rut de cliente válido");
					   }
			      }
			}
</script> 
	
</head>
<body onload="inicio_pagina_cliente();if(history.length>0)history.go(+1)">
	<html:form action="Cliente?method=ingresoCliente" styleId="form_cliente" >
		<html:hidden property="accion" value="" styleId="accion"/>
		<html:hidden property="exito" styleId="exito"/>
		<html:hidden property="codigo_cliente_agregado" styleId="clienteagregadoId"/>
		<html:hidden property="nif_cliente_agregado" styleId="nifagregadoId"/>
		<html:hidden property="agente_sucursal" styleId="agente_sucursal"/>
		<html:hidden property="estado_pagina" styleId="estado_pagina"/>
		<html:hidden property="codigo_cliente_agregado_factura" styleId="clienteagregadoId_factura"/>
		<html:hidden property="nif_cliente_agregado_factura" styleId="nifagregadoId_factura"/>
		<html:hidden property="descripcionGiro" styleId="descripcionGiro"/>
		
		<html:hidden property="pagina_status" styleId="pagina_status"/>
		
		<html:hidden property="estaGrabado" styleId="estaGrabado" />
		
		<!-- Informacion del cliente a facturar -->
		<html:hidden property="tipo_via_factura" styleId="tipo_via_factura"/>
		<html:hidden property="via_factura" styleId="via_factura"/>
		<html:hidden property="numero_factura" styleId="numero_factura"/>
		<html:hidden property="localidad_factura" styleId="localidad_factura"/>
		<html:hidden property="provincia_factura" styleId="provincia_factura"/>		
		<!-- Fin  cliente facturar -->
		<table width="100%" cellspacing="0">
            <tr>
				<td align="left" bgcolor="#373737" id="txt4" style="width: 615px"
					width="615"><bean:message key="cliente.clientes" />
				</td>
				<td align="right" bgcolor="#373737" id="txt4" width="9500">   
              		<a id="volver_vtadirecta" href="#"	onclick="javascript:void(0)" style="display:none;" >
					 	<img src="images/back.png" width="20" height="20"	border="0" title="Volver a venta directa" >
					</a>              	   
    			</td>
				<td align="right" bgcolor="#373737" id="txt4" width="100">   
              		<a id="nuevo_cliente" href="#" class="bteditar_1 dm"	onclick="nuevo_cliente()">
							 <img src="images/nuevo.png" width="20" height="20"	border="0" title="Limpiar Pantalla, Nuevo Cliente" >
					</a>              	   
    			</td>
    			<td align="right" bgcolor="#373737" id="txt4" height="24">              		
					<div id="modificarId" style="display:none" >
	              	    &nbsp;       		 
	              		<a href="#" onclick="modifica_cliente();" class="bteditar_2 dm" title="Habilitar Campos a modificar cliente" >	      					
	      					<img src="images/modificar.png" width="15" height="15" border="0" >
	    				</a>
    				</div>
    			</td>	
				<td align="right" bgcolor="#373737" id="txt4" width="185">
				<a href="#" onclick="cliente_graduacion();" class="dm" title="Graduación Optometría"> 
					<img src="images/optometria.jpg" width="15" height="15" border="0" >
				</a>
				</td> 
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#"  class="dm" id="btngcliente" onclick="insetar_cliente('ingresoCliente')">
      						<img src="images/check.png" width="15" height="15" border="0" title="Guardar Cliente" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" id="btcerrar" onclick="cerrar_ventanas()">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Mantenedor de Clientes" >
    				</a>
    			</td>
              </tr>
            </table>
		<table cellspacing="1" width="100%">
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.codigo"/></td>
				<td id="txt5" bgcolor="#c1c1c1">					
					<html:text property="codigo" size="10" styleId="cdgcodigocliente" styleClass="fto" readonly="true"/>
				</td>

				<td id="txt5" bgcolor="#c1c1c1" colspan="2" ><bean:message key="cliente.rut"/>
				<html:text property="rut" size="15" styleClass="fto num" maxlength="8" styleId="rut" onblur="retornaDv(this);buscarClientePrincipalAjax('foco');" />
				-<html:text property="dv" size="2" maxlength="1" styleClass="fto dv" styleId="dv" />
				<a id="buscarClienteAjax" href="#" onclick="javascript:buscarClientePrincipalAjax('boton');"> <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de cliente"> </a> 
				<a href="#" onclick="javascript:busqueda_cliente()">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar Cliente" >
    				</a>
				</td>
				
				<td id="txt5" bgcolor="#c1c1c1" ><label id="position"> </label> <bean:message key="cliente.f.nacimiento"/> *</td>
				<td id="txt5" bgcolor="#c1c1c1" >
						<html:text readonly="true"  property="fnacimiento" styleId="fnacimiento"  onchange="" title="haga click aquí para abrir calendario"  
						size="12" styleClass="fto"  />
						<input name="fnacimiento" id="fnacimiento" class="delem" onclick="" type="checkbox" value="false"/>
				</td>
			</tr>
			
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.apellidos"/> *</td>
				<td colspan="3" id="txt5" bgcolor="#c1c1c1"><html:text property="apellidos" size="40" styleId="apellido" styleClass="fto" onkeypress="return soloLetras(event)" onblur="javascript:this.value=this.value.toUpperCase();"/></td>
				<td id="txt5" bgcolor="#c1c1c1" ><bean:message key="cliente.edad"/></td>

				<td id="txt5" bgcolor="#c1c1c1" >
				<html:text property="edad" readonly="true"  size="5" styleId="edad" styleClass="fto num" />
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.nombres" key="cliente.nombres"/> *
				</td>
				<td colspan="3" id="txt5" bgcolor="#c1c1c1"> <html:text property="nombres" size="40" styleId="nombre" styleClass="fto" onkeypress="return soloLetras(event)" onblur="javascript:this.value=this.value.toUpperCase();"/></td>
				<td id="txt5" bgcolor="#c1c1c1" ><bean:message key="cliente.agente"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><html:select
						property="agente" styleId="agente" styleClass="fto">
						<html:option value="0"><bean:message key="cliente.seleccione.agente"/></html:option>
						<html:optionsCollection name="clienteForm" property="listaAgentes"
							label="usuario" value="usuario" />
						</html:select>
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.tipo.via"/></td>
				<td id="txt5" bgcolor="#c1c1c1">
					<html:select
							property="tipo_via" styleClass="fto"  styleId="tipo_via" > 
							<html:option value="0"><bean:message key="cliente.seleccione.tipo_via"/></html:option>
							<html:optionsCollection name="clienteForm" property="listaTipoVia" label="descripcion" value="codigo" />
					</html:select>
				</td>
				<td id="txt5" bgcolor="#c1c1c1">Direcci&oacute;n *</td>
				<td id="txt5" bgcolor="#c1c1c1"> <html:text property="via" styleId="direccion" size="40" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/> <input name="ddireccion" id="ddireccion" onclick="" class="delem" type="checkbox" value="false"/></td>
				<td id="txt5" bgcolor="#c1c1c1" ><bean:message key="cliente.numero"/> *</td>
				<td id="txt5" bgcolor="#c1c1c1"> 
					<html:text property="numero" styleId="numero" size="6"  maxlength="5" styleClass="fto num" onblur="javascript:this.value=this.value.toUpperCase();"/>
					<input name="dnumero" id="dnumero" onclick="" type="checkbox"  class="delem" />
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.localidad"/></td>
				<td id="txt5" bgcolor="#c1c1c1">  <html:text property="localidad" styleId="localidad" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.provincia"/> / Comuna*</td>
				<td id="txt5" bgcolor="#c1c1c1">
					<html:select property="provincia_cliente" styleClass="fto" styleId="provincia" >  
							<html:option value="0"><bean:message key="cliente.seleccione.provincia"/></html:option>
							<html:optionsCollection name="clienteForm" property="listaProvincia" label="descripcion" value="codigo" />
					</html:select>
					<input name="dprovincia" id="dprovincia" class="delem" onclick="" type="checkbox" value="false"/>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" ><bean:message key="cliente.bloque"/>/ Dpto.</td>
				<td id="txt5" bgcolor="#c1c1c1"> <html:text
						property="bloque" size="6" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.codigo.postal"/></td>
				<td id="txt5" bgcolor="#c1c1c1"> <html:text property="cod_postal" onblur="javascript:this.value=this.value.toUpperCase();" styleClass="fto" maxlength="8"  />
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.persona.contacto"/></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="3"><html:text
						property="contacto" size="40" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.email"/> *</td>
				<td id="txt5" bgcolor="#c1c1c1">
					
					
				<html:text property="email" styleId="email" size="20" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				<input name="demail" id="demail" onclick="" class="delem" type="checkbox" value="false"/>
				
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.telefono"/> *</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="1">
				<html:select property="cod_telefono" styleId="cod_telefono" styleClass="fto num">
					<html:option value="02">02</html:option>
					<html:option value="32">32</html:option>
					<html:option value="33">33</html:option>
					<html:option value="34">34</html:option>
					<html:option value="35">35</html:option>
					<html:option value="41">41</html:option>
					<html:option value="42">42</html:option>
					<html:option value="43">43</html:option>
					<html:option value="45">45</html:option>
					<html:option value="51">51</html:option>
					<html:option value="52">52</html:option>
					<html:option value="53">53</html:option>
					<html:option value="55">55</html:option>
					<html:option value="57">57</html:option>
					<html:option value="58">58</html:option>
					<html:option value="61">61</html:option>
					<html:option value="63">63</html:option>
					<html:option value="64">64</html:option>
					<html:option value="65">65</html:option>
					<html:option value="67">67</html:option>
					<html:option value="71">71</html:option>
					<html:option value="72">72</html:option>
					<html:option value="73">73</html:option>
					<html:option value="75">75</html:option>
				</html:select>
				<html:text property="telefono" styleId="telefono" size="15"  maxlength="10" styleClass="fto num"/>&nbsp;
				<input name="dtelefono" id="dtelefono" class="delem" type="checkbox" value="false"/>
				
				</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="1">
					<bean:message key="cliente.sexo"/>:
				</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="1">
					<bean:message key="cliente.hombre"/>:<html:radio property="sexo" styleId="sexo1" value="H"  ></html:radio>
					<bean:message key="cliente.mujer"/>:<html:radio property="sexo" styleId="sexo2" value="M"></html:radio>
					Institución:<html:radio property="sexo" styleId="sexo3" value="I"></html:radio>														
				</td>
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.profesion"/></td>
				<td id="txt5" bgcolor="#c1c1c1">	
					<html:text property="profesion"  size="30" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
				</td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="cliente.movil"/> *</td>
				<td id="txt5" bgcolor="#c1c1c1">	
					<html:text property="telefono_movil" styleId="telefono_movil" maxlength="11"  size="15" styleClass="fto num"/>				
					<input name="dtelefono_movil" id="dtelefono_movil" class="delem" type="checkbox" value="false"/>
					
				</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="2"></td>
				
			</tr>			
			
		</table>
            
        <table cellspacing="1" width="100%">
            <tr>
            <td colspan="6" align="left" bgcolor="#373737" id="txt4"><bean:message key="cliente.facturacion"/></td>
            </tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1" style="width: 80px" width="80"><bean:message
						key="cliente.a" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1" style="width: 324px" width="324">
					<html:text property="remitente" maxlength="8" styleId="remitenteId" size="30"  styleClass="fto"
						onblur="javascript:this.value=this.value.toUpperCase();" size="15" />-
						<html:text property="dvFactura" size="2" styleClass="fto" readonly="true" styleId="dvFactura" />
						<a href="#" onclick="javascript:buscarClienteAjax();"> <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de cliente"> </a> 
						<a href="#" onclick="javascript:busqueda_cliente_factura()"> <img
						src="images/lupa.png" width="15" height="15" border="0"
						title="Buscar Cliente"> </a></td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="4" width="599">
					<div id='nombre_cliente_facturaDIV1' style="display:none">
						<bean:write name="clienteForm" property="nombre_cliente_factura"/>
					</div>	
					<div id='nombre_cliente_facturaDIV' style="display:none"></div>
				</td>				
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1" width="80"><bean:message key="cliente.giro"/></td>
				<td id="txt5" bgcolor="#c1c1c1" width="324">
					<html:text property="giro" styleId="giroID"  size="30" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/>
					<a href="#" onclick="javascript:buscarGiroAjax();"> <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de giro de cliente"> </a>
					<a href="#" onclick="javascript:busqueda_cliente_giro()"> <img
						src="images/lupa.png" width="15" height="15" border="0"
						title="Buscar giro de cliente"> </a>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" colspan="4" width="599">
					<div id='descripcionGiroDIV' style="display:none"></div>
				</td>	
			</tr>
			
		</table>
	
	 	<!-- Se agrega tabla marketing 20140812 -->
	 	 <table cellspacing="1" width="100%">
            <tr>
            	<td colspan="6" align="left" bgcolor="#373737" id="txt4">Marketing</td>
            </tr>
            <tr>
				<td id="txt5" colspan="6" bgcolor="#c1c1c1" style="width: 100%" >
					
				</td>
		
			</tr>
			<tr>
				<td id="txt5" colspan="6" bgcolor="#c1c1c1" style="width: 100%" >
					Indique por qu&eacute; medio desea recibir informaci&oacute;n de productos y promociones.
				</td>
		
			</tr>
			<tr>
				<td id="txt5" bgcolor="#c1c1c1" width="0"></td>
				<td id="txt5" bgcolor="#c1c1c1" width="700">
					<ul>
						<li><input type="checkbox" id="codigo_postal" class="hmk chk"  ><html:text property="mk_correo_postal" styleId="codigo_postal" styleClass="mk chk"></html:text>Correo Postal.</li>
						<li><input type="checkbox" id="correo_elec" class="hmk chk"  ><html:text property="mk_correo_electronico" styleId="correo_elec" styleClass="mk chk"></html:text>Correo Electr&oacute;nico.</li>
						<li><input type="checkbox" id="sms" class="hmk chk"  ><html:text property="mk_sms" styleId="sms" styleClass="mk chk" ></html:text>Mensaje SMS (Celular).</li>
						<li><input type="checkbox" id="telefonia" class="hmk chk"  ><html:text property="mk_telefonia" styleId="telefonia_marketing" styleClass="mk chk" ></html:text>LLamado Telef&oacute;nico.</li>
						<li><input type="checkbox" id="nodatachk" class="hmk"  ><html:text property="mk_nodata" styleId="nodata" styleClass="mk" ></html:text>No quiero ser contactado</li>				
					</ul>
				</td>
			</tr>
			<tr>
				<td id="txt5" colspan="6" bgcolor="#c1c1c1" style="width: 100%" >
				&nbsp;(*) NOTA: Los campos marcados con asterisco son importantes, trate de ingresarlos correctamente,
				<br>&nbsp;si el cliente no desea brindar la informaci&oacute;n seleciona el Check ubicado a la derecha.
				</td>
			</tr>
			
		</table>
	</html:form>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>	
	<script>
		var $j = jQuery.noConflict();

		$j(".num").on('keypress',function(e){  k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9]/;n = String.fromCharCode(k);return patron.test(n);}); 
		$j(".dv").on('keypress',function(e){  k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9Kk]/;n = String.fromCharCode(k);return patron.test(n);}); 

		$j(".delem").on("click",function(){
		
			if($j(this).siblings().hasClass("bloq")){
				$j(this).siblings().attr("disabled",false).removeClass("bloq");
			}else{
				$j(this).siblings().attr("disabled",true).addClass("bloq");
			}
			
		});
		
		if($j.cookie("venta_directa") == "777"){
			$j(document).ready(function(){
				if($j.cookie("rut_directa") !="" && $j.cookie("pase") != "333" ){
						document.getElementById('accion').value="nuevo_cliente";
						document.forms[0].submit();
						$j.cookie("pase","333");
						$j.cookie("pase1","333");						
			    }
				
			});
			$j("#rut").val($j.cookie("rut_directa"));	
			$j('#agente').val($j.cookie('vend_directa'));
			if($j.cookie("pase1") == "333"){
				buscarClientePrincipalAjax('');	
				$j.cookie("pase1","0");			
			}
		}
		$j("#volver_vtadirecta").on("click",function(){
			$j.cookie("venta_directa","0");
			$j.cookie("back_form_cliente","777");
			$j.cookie("vend_directa",$j("#cajero").val());
			$j.cookie("n_caja",$j("#numero_caja").val());
			$j.cookie("util","777");
	 		location.href = '<%=request.getContextPath()%>/VentaDirecta.do?method=carga';
		});
		
		$j(".hmk").on("click",function(){
			if(!$j(this).hasClass("sel")){				
				$j(this).siblings().val("1");
				$j(this).removeClass("sel");
			}else{
				$j(this).siblings().val("-1");
				$j(this).addClass("sel");
			}						
			$j("#nodatachk").prop("checked", false);	
			$j("#nodata").val("-1");			
		});
		
		$j("#nodatachk").click(function(){		 			 		 			 
	 		$j(".chk").each(function(){
	 			 $j(this).siblings().val("-1");
	 			 $j(this).siblings().prop("checked", false);	
	 		});		
	 		$j(this).siblings().val("1"); 
	 		$j(this).attr("checked",true);	
		});		
		//BTN FIX
		$j("#btngcliente,#btcerrar,#buscarClienteAjax").on("click",function(){
			$j.cookie("mostrar_check","0");
		});
		$j("#rut").on("click",function(){
			$j("#btngcliente").css("display","block");
		});
		
		if($j.cookie("mostrar_check") !="777" || $j("#rut").val() !=""){
	    	$j("#btngcliente").css("display","none");
		}		
		if($j("#rut").val()=="66666666"){
			$j("#volver_vtadirecta").css("display","block");
			$j(".dm").css("display","none");
		}		
	</script>
</body>
</html:html>
