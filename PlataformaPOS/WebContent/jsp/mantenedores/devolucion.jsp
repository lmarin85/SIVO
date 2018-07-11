
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
#ad{
		padding-top:220px;
		padding-left:10px;
	}
.pantalla2{
			display: block;position: absolute;top: 40;left: 10;z-index: 100;width: 100%;height: 108%;background: url(images/maskBG.png);
			opacity: 0.4;
			filter: alpha(opacity=50);
		}
#load_gif{
	display : block; position : fixed; background-image : url('css/spinners/preloader.gif'); opacity : 0.5; filter: alpha(opacity=90); background-repeat : no-repeat;background-position : center;
	left : 0;
	bottom : 0;
	right : 0;
	top : 0;
}
.pantalla2,#load_gif{
	display:none;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/mantenedores/devolucion.js"></script>
		<link rel="stylesheet" type="text/css" href="css/estiloFormularios.css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/prototype.js"></script>
		
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.datepick.js"></script>
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
		
	
		<title><bean:message key="title.pos"/></title>
        <script language="javascript">
	        var $j = jQuery.noConflict();
			
			$j(function() {
			
				$j('#fecha').datepick({yearRange: '1900:-0'});	
			});
        
        	function cerrar_ventanas()
        	{
					
					var boton = confirm("Se perderan todos los datos, \u00BFEsta seguro de cancelar la venta?");
	        		if (boton)
	        		{	
	        			parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
	        			
	        		}
	        		else
	        		{
	        			self.close();
	        		}
        		
        		
        	}
        	
        	
			function abrirBuscarAlbaranes(){
			
				showPopWin("<%=request.getContextPath()%>/Devolucion.do?method=cargaBuscarAlbaran", 714, 425,cargaAlbaran, false);
				
			}
			function cargaAlbaran(albaran){
							
				document.getElementById("cdg_venta").value=albaran[2];
				//document.getElementById("fecha_albaran").value=albaran[1];
				document.getElementById("agente_albaran").value=albaran[0];			
				document.getElementById("accion").value="traeAlbaranBuscado";
				document.forms[0].submit();
								
			}
			
			function mostrar_pagos_boletas(){			
				var cdg_vta = document.getElementById("cdg_venta").value;
				var url = "<%=request.getContextPath()%>/SeleccionPago.do?method=cargaMostrarPagosBoletasAlbaranes&tipo=DIRECTA&serie="+cdg_vta;	
				showPopWin(url, 700, 200, retorno_mostrar_pagos_boletas, false);
			}
			
			function mostrarListaAlbaranes(){
				showPopWin("<%=request.getContextPath()%>/Devolucion.do?method=mostrarListaAlbaranes", 714, 425,cargaAlbaran, false);
			}
			
			function eliminar_albaran(){
				var tipo_albaran = document.getElementById("tipo_albaran").value; 
				var albaranDevolcionPago = document.getElementById("albaranDevolcionPago").value;
				       	
				 if("DIRECTA" == tipo_albaran){
				 	document.getElementById("fecha").disabled=false;
					document.getElementById("accion").value="eliminaAlbaran";
					document.forms[0].submit();
				}else if("ENTREGA" == tipo_albaran){
					document.getElementById("fecha").disabled=false;
					document.getElementById("accion").value="eliminaAlbaran";
					document.forms[0].submit();					
				}else if("DEVOLUCION" == tipo_albaran && "OK" == albaranDevolcionPago){
					document.getElementById("fecha").disabled=false;
					document.getElementById("accion").value="eliminaAlbaran";
					document.forms[0].submit();
				}
				
			}
			
			function retorno_mostrar_pagos_boletas(tiene_fomas_pago){
				
				if("NO"==tiene_fomas_pago ){
					document.getElementById('delete').style.display = '';
				}				
			}
			
			function validaArticulosVentaDirecta(){
				
				document.getElementById("accion").value="traeAlbaranBuscado2";
				document.forms[0].submit();				
			}
			
			function cobrar_albaran(){
				var tipo_albaran = document.getElementById("tipo_albaran").value;   
				var albaranDevolcionPago = document.getElementById("albaranDevolcionPago").value;
				var fecha = document.getElementById("fecha").value;
				
				if("DIRECTA" == tipo_albaran){
					document.getElementById("fecha").disabled=false;
					fecha = document.getElementById("fecha").value;
					document.getElementById("fecha").disabled=true;
					showPopWin("<%=request.getContextPath()%>/SeleccionPago.do?method=cargaFormularioAlbaranDirecta&fecha="+fecha+"", 710, 285, vuelve_Pago_albaran, false);
					
				}else if("DEVOLUCION" == tipo_albaran && "OK" == albaranDevolcionPago){
					showPopWin("<%=request.getContextPath()%>/SeleccionPago.do?method=cargaFormulario", 710, 285, vuelve_Pago_albaran_devolucion, false);
				}else if("DEVOLUCION" == tipo_albaran){
					var agente = document.getElementById("agenteSelect").value;
					var motivo = document.getElementById("motivo").value;
					var tieneArmCrisContacto = document.getElementById("tieneArmCrisContacto").value;
					var isController = document.getElementById("isController").value;
					
					var respuesta = true;
					if(agente == 0){
						alert("Debe seleccionar agente");
						respuesta = false;						
					}else if(motivo == 0){
							alert("Debe seleccionar un motivo de devoluci\u00F3n");
							respuesta = false;
					}
					
					if(respuesta){
						if("true"==tieneArmCrisContacto){
							if("true" == isController ){
								showPopWin("<%=request.getContextPath()%>/SeleccionPago.do?method=cargaFormularioCobroAlbaran&fecha="+fecha+"", 710, 285, vuelve_Pago_albaran_devolucion, false);		
							}else{
								alert("Los productos son ópticos, solo un controller puede hacer la devolución");
							}
						}else{
							showPopWin("<%=request.getContextPath()%>/SeleccionPago.do?method=cargaFormularioCobroAlbaran&fecha="+fecha+"", 710, 285, vuelve_Pago_albaran_devolucion, false);
						}
					}
					
				}
								
			}
			
			function cobrar_albaran_validaCaja(){
			
				var fecha = document.getElementById("fecha").value;
				var codigo_cliente = document.getElementById('codigo_cliente').value;
				if("" != codigo_cliente){
				 new Ajax.Request('<html:rewrite page="/Devolucion.do?method=validaCajaAjax"/>', {
				      parameters: {fecha: fecha},      
				      onComplete: function(transport, json) {
				      	
				      	 if(true == json.respuesta){				      	 		      	 	
        					var miArray = new Array(10);
        						miArray[0] = json.fecha;						      	
				         		cobrar_albaran();
				      	 }else{
				      	 	alert("La caja esta cerrada para la fecha seleccionada.");			      	 	
				      	 }				         		         
				      }
				   });
				   
				   }else{
				   	alert("Debe ingresar un cliente.");
				   }
			
			}
				
			function vuelve_Pago_albaran(accion){
				
				if("NO"==accion ){
					document.getElementById('delete').style.display = '';
				}else if("SI"==accion){
					document.getElementById('delete').style.display = 'none';
				}else if("volver" == accion){														
				
				}else if(""==accion){
				
				}else{
					document.getElementById('accion').value = "retornoPagoAlbaran";
					document.getElementById("cambio").disabled=false;
					document.getElementById("divisa").disabled=false;
					document.getElementById("fecha").disabled=false;
					document.getElementById("tipoAlbaran").disabled=false;
					document.getElementById("agente").disabled=false;
					document.getElementById("agenteSeleccionado").value=document.getElementById("agenteSelect").value;
	         		document.devolucionForm.submit();
				}
				
			}
			function cambioAlbaran(){
				var x = document.forms[0];				
				x.action = "<%=request.getContextPath()%>/Devolucion.do?method=cambioAlbaran";
				x.submit();
			} 
			
			function vuelve_Pago_albaran_devolucion(accion){
			
				if("NO"==accion ){
					document.getElementById('delete').style.display = '';
				}else if("SI"==accion){
					document.getElementById('delete').style.display = 'none';
				}else if("volver" == accion){														
				
				}else if(""==accion){
				
				}else if("pago_devolucion" == accion){
					var agente = document.getElementById("agenteSelect").value;					
					document.getElementById("agenteSeleccionado").value = agente;
					document.getElementById("cambio").disabled=false;
					document.getElementById("divisa").disabled=false;
					document.getElementById("accion").value="devolucion";	
					document.getElementById("tipoAlbaran").disabled=false;				
					document.devolucionForm.submit();
				}
				
			}
			function nuevo_albaran(){
				var x = document.forms[0];				
				x.action = "<%=request.getContextPath()%>/Devolucion.do?method=cargaFormulario&accion=nuevo";
				x.submit();
			}
			function buscarAlbaranesDevo(){
			var respuesta = false;
			var codigo1 = document.getElementById("codigo1").value;
			var codigo2 = document.getElementById("codigo2").value;
			
			var cdg = "";
			if("" != codigo1 && "" != codigo2){
				cdg = codigo1 +"/"+codigo2;
			}
			
			if(""==cdg){
				alert("Debe ingresar un código de albaran válido");
				respuesta = true;
			}else{
				document.getElementById("cdg_venta").value=cdg;				
				respuesta = false;
			}
			
			if(respuesta==false){							
				document.getElementById("accion").value="traeAlbaranBuscado";
				document.getElementById("inicio_pagina").value="busqueda_rapida";
				document.devolucionForm.submit();
			}
		}
		
		function busqueda_cliente()
			{
				var rut = document.getElementById('nif').value;				
				rut  = trim(rut);				
				showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&nif="+rut+"", 714, 425, cargaCliente, false);
			   	//window.open("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&nif="+rut+"","popup","width=800, height=400,location=no,top=100,left=120");
			   	
			}
		function cargaCliente(cliente)
		{							
			document.getElementById("clienteagregadoId").value = cliente[0];
			document.getElementById("nifagregadoId").value = cliente[1];
			document.getElementById("nif").value = cliente[1];
			document.getElementById('accion').value = "agregarCliente";
			document.forms[0].submit();
		
		}
		function buscarClientePrincipalAjax()
			{
			   var remitenteId = document.getElementById('nif').value; 
			   var codigo_cliente = document.getElementById('codigo_cliente').value;	 
			  
				if("" != remitenteId){
				document.getElementById('nif').value = "Buscando...";
				   new Ajax.Request('<html:rewrite page="/BusquedaClientes.do?method=buscarClienteAjax"/>', {
				      parameters: {nif: remitenteId},      
				      onComplete: function(transport, json) {
				      	 if("" != json.codigo_cliente){	
				      	 			      	 		      	 	
        					var miArray = new Array(10);
        						miArray[0] = json.codigo_cliente;
						      	miArray[1] = json.nif;
						      	miArray[2] = json.nombre;
						      	miArray[3] = json.apellido;
						      	miArray[4] =  json.dvnif;	         	
				         	cargaCliente(miArray);
				         	
				      	 }else{  	 	
				      	 	alert("El cliente ingresado no existe, debe ser ingresado en el sistema, para ingresar debe ir a Mantenedor Clientes.");
				      	 	document.getElementById('codigo_cliente').value="";
				      	 	document.getElementById('clienteagregadoId').value="";
				      	 	document.getElementById('dvnif').value=""; 	 	
				      	 	document.getElementById('nif').value="";
				      	 	document.getElementById('divNombre').innerHTML="";
				      	 }				         		         
				      }
				   });
			   }else{
			   	alert("Debe ingresar rut de cliente");
			   }
			}
