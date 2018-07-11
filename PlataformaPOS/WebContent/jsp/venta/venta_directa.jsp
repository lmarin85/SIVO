
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/subModal.css" />
<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/subModal.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/venta/venta_directa.js"></script>
<script type="text/javascript" src="js/prototype.js"></script>	
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>	
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript">
			
		function cantidadMultioferta(){		
					
					new Ajax.Request('<html:rewrite page="/VentaDirecta.do?method=validaCantidadProductosMultiofertas"/>', {
					      parameters: {pagina: "directa"},      
					      onComplete: function(transport, json) {
					      					      	
					      var respuesta = json.cantidad;
					      var codigo = json.codigoMulti; 	
						      if("menor"==respuesta){
						      		alert("La cantidad de productos en la multioferta "+codigo+" no esta completa");
						      	return false;	
						      }else{
						      	return true;
						      }		         		         
					      }
					   });
				   
		}	
		
		function valida_genera_venta()
		{
		
			
			if($j("#cantidad").val() !="0"){
				document.getElementById('accion').value = "valida_venta_directa";
	            document.ventaDirectaForm.submit();
	        }else{
	        	alert("Debes ingresar productos para realizar cobros.");
     	    }
		}
		
         function genera_venta()
            {
            	if (estado == "fin") {
					alert("Venta finalizada, no es posible generar cobro");
				}	
				else
				{
					if( document.getElementById('numero_ticket').value != "")
					{
						sumaTotal = document.getElementById('cantidad_productos').value;
		           		if(sumaTotal == 0){
		            		alert("Debe ingresar articulos para generar la venta");
		            	}else{
		            		//validar que las multiofertas tengan todos los productos cargados.
			            		
			            	  new Ajax.Request('<html:rewrite page="/VentaDirecta.do?method=validaCantidadProductosMultiofertas"/>', {
						      parameters: {pagina: "directa"},      
						      onComplete: function(transport, json) {
						      					      	
						      var respuesta = json.cantidad;
						      var codigo = json.codigoMulti; 	
							      if("menor"==respuesta){
							      	alert("La cantidad de productos en la multioferta "+codigo+" no esta completa");							      	
							      }else{
							      	showPopWin("<%=request.getContextPath()%>/VentaDirecta.do?method=generaVentaDirecta", 710, 285, vuelve_Pago, false);
							      }		         		         
						      }
						   });	            		
		            	}
					}
					else
					{
						alert("Debe guardar la venta, antes de cobrar");
					}
	            }
			}
		 function busqueda_multioferta(codigo, index)
			 {		 		
			 		showPopWin("<%=request.getContextPath()%>/BusquedaProductosMultiOfertas.do?method=cargaBusquedaProductosMultiOfertas&formulario=DIRECTA&codigoMultioferta="+codigo+"&index_multi="+index+"", 714, 425, null, false);
			 }
			 
			
			
		function busqueda_producto()
            {  
            	var $j = jQuery.noConflict();
            	if($j("#dv").val()!=""){
            	        
	            	if (estado == "fin") {
						alert("Venta finalizada, no es posible agregar productos");
					}	
					else
					{	
						showPopWin('<%=request.getContextPath()%>/BusquedaProductos.do?method=cargaBusquedaProductos&formulario=DIRECTA', 710, 380, cargaProducto, false);
					}
            	}else{
            		alert("Debes Ingresar Un Cliente.");
            	}
            } 
         function busqueda_producto_directo()
            {          
            	if (estado == "fin") {
					alert("Venta finalizada, no es posible agregar productos");
				}	
				else
				{
					showPopWin('<%=request.getContextPath()%>/BusquedaProductos.do?method=cargaBusquedaProductosDirecto', 320, 90, cargaProducto, false);
				}
            	
            }	
            
		function cerrar_venta()
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
	        			$j.cookie("nombre_directa","");
	        			self.close();
	        		}       		
        	}
        	
         function valida_estado(est)
			 {
			 	if (est == "producto_no_encontrado") {
					alert("Producto no encontrado");
				}
				if (est == "producto_precio_especial") 
				{
					boton = confirm("El producto tiene precio especial, ¿desea aplicarlo?");
					if (boton)
					{
					  	document.getElementById('accion').value = "aplicaPrecioEspecial";
            			document.ventaDirectaForm.submit();
					}
				}
			 	
			 	if (est == "fin") {
			 		estado = est;
			 		alert("Venta almacenada con éxito");
			 		var cmb_tipo_albaran = document.getElementById('tipo_albaran');
			 		var cmb_cajero = document.getElementById('cajero');
			 		var cmb_agente = document.getElementById('agente');
			 		
			 		cmb_agente.disabled= true;
			 		cmb_cajero.disabled= true;
			 		cmb_tipo_albaran.disabled= true;
			 		
			 		parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
				}
				if (est== "guardado")
				{
					alert("Venta almacenada con éxito");
				}
				if (est== "ERROR_GUARDADO")
				{
					alert("La venta no se pudo guardar. intentelo nuevamente");
				}
				if (est== "ERROR_VALIDACION_MULTIOFERTA")
				{
					alert("la multioferta no se guardo correctamente");
				}
				if (est == "VALIDACION_MULTIOFERTA_OK")
				{
					genera_venta();
				}
				
				if (est=='producto_graduable') {
					alert("Los Lentes de Contacto con Graduación no se pueden registrar por Venta Directa");
				}
				if (est=='carga_multioferta') 
				{	
					var codigo = document.getElementById('codigo_mult').value;
					var index = document.getElementById('index_multi').value;
			 		showPopWin("<%=request.getContextPath()%>/BusquedaProductosMultiOfertas.do?method=cargaBusquedaProductosMultiOfertas&formulario=DIRECTA&codigoMultioferta="+codigo+"&index_multi="+index+"", 714, 425, null, false);
			 	}
			}
			function actualizaEstaGrabado(){
				document.getElementById('estaGrabado').value = 0;
			}