</script>   
</head>
<bean:define id="estado_boleta" type="String">
		<bean:write property="estado_boleta" name="devolucionForm"/>
</bean:define>
<body onload="inicio_pagina();if(history.length>0)history.go(+1);javascript:estado_boleta('${estado_boleta}');">							
<html:form action="/Devolucion?method=cargaAlbaran">
<html:hidden property="inicio_pagina"  styleId="inicio_pagina" name="devolucionForm"/>
<html:hidden property="accion" value="" styleId="accion" name="devolucionForm"/>
<html:hidden property="cargado" styleId="cargado" name="devolucionForm"/>
<html:hidden property="existeBoleta" styleId="existeBoleta" name="devolucionForm"/>	
<html:hidden property="respuestaDevolucion" styleId="respuestaDevolucion" name="devolucionForm"/>
<html:hidden property="agenteSeleccionado" styleId="agenteSeleccionado" name="devolucionForm"/>
<html:hidden property="mensajeRetornoSp" styleId="mensajeRetornoSp" name="devolucionForm"/>
<html:hidden property="respuestaValidaMultiofertas" styleId="respuestaValidaMultiofertas" name="devolucionForm"/>


<html:hidden property="cdg_venta" styleId="cdg_venta" name="devolucionForm"/>
<!--   <html:hidden property="fecha" styleId="fecha_albaran" name="devolucionForm"/>   -->
<html:hidden property="agente" styleId="agente_albaran" name="devolucionForm"/>
<html:hidden property="elimina_albaran" styleId="elimina_albaran" name="devolucionForm"/>
<html:hidden property="estadoCaja" styleId="estadoCaja" name="devolucionForm"/>
<html:hidden property="mostrarIconos" styleId="mostrarIconos" name="devolucionForm"/>
<html:hidden property="tipo_albaran" styleId="tipo_albaran" name="devolucionForm"/>
<html:hidden property="respuestaPagoAlbaran" styleId="respuestaPagoAlbaran" name="devolucionForm"/>
<html:hidden property="devolver_vta" styleId="devolver_vta" name="devolucionForm"/>
<html:hidden property="tieneArmCrisContacto" styleId="tieneArmCrisContacto" name="devolucionForm"/>
<html:hidden property="isController" styleId="isController" name="devolucionForm"/>
<html:hidden property="fecha_albaran_devolucion" styleId="fecha_albaran_devolucion" name="devolucionForm"/>
<html:hidden property="estaGrabado" styleId="estaGrabado" />	

<!-- informacion del cliente -->
<html:hidden property="codigo_cliente" styleId="codigo_cliente" name="devolucionForm"/>
<html:hidden property="clienteagregadoId" styleId="clienteagregadoId" name="devolucionForm"/>
<html:hidden property="nifagregadoId" styleId="nifagregadoId" name="devolucionForm"/>
<html:hidden property="tipo_via_cliente" styleId="tipo_via_cliente" name="devolucionForm"/>
<html:hidden property="via_cliente" styleId="via_cliente" name="devolucionForm"/>
<html:hidden property="numero_via_cliente" styleId="numero_via_cliente" name="devolucionForm"/>
<html:hidden property="provincia_cliente" styleId="provincia_cliente" name="devolucionForm"/>
<html:hidden property="validaCliente" styleId="validaCliente" name="devolucionForm"/>
<html:hidden property="numero_cab" styleId="numero_cab" name="devolucionForm"/>
<html:hidden property="respuestaEliminaAlbaran" styleId="respuestaEliminaAlbaran" name="devolucionForm"/>
<html:hidden property="albaranDevolcionPago" styleId="albaranDevolcionPago" name="devolucionForm"/>
<html:hidden property="nombreCliente" styleId="nombreCliente" name="devolucionForm"/>


<div id="bloqueo" class="pantalla2"></div>
		<table width="100%" cellspacing="0">
        	<tr>
        		<!--<td><div id="load_gif" class="pantalla2"></div></td>-->
              	<td align="left" bgcolor="#373737" id="txt4" colspan="12" ><bean:message key="devolucion.devolucion"/></td>
              	<td align="right" bgcolor="#373737" id="txt4" width="720">
              		
    			</td>
              	<td align="right" bgcolor="#373737" id="txt4" width="720">
              		<a href="#"	onclick="nuevo_albaran()">
						 <img src="images/nuevo.png" width="20" height="20"	border="0" title="Nueva Devolución">
					</a> 		      			
		      		
		      		<logic:notEqual value="DIRECTA" property="tipo_albaran" name="devolucionForm" >
		      			<a href="#" id="idcobrar" align="right" bgcolor="#373737"  >
		                	<img src="images/money2.png" width="22" height="22" border="0" title="Totalizar Venta" />
		                </a>
		      		</logic:notEqual>	
	                <logic:equal value="DIRECTA" property="tipo_albaran" name="devolucionForm" >
	                	<a href="#" onclick="validaArticulosVentaDirecta()" id="idcobrar" align="right" bgcolor="#373737"  >
		                	<img src="images/money2.png" width="22" height="22" border="0" title="Totalizar Venta" >
		                </a>
	                </logic:equal>	
               		
		    		
              		<a href="#" onclick="eliminar_albaran();"  id="delete" >
      						<img src="images/delete.png" width="20" height="20"	border="0" title="Eliminar Albaran">
    				</a>
              		<a href="#" onclick="mostrar_pagos_boletas();"  id="idpagos">
      						<img src="images/boleta.png" width="20" height="20"	border="0" title="Mostrar Pagos y Boletas ">
    				</a>
              		<a href="#" onclick="mostrarListaAlbaranes();"   id="idlista">
      						 <img src="images/lista.png" width="18" height="15"	border="0" title="Lista de Albaranes">
    				</a>
              		<a href="#" onclick="abrirBuscarAlbaranes()" title="Cargar Albaranes" id="idbuscar" >
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar y cargar datos de la devolucion" >
    				</a>
    			</td>
              	<td align="right" bgcolor="#373737" id="txt4">
              	<!-- 	<a href="#" onclick="devolucion()" title="Devolución" id="botondevolucion" style="display:none"	>
						 <img src="images/check.png" width="15" height="15"	border="0" title="Realizar  devolucion" >
					</a> -->
    			</td>
    			    			
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="cerrar_ventanas()"  >
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar" >
    				</a>
    			</td>
    			
        	</tr>
		</table>
		
		
		<!-- Cabecera de Devolucion -->
		
		<table width="100%" cellspacing="1">
              <tr>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<bean:message key="presupuesto.codigo"/>
                </td>

				<td align="left" bgcolor="#c1c1c1" id="txt5" width="163"
					style="width: 163px">
					<html:text  onblur="javascript:this.value=this.value.toUpperCase();"  property="codigo1"
					 name="devolucionForm" size="2"  onblur="javascript:this.value=this.value.toUpperCase();"  styleClass="fto"  styleId="codigo1" />
					<html:text property="codigo2" onblur="javascript:this.value=this.value.toUpperCase();" name="devolucionForm"
						size="8" styleClass="fto"  styleId="codigo2" /> 
				 	<a href="#" onclick="buscarAlbaranesDevo()" title="Cargar Devolución" id="buscarRapido"  >
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar albarán" id="imagenBuscarRapido" >
    				</a>   
						</td>	
				<td align="left" bgcolor="#c1c1c1" id="txt5" width="47">
                	<bean:message key="devolucion.fecha"/>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:text property="fecha"  readonly="true" styleId="fecha" name="devolucionForm" size="12" styleClass="fto" title="haga click aquí para abrir calendario"  />                	
                </td>

				<td align="left" bgcolor="#c1c1c1" id="txt5" width="37"
					style="width: 37px"><bean:message key="devolucion.hora" /></td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" width="63"
					style="width: 63px"><html:text property="hora"
						name="devolucionForm" size="6" styleClass="fto" /></td>

				<td align="left" bgcolor="#c1c1c1" id="txt5" width="51"
					style="width: 51px"><bean:message
						key="devolucion.tipo_albaran" /></td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" style="width: 106px"
					width="106"><html:select property="tipoAlbaran" styleId="tipoAlbaran"
						name="devolucionForm" styleClass="fto" style="width:95px;"  >
						<html:option value="0">
							<bean:message key="devolucion.seleccione" />
						</html:option>
						<html:optionsCollection name="devolucionForm"
							property="listaTipoAlbaranes" label="descripcion" value="codigo" />
					</html:select></td>
				<td align="left" bgcolor="#c1c1c1" id="txt5" rowspan="1" width="159">
                	<bean:message key="devolucion.boleta"/>
                	<html:radio property="boleta_guia" value="B"  styleId="boleta_guia"></html:radio>
                	<bean:message key="devolucion.guia"/>
                	<html:radio property="boleta_guia" value="O"></html:radio>
				</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<html:text property="numero_boleta_guia" name="devolucionForm" size="8" styleClass="fto"  styleId="numero_boleta_guia" />
                	<a href="#" onclick="cargarDatos()" title="Cargar Devolución"  id="buscarBoleta" >
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar y cargar datos de la devolucion" id="imagenBuscarBoleta" >
    				</a>                	
                </td>               
              </tr>
              
              <tr>
              	
				<td align="left" bgcolor="#c1c1c1" id="txt5" >
					<bean:message key="devolucion.cliente"/>
				</td> 
				<td align="justify" bgcolor="#c1c1c1" id="txt5" width="163">					
					<html:text property="nif" maxlength="15" styleId="nif" size="10" styleClass="fto"
						onblur="javascript:this.value=this.value.toUpperCase();" size="10" />-
						<html:text property="dvnif" size="2" styleClass="fto" readonly="true" styleId="dvnif" />
				 	<a href="#" onclick="javascript:buscarClientePrincipalAjax();"> <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de cliente" id="buscar_rapido_cliente" style="display:none" > </a> 
					<a href="#" onclick="javascript:busqueda_cliente()">
      						<img src="images/lupa.png" width="15" height="15" border="0" id="buscar_cliente" style="display:none" >
    				</a> 			
    			</td>	
    			<td align="justify" bgcolor="#c1c1c1" id="txt5" colspan="5" >
    			<div id="divNombre" >	<bean:write name="devolucionForm" property="nombreCliente"/></div>  
    			</td>
    			<td align="left" bgcolor="#c1c1c1" id="txt5" width="106">
    			<logic:notEqual value="true" name="devolucionForm"  property="autorizacionKodak">	
    				<html:checkbox property="kodak" value="K" disabled="true" ></html:checkbox>
    			</logic:notEqual>
    			<logic:equal value="true" name="devolucionForm"   property="autorizacionKodak">
    				<html:checkbox property="kodak" value="K" ></html:checkbox>
    			</logic:equal>
    			<bean:message key="devolucion.kodak" />
				</td>
    			<td align="left" bgcolor="#c1c1c1" id="txt5" width="159">
    				<logic:notEqual value="true" name="devolucionForm"  property="autorizacionKodak">	
    				<html:checkbox property="kodak" value="T" disabled="true" ></html:checkbox>
    			</logic:notEqual>
    			<logic:equal value="true" name="devolucionForm"   property="autorizacionKodak">
    				<html:checkbox property="kodak" value="T" ></html:checkbox>
    			</logic:equal>
    			Entrega
    			</td>
    			<td align="left" bgcolor="#c1c1c1" id="txt5">
    			</td>				
              </tr>
                            
              <tr>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" height="16"><bean:message key="devolucion.idioma"/></td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" height="16" width="163">
                   <html:select property="idioma" name="devolucionForm" styleClass="fto" style="width:150px;"> 
                        <html:option value="0"><bean:message key="devolucion.seleccione"/></html:option>
                        <html:optionsCollection name="devolucionForm" property="listaIdiomas"  label="descripcion" value="id" />
                    </html:select>
                  
                </td>
                <td align=""left"" bgcolor="#c1c1c1" id="txt5" width="47">
                	<bean:message key="devolucion.cambio"/>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" >
                	<html:text property="cambio" readonly="true" name="devolucionForm" size="8" styleClass="fto" styleId="cambio" />
                </td>             	
                <td align="left" bgcolor="#c1c1c1" id="txt5" >
                	<bean:message key="devolucion.agente"/>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="3">
                	<html:select property="agente" name="devolucionForm" styleClass="fto" styleId="agenteSelect" >  
                        <html:option value="0"><bean:message key="devolucion.seleccione"/></html:option>
                        <html:optionsCollection name="devolucionForm" property="listaAgentes"  label="usuario" value="usuario" />
                    </html:select>
                    
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" width="159">
                	<!--<html:checkbox property="modificado"></html:checkbox>
                	<bean:message key="devolucion.modificado"/> -->
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" >
                <!-- 	<html:text property="modificado_text" size="9" ></html:text> -->
                </td>           
              </tr>
              
              <tr>
              	<td align="left" bgcolor="#c1c1c1" id="txt5">
              		<bean:message key="devolucion.divisa"/>
              	</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" width="163">  
                    <html:select property="divisa" styleId="divisa"  name="devolucionForm" style="" styleClass="fto" style="width:150px;"> 
                        <html:option value="0"><bean:message key="devolucion.seleccione"/></html:option>
                        <html:optionsCollection name="devolucionForm" property="listaDivisas" label="descripcion" value="id" />
                    </html:select>
                    
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="2">
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5">
                	<bean:message key="devolucion.montador"/>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="3">
                	<html:text property="montador"></html:text>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" width="159">
                	<html:checkbox property="facturado" value="F"   ></html:checkbox>
                	<bean:message key="devolucion.facturado"/>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" >
                	<html:text property="facturado_text" size="9" ></html:text>
                </td>
              </tr> 
              <tr>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" >
              		<bean:message key="devolucion.motivo"/>
              	</td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" width="163">
              	<logic:equal value="DEVOLUCION" name="devolucionForm" property="tipo_albaran">
                	<html:select property="motivo" name="devolucionForm" styleId="motivo" styleClass="fto" style="width:150px;"> 
                        <html:option value="0"><bean:message key="devolucion.seleccione"/></html:option>
                        <html:optionsCollection name="devolucionForm" property="lista_mot_devo" label="descripcion" value="codigo" />
                    </html:select>
                </logic:equal>
                <logic:notEqual value="DEVOLUCION" name="devolucionForm" property="tipo_albaran">
                	<html:select property="motivo" name="devolucionForm" styleId="motivo" styleClass="fto" style="width:150px;" disabled="true" > 
                        <html:option value="0"><bean:message key="devolucion.seleccione"/></html:option>
                        <html:optionsCollection name="devolucionForm" property="lista_mot_devo" label="descripcion" value="codigo" />
                    </html:select>
               	</logic:notEqual>
                </td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2">
              	</td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" >
              		<bean:message key="devolucion.forma.pago"/>
              	</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="3">
                 	<html:select property="formaPago" name="devolucionForm" styleClass="fto" style="width:150px;"> 
                        <html:option value="0" ><bean:message key="devolucion.seleccione"/></html:option>
                        <html:optionsCollection name="devolucionForm" property="listaFormasPago" label="descripcion" value="id" />
                    </html:select>
                     
                </td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" width="159">
              		<!-- <html:checkbox property="confidencial"></html:checkbox>
              		<bean:message key="devolucion.confidencial"/> -->
              	</td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" >
              		<bean:message key="devolucion.dto"/>
              		<html:text property="dto" size="3" ></html:text>
              	</td>              	
              </tr>
              <tr>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" >
              		<bean:message key="devolucion.fecha_garantia"/>
              	</td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" width="163">
              		<html:text property="fecha_garantia"></html:text>
              	</td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5"  colspan="2">
              	</td>
              	<td align="left" bgcolor="#c1c1c1" id="txt5" >
              		<bean:message key="devolucion.convenio"/>
              	</td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="3">
                    <html:select property="convenio" name="devolucionForm" styleClass="fto" style="width:150px;"> 
                        <html:option value="0" ><bean:message key="devolucion.seleccione"/></html:option>
                        <html:optionsCollection name="devolucionForm" property="listaConvenios" label="descripcion" value="id" />
                    </html:select>
                     
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="1" width="159">
                	<bean:message key="devolucion.importe_pend"/>
                </td>
                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="1">
                	<html:text property="importePend" size="9" ></html:text>
                </td>
              </tr>     
              <tr>     				
  				  	<td align="left" bgcolor="#c1c1c1" id="txt5" >
              			<p>Direcci&oacute;n Cliente:</p>
              		</td>
              		<td align="left" bgcolor="#c1c1c1" id="txt5" width="163">
              			<html:text property="direccion_cli" styleId="direccion" styleClass="fto let"  ></html:text>
              		</td>  				  
	                <td align="left" bgcolor="#c1c1c1" id="txt5" width="47">
	                	<p>N° Direc. Cliente :</p>
	                </td>
	                <td align="left" bgcolor="#c1c1c1" id="txt5" >
	                	<html:text property="ndireccion_cli"   styleId="ndireccion" size="5" styleClass="fto num" maxlength="10"></html:text>
	                </td>             	
	                <td align="left" bgcolor="#c1c1c1" id="txt5" >
	                	<p>Comuna Cliente:</p>
	                </td>
	                <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="3">
	                	<html:select property="comu_cli" styleClass="fto" styleId="provincia"  >  
							<html:option value="0"><bean:message key="cliente.seleccione.provincia"/></html:option>
							<html:optionsCollection name="devolucionForm" property="listaProvincia" label="descripcion" value="codigo" />
						</html:select>	                
	                </td>
	                <td align="left" bgcolor="#c1c1c1" id="txt5" width="159">
	                	<!--<html:checkbox property="modificado"></html:checkbox>
	                	<bean:message key="devolucion.modificado"/> -->
	                </td>
	                <td align="left" bgcolor="#c1c1c1" id="txt5" >
	                <!-- 	<html:text property="modificado_text" size="9" ></html:text> -->
	                </td> 	             
              </tr>      
                          
            </table>			
		<!-- Fin Cabecera Devolucion -->
		
		<!-- lista  del peidodo -->
		<div>
			<table width="100%" cellspacing="0" >
                <tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.articulo"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.descripcion"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.subalm"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.precioiva"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.dto"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.cantidad"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.importe"/></th> 
                    <th scope="col" id="txt4" bgcolor="#373737" ><bean:message key="devolucion.pedido"/></th>                   
                </tr>
                
                	<logic:equal name="devolucionForm" property="estado_lista_albaran" value="0" >
	                <tr>
	                	<td colspan="8" id="txt5" bgcolor="#c1c1c1" align="center">
	                		NO SE ENCONTRARON RESULTADOS
	                	</td>
	                </tr>
                	</logic:equal>
                	<logic:present property="lista_productos" name="devolucionForm">
                		<logic:iterate id="productos" property="lista_productos" name="devolucionForm" >
	                		<tr>		
								<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="cod_articulo" />
		                		</th>
		                		<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="descripcion" />
		                		</th>
		                		<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="subAlm" />
		                		</th>
		                		<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="precio"  format="$###,###.##" />
		                		</th>
		                		<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="dto" />
		                		</th>
		                		<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="cantidad" />
		                		</th>
		                		<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="precio_costo"  format="$###,###.##" />	                			
		                		</th>
		                		<th id="txt5" bgcolor="#c1c1c1" align="center" class="fto">
		                			<bean:write name="productos" property="identpedalbaran" />
		                		</th>
		                	</tr>	
	                	</logic:iterate>	
                	</logic:present>	
                
              </table>
		
		</div>	
		
		<!-- fin lista  del peidodo -->	
		