</script>

<title><bean:message key="title.pos"/></title>

<style type="text/css">
<!--
TABLE {
	border-color: white
}
-->
.pantalla2{
			display: block;position: absolute;top: 0;left: 10;z-index: 1000000;width: 100%;height: 108%;background: url(images/maskBG.png);
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
</head>
<bean:define id="estado" type="String">
	<bean:write property="estado" name="ventaDirectaForm"/>
</bean:define>
<bean:define id="estado_boleta" type="String">
		<bean:write property="estado_boleta" name="ventaDirectaForm"/>
</bean:define>
<body onload="valida_estado('${estado}');javascript:estado_boleta('${estado_boleta}');if(history.length>0)history.go(+1);">
	<!--<div id="load_gif" class="pantalla2"></div>-->
    <div id="bloqueo" class="pantalla2"></div>	
   
	<html:form action="/VentaDirecta?method=IngresaVentaDirecta"
		styleId="form1">
		<html:hidden property="addProducto" value="" onfocus="cargaProducto()" styleId="productoSeleccionado" />
		<html:hidden property="accion" styleId="accion" name="ventaDirectaForm" />
		<html:hidden property="cantidad_productos" styleId="cantidad_productos" name="ventaDirectaForm" />
		<html:hidden property="cantidad" styleId="cantidad" name="ventaDirectaForm" />
		<html:hidden property="index_multi_eliminar" styleId="index_multi_eliminar" name="ventaDirectaForm" />
		<html:hidden property="estaGrabado" styleId="estaGrabado" />
		<html:hidden property="codigo_mult" styleId="codigo_mult" name="ventaDirectaForm" />
		<html:hidden property="index_multi" styleId="index_multi" name="ventaDirectaForm" />
		<html:hidden property="codigo_cliente" styleId="codigo_cliente" name="ventaDirectaForm" />
		<html:hidden property="nombreCliente" styleId="nombreCliente" name="ventaDirectaForm" />
		<html:hidden property="estado_boleta" styleId="estado_boleta" name="ventaDirectaForm" />
		<html:hidden property="tipoimp" styleId="tipoimp" name="ventaDirectaForm" />
				
		<!--<html:hidden property="nombre" styleId="nombre" name="ventaDirectaForm" />-->	
		<table width="100%" cellspacing="0">
			<tr>
				<td align="left" bgcolor="#373737" id="txt1"><p  class="vtadirecta"><bean:message key="venta.directa.vta.directa"/></p></td>
				
				<td align="right" bgcolor="#373737" id="txt1">
				<td align="right" bgcolor="#373737" id="txt4">
              		<a href="javascript:void(0);"	id="nuevoPedido">
					 	<img src="images/nuevo.png" width="20" height="20"	border="0" title="Nuevo Encargo">
					</a>
    			</td> 
				<td id="txt4" bgcolor="#373737"  id="txt4" width="30" align="right" >
					<a href="#"  id="enviar" align="right" bgcolor="#373737"  >
		      			<img src="images/money2.png" width="22" height="22" border="0" title="Totalizar Venta" >
		    		</a>
				</td>
				<td td width="30" align="right" bgcolor="#373737" id="txt1">
				  	<a href="#"	onclick="ingresa_venta()">
						 <img src="images/check.png" width="20" height="20"	border="0">
					</a>
				</td> 
				<td width="30" align="right" bgcolor="#373737" id="txt1"><a
					href="#" onclick="cerrar_venta()"> <img src="images/cancel.png" width="20"
						height="20" border="0" title="Cerrar"> </a></td>
			</tr>
			
		</table>
		<table width="100%" cellspacing="1">
			<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.numero.ticket" /></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><html:text
						name="ventaDirectaForm" styleClass="fto"
						property="encabezado_ticket" size="2" readonly="true" /> <html:text
						name="ventaDirectaForm" property="numero_ticket" size="8"
						readonly="true" styleClass="fto" styleId="numero_ticket"/>
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.pedido.cliente"/></td> 
				<td align="justify" bgcolor="#c1c1c1" id="txt2" colSpan ="3">
						<html:text maxlength="8" property="nif" styleId="nif" size="30" styleClass="fto"
						 size="15" />-
						<html:text size="2" styleClass="fto" readonly="true" property="dv" styleId="dv" />
						<a href="javascript:void(0);" id="buscar" > 
							<img src="images/luparapida.jpg" width="15" height="15" border="0" title="Busqueda rápida de cliente"> 
						</a> 
						<a href="javascript:void(0);" id="cliente_generico" > 
							<img src="images/cliente_generico.png" width="15" height="15" border="0" title="Cliente Generico"> 
						</a>
						<!--<a href="javascript:void(0);">
	      						<img src="images/lupa.png" width="15" height="15" border="0" >
	    				</a>-->
				 <td align="left" bgcolor="#c1c1c1" id="txt5" colspan="4">				 	                  
					<div id="nombre_clienteDIV" >
					
					</div>
				 </td>		
			</tr>
			<tr>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.numero.caja"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2" colspan="3"><html:text
						name="ventaDirectaForm" property="numero_caja" styleId="numero_caja" readonly="true"
						styleClass="fto" size="8" />
				</td>								
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.cajero"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2">
					<html:select disabled="true"
						property="nombreCajero" name="ventaDirectaForm" styleClass="fto"  styleId="cajero"> 
						<html:option value="0"><bean:message key="venta.directa.seleccione.cajero"/></html:option>
						<html:optionsCollection name="ventaDirectaForm"
							property="listaAgentes" label="usuario" value="usuario"
							styleClass="fto" />
					</html:select>
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.fecha"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><html:text
						name="ventaDirectaForm" property="fecha" readonly="true" size="10"
						styleClass="fto" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.hora"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><html:text
						name="ventaDirectaForm" property="hora" readonly="true" size="10"
						styleClass="fto" />
				</td>								
			</tr>
			<tr>				
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.tipo.a"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><label> <html:select disabled="true"
							property="tipoAlbaran" name="ventaDirectaForm" styleClass="fto" styleId="tipo_albaran">  
							<html:optionsCollection name="ventaDirectaForm"
								property="listaAlbaranes" label="descripcion" value="codigo"
								styleClass="fto" />
						</html:select> </label>
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.agente"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2">	
					<html:select disabled="true"
						property="agente" name="ventaDirectaForm" styleClass="fto"  styleId="agente">  
						<html:option value="0"><bean:message key="venta.directa.seleccione.agente"/></html:option>
						<html:optionsCollection name="ventaDirectaForm"
							property="listaAgentes" label="usuario" value="usuario"
							styleClass="fto" />
					</html:select>				
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><bean:message key="venta.directa.divisa"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><html:text
						name="ventaDirectaForm" property="divisa" styleId="divisa" size="15"
						readonly="true" styleClass="fto" />
				</td>
				<td align="left" bgcolor="#c1c1c1" id="txt2" colspan="3"><bean:message key="venta.directa.cambio"/></td>
				<td align="left" bgcolor="#c1c1c1" id="txt2"><html:text
						name="ventaDirectaForm" property="cambio" size="12"
						readonly="true" styleClass="fto" />
				</td>				
			</tr>
		</table>

<div id="scrolling_articulos">
  <table width="100%">
                <tr>
                    <td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.codigo.articulo"/>
                    	&nbsp;&nbsp;
                    	<a href="#" onclick="javascript:busqueda_producto_directo()" id="enviar" >
      						<img src="images/add.png" width="15" height="15" border="0" title="Buscar Productos">
    					</a>
                    </td>
                    <td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.descripcion"/></td>
                   <%--  <td id="txt1" bgcolor="#373737">subalm</td>--%>
                    <td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.precio"/></td>
                    <%--<td id="txt1" bgcolor="#373737">supl</td>
                    <td id="txt1" bgcolor="#373737">dto</td>--%>
                    <td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.importe"/></td>
                    <td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.cantidad"/></td>
                    <%--<td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.grupo"/></td>
                    <td id="txt1" bgcolor="#373737">tipo</td>
                    <td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.estado"/></td>--%>
                    <td id="txt4" bgcolor="#373737"><bean:message key="venta.directa.multioferta"/></td>
                    <td id="txt4" bgcolor="#373737">
                    	<a href="#" onclick="javascript:busqueda_producto()" id="enviar">
      						<img src="images/add.png" width="15" height="15" border="0" title="Buscar Productos">
    					</a>
                    </td>
                </tr>
                
                <logic:present property="listaProductos" name="ventaDirectaForm">
                
                    <logic:iterate id="productos" property="listaProductos" name="ventaDirectaForm"  indexId="index">
                        <tr >
                        		<bean:define id="codigo" type="String">
                                    <bean:write name="productos" property="codigo"/>
                                </bean:define>
                                <bean:define id="indexMulti" type="String">
                                    <bean:write name="productos" property="indexMulti"/>
                                </bean:define>
                                <bean:define id="cantidad" type="String">
                                    <bean:write name="productos" property="cantidad"/>
                                </bean:define>
                            <td id="txt5" bgcolor="#c1c1c1" align="center" class="fto codigo_barra_prod" ><bean:write name="productos" property="cod_barra" /></td>
                            <td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="descripcion"/></td>
                             <%--<td id="txt2" bgcolor="#c1c1c1">subalm</td>--%>
                            <td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="precio" format="$###,###.##" /></td>
                            <%--<td id="txt2" bgcolor="#c1c1c1">supl</td>--%>
                           <%--<td id="txt2" bgcolor="#c1c1c1"><bean:write name="productos" property="descuento"/></td>--%>
                           	<td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="importe" format="$###,###.##"/></td>
                            <td id="txt5" bgcolor="#c1c1c1">
                            	<logic:equal  name="productos"  property="familia" value="MUL">
                            	<input type="text" name="cantidad" value='${cantidad}' size="3" align="left" class="fto" id="cantProd" readonly="true"/>
                            	</logic:equal>
                            	<logic:notEqual  name="productos"  property="familia" value="MUL">
                            	<input type="text" name="cantidad" onchange="actualiza_cantidad('${index}', this,event)" value='${cantidad}' size="3" align="left" class="fto" id="cantProd"/>
                            	</logic:notEqual>
                            </td>
                            <%--<td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="grupo"/></td>
                            <td id="txt2" bgcolor="#c1c1c1"><bean:write name="productos" property="tipo"/></td>
                            <td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="estado"/></td>--%>
                            <td id="txt5" bgcolor="#c1c1c1" align="center">
	                            <logic:equal  name="productos"  property="familia" value="MUL">
	                            	<a href="#" onclick="javascript:busqueda_multioferta('${codigo}','${indexMulti}');" id="enviar">
	      								<img src="images/add.png" width="15" height="15" border="0" title="Buscar MultiOferta" />
	    							</a>
	    						</logic:equal>
    						</td>
                            <td id="txt5" bgcolor="#c1c1c1"> 
                                <logic:equal  name="productos"  property="familia" value="MUL">
                                	<a href="#" onclick="javascript:eliminarProductoMultiOferta('${codigo}','${indexMulti}');" name="" id="enviar">
	      								<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Producto de Venta" />
	    							</a>
                                </logic:equal>
                                <logic:notEqual name="productos"  property="familia" value="MUL">                       	
	                            	<a href="#" onclick="javascript:eliminarProducto('${codigo}');" name="" id="enviar">
	      								<img src="images/cancel.png" width="15" height="15" border="0" title="Eliminar Producto de Venta" />
	    							</a>
    							</logic:notEqual>
    						</td>
                        </tr>
                    </logic:iterate>
                </logic:present>
  		</table> 
  </div> 
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td id="txt5" align="right"><bean:message key="venta.directa.total"/>
        <label>
          <html:text name="ventaDirectaForm" property="sumaTotal" disabled="true" styleId="sumaTotal"/>
			
        </label>
        
    	</td>
    </tr>
  </table> 
</html:form>

<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script>

	var $j = jQuery.noConflict();
	var val_rut = /^[0-9]{7,12}$/; 
	
	//$j("#nombre_clienteDIV").html($j("#nombre").val());
	
	$j("#buscar").on("click",function(){
		var usuario = $j("#nif").val();
		if(val_rut.test(usuario) != false){
			$j.ajax({
				  type: "POST",
				  url: "VentaDirecta.do?method=traeClienteDirecta",
				  dataType: "text",
				  data:"nif="+usuario,
				  asycn:false, 
				  beforeSend: function(){
        			 $j("#nombre_clienteDIV").html("Cargando ....");
			      },
				  success: function(data){				  
				  	var obj = $j.parseJSON(data);
				  					  				  	
				  	$j(obj).each(function(i,val) {
					   $j.each(val,function(k,v){
					   		if(k=="nombre_cliente"){
					   			$j("#nombre_clienteDIV").html(v);					   			
					   			$j.cookie("nombre_directa",v);					   			
					   		}else if(k=="dvnif"){
					   			$j("#dv").val(v);
					   		}else if(k == "codigo_cliente"){
					   			$j("#codigo_cliente").val(v);
					   		}else if(k == "apellido"){
					   			$j("#nombreCliente").val(v);
					   		}
					   });
					 });
					 
					 if($j("#dv").val() == ""){
					 	if (confirm('El cliente no existe, deseas ingresarlo?')) {
					 		$j.cookie("rut_directa",$j("#nif").val());
					 		$j.cookie("vend_directa",$j("#cajero").val());
					 		$j.cookie("n_caja",$j("#numero_caja").val());
					 		$j.cookie("venta_directa","777");
					 		$j.cookie("mostrar_back_vtadirecta","777");
					 		$j.cookie("pase","0");
					 		$j.cookie("pase1","0")
						    location.href = '<%=request.getContextPath()%>/Cliente.do?method=cargaFormulario';
						} else {							
						    alert("Debes Ingresar el Cliente generico.");
						    $j("#nif").val("");
					  }
					 }/*else{
					 		if($j.cookie("util") != "777"){
						 		//CAMBIO SOLICITADO POR ANDREA JADUE 20150320,SIEMPRE LLEVA AL MENU DE CLIENTE AUNQUE YA SE ENCUENTRE REGISTRADO
						 		$j.cookie("rut_directa",$j("#nif").val());
						 		$j.cookie("vend_directa",$j("#cajero").val());
						 		$j.cookie("n_caja",$j("#numero_caja").val());
						 		$j.cookie("venta_directa","777");
						 		$j.cookie("mostrar_back_vtadirecta","777");
						 		$j.cookie("pase","0");
						 		$j.cookie("pase1","0");
						 		$j.cookie("util","777");
							    location.href = '<%=request.getContextPath()%>/Cliente.do?method=cargaFormulario';
							}
					 }*/
					 											  												  		
		 	 	  }
		 	});
		}else{
		 	alert("Ingresa un RUT válido");
		}
	});
	
	//Limpio Formulario
	$j("#nuevoPedido").on("click",function(){
		$j.cookie("nombre_directa","");
		$j.cookie("util","0");
		$j("#enviar").css("display","block");
		window.location.href ='<%=request.getContextPath()%>/VentaDirecta.do?method=carga'; 
	});
	$j("#enviar").on("click",function(){
		valida_genera_venta();
	});
	$j(document).ready(function(){
		$j("#nombre_clienteDIV").html($j.cookie("nombre_directa"));
		//LEO CLIENTE CARGADO
		/*if($j.cookie("back_form_cliente")=="777"){			
			$j("#nif").val($j.cookie("rut_directa"));
			//$j("#cajero,#agente").val($j.cookie("vend_directa"));
			$j("#divisa").val("PESO");
			$j.cookie("back_form_cliente","0");
			$j.cookie("mostrar_back_vtadirecta","0");
			$j("#buscar").click();
		}*/
		//GUARDO NOMBRE 
		//
	});
	
	
	
	//BORRO COOKIE
	if($j("#dv").val()=="") $j.cookie("nombre_directa","");
	$j("#cliente_generico").on("click",function(){
	  	$j("#nif").val("66666666"); 
	  	$j("#buscar").click();
	});
	
	
	function estado_boleta(boleta){
		
		 var $j = jQuery.noConflict();
		 
		 
	     var encargo_cobrado = $j("#numero_ticket").val();

		 
		 if($j.cookie("estado_boleta") != "generada"){
				var tmp = boleta.split("_");
				
				var tipoimpresion = $j("#tipoimp").val() == "1" ? "Carta": "Termica";
				var rut = (tmp[3] != "0")?tmp[3]:$j("#nif").val()+"-"+$j("#dv").val();
				var nboleta = tmp[1]+".pdf";
				
				var urlbol = "http://10.216.4.16/39 "+rut+" "+nboleta;
				
				if(tmp[0] == "0" || tmp[2] =="true"){
					
					alert("Error: No se pudo generar la boleta, favor revisar el modulo de reimpresión de Boletas.");
					$j("#enviar").css("display","none");
					
				}else if(tmp[0] == "1" && tmp[2] =="false"){
									
					$j(".pantalla2").css("display","block");
					alert("Generando boleta electrónica, espere un momento por favor....");
					setTimeout(function(){  
						window.open(urlbol,"_blank"); $j(".pantalla2").css("display","NONE");
						window.focus();
						window.location.href ='<%=request.getContextPath()%>/VentaDirecta.do?method=cargaCaja'; 						
					}, 7000);						
					$j.cookie("estado_boleta","generada");
					$j("#enviar").css("display","none");
           		  
				
					
				}else if(tmp[0] == "2" && tmp[2] =="false"){
					alert("!ATENCIÓN¡ AGREGAR MAS FOLIOS, SE ESTAN AGOTANDO");
					$j(".pantalla2").css("display","block");
					alert("Generando boleta , espere un momento por favor....");
					setTimeout(function(){  
						window.open(urlbol); $j(".pantalla2").css("display","NONE");
						window.location.href ='<%=request.getContextPath()%>/VentaDirecta.do?method=cargaCaja'; 						
					}, 7000);
					$j.cookie("estado_boleta","generada");
					$j("#enviar").css("display","none");
				}
		   }
	}
</script>
</body>
</html:html>