</html:form>
<script>
	var $j = jQuery.noConflict();

	$j(".num").on('keypress',function(e){  k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9]/;n = String.fromCharCode(k);return patron.test(n);}); 
	$j(".let").on('keypress',function(e){  k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[A-Za-zñÑ ]/;n = String.fromCharCode(k);return patron.test(n);}); 

	if($j.trim($j("#nif").val())=="66666666"){
		$j('#direccion').val("AV. SANTA CLARA").attr("readonly",true);
		$j('#ndireccion').val("249").attr("readonly",true);
		$j('#provincia').find('option[value!="303_HUECHURABA"]').attr("disabled",true);
		$j('#provincia').find('option[value="303_HUECHURABA"]').prop('selected', true).find('option[value!="303"]').attr("disabled",true);
	}
	$j("#idcobrar").on("click",function(){
		sum = 0;
		var val_letras = /^[A-Z a-zÑñ. ]{3,50}$/;
		var direccion = $j.trim($j('#direccion').val());
		var ndireccion = $j.trim($j('#ndireccion').val());
		var provincia = $j("#provincia").val();
		if(val_letras.test(direccion) == false ){alert("Debe Ingresar una dirección de cliente válida.");}else{sum++;}
		if(ndireccion != ""){sum++;}else{alert("Debes ingresar el N° de Dirección del cliente.");}
		if(provincia != "0"){sum++;}else{alert("Debes ingresar la provincia del cliente.");}
		if(sum == 3){
			cobrar_albaran_validaCaja();
		}
	});
	
</script>
</body>
</html:html>