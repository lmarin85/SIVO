<%-- 
    Document   : busqueda_productos
    Created on : 01-Feb-2012, 10:59:14
    Author     : Advice70
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        
		 <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script language="javascript" src="js/utils.js"></script>
		
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>		
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>			
		<script type="text/javascript" src="js/jquery.datepick.js"></script>			
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>				
	 	<script type="text/javascript" src="js/venta/busqueda_multiofertas.js"></script>
		
		
        <script type="text/javascript">
       	
       		function inicio_pagina(){
				
				var estadoCercaMulti = document.getElementById("estadoCercaMulti").value;
				var estado = document.getElementById("estado").value;			
				
				
				if("error_cerca" == estadoCercaMulti){
					alert("Debe tener valor en adicion");
				}
				
				if("error_validacion_cristal" == estado){
					alert("El cristal que se esta agregando se encuentra incompleto (debe tener tipo, ojo, y graduacion), ingreselo nuevamente.");
					document.getElementById("estado").value = "";
					estado = "";
				}
				
				if("ADICION_NO_PERMITIDA" == estado){
					alert("Adición no es permitida para esta familia y receta");
					document.getElementById("estado").value = "";
					estado = "";
				}
				if("SIN_ADICION" == estado){
					alert("Para este cristal, la receta debe tener adicion");
					document.getElementById("estado").value = "";
					estado = "";
				}
					
				if("producto_con_suplemento_obligatorio" == estado){
					document.getElementById("estado").value = "";	
					showPopWin('<%=request.getContextPath()%>/Suplementos.do?method=carga', 430, 300, cargaSuplementos, false);
				}	
				
				var valor = document.busquedaProductosForm.tipofamilia.value;
			                 	
			    if("C" == valor || "L" == valor){
			    	Seccion = document.getElementById("mostrarGraduacionID");
			        Seccion.style.display="";	                 		
			    }else{
			         Seccion = document.getElementById("mostrarGraduacionID");
			         Seccion.style.display="none";	
			    }
			    
			    var bloquea = document.getElementById("bloquea").value;
			    var estadoEncargo = document.getElementById("estadoEncargo").value;
			    var tienePagos = document.getElementById("tienePagos").value;
			    
			     
			    if("bloquea"== bloquea || estadoEncargo == "cerrado" || tienePagos == "true" ){
			    	deshabilitarCampos();
			    }
		    			
			}
		
		
		    function deshabilitarCampos(){
			
				var inputs = document.all.tags("input");
			    var i;
				for(i=0;i<inputs.length;i++)
				{
					if (inputs[i].type == "text") {			
						
						inputs[i].disabled = true;						
					}	
				}
				
				var selects = document.all.tags("select");
			    for(i=0;i<selects.length;i++)
			    {
			                selects[i].disabled = true;
			    }
			    
			    document.getElementById('chk_cerca').disabled =true;
			    document.getElementById('ojo_derecho').disabled =true;
			    document.getElementById('ojo_izquierdo').disabled =true;    
		   
			}
		    function error_sin_graduacion(){
		    	alert("Cliente no tiene graduaciones, no es posible vender productos graduados");
		    } 
   	</script>
        
    <title><bean:message key="title.pos"/></title>

    </head>
    <body>
    <logic:equal scope="session" name="estado" value="error_graduacion">
		<body onload="error_sin_graduacion();combo();if(history.length>0)history.go(+1);inicio_pagina()">
	</logic:equal>		
	
	<logic:notEqual scope="session" name="estado" value="error_graduacion">
		<body onload="combo();if(history.length>0)history.go(+1);inicio_pagina()" >
	</logic:notEqual>
	
    
        <html:form  action="/BusquedaProductosMultiOfertas?method=buscarMultioferta" styleId="busqueda" >
            <html:hidden property="accion" styleId="tipo"/>
           	<html:hidden property="erroMultioferta" name="busquedaProductosForm" styleId="erroMultioferta" />
            <html:hidden property="codigoMultioferta" name="busquedaProductosForm" styleId="codigoMultioferta"/>
            <html:hidden property="productoEliminar" value=""  styleId="productoSeleccionado" />
            <html:hidden property="index_multi" name="busquedaProductosForm" styleId="index_multi"/>
            <html:hidden property="index_producto_multi" name="busquedaProductosForm" styleId="index_producto_multi"/>
            <html:hidden property="cantidad_prod" name="busquedaProductosForm" styleId="cantidad_prod"/>
           	<html:hidden property="form_origen" name="busquedaProductosForm" styleId="form_origen"/>
           	<html:hidden property="fecha_graduacion" name="busquedaProductosForm" styleId="fecha_graduacion"/>
           	<html:hidden property="numero_graduacion" name="busquedaProductosForm" styleId="numero_graduacion"/>
           	<html:hidden property="cliente" name="busquedaProductosForm" styleId="cliente"/>
           	<html:hidden property="estadoCercaMulti" name="busquedaProductosForm" styleId="estadoCercaMulti"/>
           	<html:hidden property="estado" name="busquedaProductosForm" styleId="estado"/>
           	<html:hidden property="addProducto"  styleId="productoSeleccionadoSuplemento"/>
            <html:hidden property="indexProductos"  styleId="indexProductos"/>
            <html:hidden property="bloquea"  styleId="bloquea"/>
            <html:hidden property="estadoEncargo"  styleId="estadoEncargo"/>
            <html:hidden property="tienePagos"  styleId="tienePagos"/>
            	
    <table width="100%" cellspacing="0" >
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4"><bean:message key="busqueda.multiofertas.busqueda.productos.multiofertas"/></td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a id="cerrar" href="#" > 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda"> 
				</a>
      		</td>
    	</tr>
    </table>
    <table width="100%" >
    <tr>
				<td align="left" bgcolor="#c1c1c1" id="txt5" style="width: 380px"
					width="380"><bean:message
						key="busqueda.multiofertas.tipo.familia" /></td>

				<td align="left" bgcolor="#c1c1c1" id="txt5" width="560">
    		<html:select size="1" property="tipofamilia" styleId="tipofamilia"  onchange="javascript:Seleccion('tipofamilia')" styleClass="fto"> 
               	<html:option value="0"><bean:message key="busqueda.multiofertas.seleccionar"/></html:option>
               	<logic:notEmpty property="listaTipoFamilia" name="busquedaProductosForm">                            		
            	<html:optionsCollection name="busquedaProductosForm" property="listaTipoFamilia" label="descripcion" value="codigo"/>
            	</logic:notEmpty>
            </html:select>
    	</td>
    </tr>
    <tr>
    	<td align="left" bgcolor="#c1c1c1" id="txt5" width="380">
    		<bean:message key="busqueda.multiofertas.familias"/>
    	</td>
    	<td align="left" bgcolor="#c1c1c1" id="txt5" width="560">
    		<html:select  size="1" property="familia" disabled="true" onchange="javascript:Seleccion('familia')" styleId="familia" styleClass="fto">     
            	<html:option value="0"><bean:message key="busqueda.multiofertas.seleccionar"/></html:option>
            	<logic:notEmpty property="listaFamilias" name="busquedaProductosForm">
            	<html:optionsCollection name="busquedaProductosForm" property="listaFamilias" label="descripcion" value="codigo"/>
       	 		</logic:notEmpty>
       	 	</html:select>
    	</td>
    </tr>
    <tr>
    	<td align="left" bgcolor="#c1c1c1" id="txt5" width="380">
    		<bean:message key="busqueda.multiofertas.subfamilia"/>
    	</td>
    	<td align="left" bgcolor="#c1c1c1" id="txt5" width="560">
    		<html:select size="1"  property="subFamilia" onchange="javascript:Seleccion('subfamilia')" disabled="true" styleId="subFamilia" styleClass="fto"> 
  	        	<html:option value="0"><bean:message key="busqueda.multiofertas.seleccionar"/></html:option>
	            <logic:notEmpty property="listaSubFamilias" name="busquedaProductosForm">
	            <html:optionsCollection name="busquedaProductosForm" property="listaSubFamilias" label="descripcion" value="codigo"/>
	        	</logic:notEmpty>
	        </html:select>
    	</td>
    </tr>
    <tr>
    	<td align="left" bgcolor="#c1c1c1" id="txt5" width="380">
    		<bean:message key="busqueda.multiofertas.grupo.productos"/>
    	</td>
    	
    	<td align="left" bgcolor="#c1c1c1" id="txt5" width="560">
    		<html:select size="1" property="grupo" disabled="true" styleId="grupo" styleClass="fto">
            	<html:option value="0"><bean:message key="busqueda.multiofertas.seleccionar"/></html:option>
                <logic:notEmpty property="listaGruposFamilias" name="busquedaProductosForm">
                <html:optionsCollection name="busquedaProductosForm" property="listaGruposFamilias" label="descripcion" value="codigo"/>
            	</logic:notEmpty>
            </html:select>
    	</td>
    	
    </tr>
    <tr>
    	<td align="left" bgcolor="#c1c1c1" id="txt5">
    		<bean:message key="busqueda.productos.codigo.producto"/>    	
    	</td>
      	<td align="left" bgcolor="#c1c1c1" id="txt5">
      		<html:text value=""  property="codigoBusqueda" styleClass="fto" name="busquedaProductosForm"/>
      	</td>
     </tr>	
     <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.codigo.barra"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			  <html:hidden property="descripcion" value=""/>
      			  <html:hidden property="fabricante" value=""/>
        		  <html:text value="" name="busquedaProductosForm" property="codigoBarraBusqueda" styleClass="fto" onkeypress=""/>
        		  <a href="#" id="enviar"  >
      						<img src="images/lupa.png" width="14" height="14" border="0" title="Buscar Productos"  id="idBuscar" />Buscar
    			  </a>
      		</td>
      </tr>
       <tr>
				
				
	   </tr>
      <tr>
      		
      		
      </tr>
      <tr>
      		    		
      </tr>
    </table>
    <div id="mostrarGraduacionID" style="display:none">
    <logic:equal value="PEDIDO" name="busquedaProductosForm" property="form_origen">
    <div>
    	<table width="100%" border="0" cellspacing="1"> 
	    	<tr>
	      		<td align="right" bgcolor="#c1c1c1" id="txt5" colspan="7">
	      		<a href="#" onclick="javascript:detalleOpticoMulti('detalle_graduacion')">
      				<img src="images/detalle.png" width="15" height="15" border="0" title="Ocultar / Mostrar detalle de graduación">
    			</a>
    			</td>	      		
	      	</tr>
      	</table>
    </div>    
   
    <html:hidden property="ojo" styleId="ojo"/>	
    <bean:define id="graduacion" property="graduacion" name="busquedaProductosForm"/> 
        <div id="detalle_graduacion" style="display:">
    		<table width="100%" border="0" cellspacing="1">      					
					
					  <tr>
					    <td  bgcolor="#373737" id="txt4"><bean:message key="busqueda.productos.seleccion"/></td>
					    <td  bgcolor="#373737" id="txt4" colspan="6" align="center">
					    	<bean:message key="busqueda.productos.graduacion"/>
					    	<bean:write name="graduacion" property="fecha"/>
					    </td>
					  </tr>
					  <tr>
					    <td bgcolor="#c1c1c1" id="txt5" align="center">
					    <html:radio property="ojo" value="derecho" styleId="ojo_derecho" onclick="cambia_estado('DERECHO')"><bean:message key="busqueda.productos.ojo.derecho"/></html:radio>
					   <!--  <input type="radio"	name="ojo_d" id="ojo_derecho" value="derecho" onclick="cambia_estado('DERECHO')">  --> 
					    </td>
					    <td id="txt5" bgcolor="#c1c1c1" colspan="2">&nbsp;</td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.esfera"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.cilindro"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.diametro"/></td>
			    <td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					  </tr>
					  <tr>
					    <td bgcolor="#c1c1c1" id="txt5" align="center">
					    	<html:radio property="ojo" value="izquierdo" styleId="ojo_izquierdo" onclick="cambia_estado('IZQUIERDO')"><bean:message key="busqueda.productos.ojo.izquierdo"/></html:radio>
					      <!--  <input type="radio" name="ojo_i" id="ojo_izquierdo" value="izquierdo" onclick="cambia_estado('IZQUIERDO')"> <bean:message key="busqueda.productos.ojo.izquierdo"/> -->
					    </td>
					    <td id="txt5" bgcolor="#c1c1c1"></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="right"><bean:message key="busqueda.productos.o.d"/></td>
			    		<td id="txt2" bgcolor="#c1c1c1" align="center">
			    
				    		<logic:equal property="chk_cerca" name="busquedaProductosForm" value="true">
				    			<input type="text" readonly="true" class="fto" value='<bean:write name="graduacion" property="OD_esfera_cerca"/>' size="3">
				    		</logic:equal>
				    		<logic:equal property="chk_cerca" name="busquedaProductosForm" value="false">
				    			<input type="text" readonly="true" class="fto" value='<bean:write name="graduacion" property="OD_esfera"/>' size="3">
				    		</logic:equal>
			    			
						</td>
						    <td id="txt5" bgcolor="#c1c1c1" align="center">
										<input type="text"  readonly="true"  class="fto" value='<bean:write name="graduacion" property="OD_cilindro"/>' size="3">
							</td>
						    <td id="txt5" bgcolor="#c1c1c1"align="center">
						    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion" property="OD_diametro"/>' size="3">
							</td>
							<td id="txt5" bgcolor="#c1c1c1" width="">
								<html:checkbox property="chk_cerca" name="busquedaProductosForm" onclick="valida_Cerca(this)" styleId="chk_cerca">
									<bean:message key="busqueda.productos.cerca"/>
								</html:checkbox>
							</td>
					  </tr>
					  <tr>
					    <td bgcolor="#c1c1c1" id="txt5" align="center">
					    	
					    </td>
					    <td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					    <td id="txt5" bgcolor="#c1c1c1" align="right"><bean:message key="busqueda.productos.o.i"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center">
					    
					    	<logic:equal property="chk_cerca" name="busquedaProductosForm" value="true">
				    			<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion" property="OI_esfera_cerca"/>' size="3">
				    		</logic:equal>
				    		<logic:equal property="chk_cerca" name="busquedaProductosForm" value="false">
				    			<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion" property="OI_esfera"/>' size="3">
				    		</logic:equal>
				    		
					    <td id="txt5" bgcolor="#c1c1c1" align="center">
							<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion" property="OI_cilindro"/>' size="3">
									</td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center">
					    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion" property="OI_diametro"/>' size="3">
						</td>
						<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					  </tr>
					   <tr>
      		    		
      				  </tr>
		</table>
    </div>
	</logic:equal>
   </div>
  
 <div id="scrolling_articulos_multiofertas" >
 <!-- para multioferta -->
  <table width="100%" id="multiofertas" height="20px">
                <tr>
                    <td id="txt4" bgcolor="#373737"><bean:message key="busqueda.multiofertas.codigo.articulo"/></td>
                    <td id="txt4" bgcolor="#373737"><bean:message key="busqueda.multiofertas.descripcion"/></td>
                   <%--  <td id="txt1" bgcolor="#373737">subalm</td>--%>
                    <td id="txt4" bgcolor="#373737"><bean:message key="busqueda.multiofertas.precio"/></td>
                    <%--<td id="txt1" bgcolor="#373737">supl</td>
                    <td id="txt1" bgcolor="#373737">dto</td>--%>
                   <!-- <td id="txt4" bgcolor="#373737"><bean:message key="busqueda.multiofertas.importe"/></td>-->
                    <td id="txt4" bgcolor="#373737"><bean:message key="busqueda.multiofertas.cantidad"/></td>
                    <td id="txt4" bgcolor="#373737"><bean:message key="busqueda.multiofertas.grupo"/></td>
                    <%--<td id="txt1" bgcolor="#373737">tipo</td>--%>                    
                    <td id="txt4" bgcolor="#373737">
                    	<logic:equal value="PEDIDO" name="busquedaProductosForm" property="form_origen">
                    		<bean:message key="venta.pedido.tratamiento"/>
                    	</logic:equal>
                    	<logic:notEqual value="PEDIDO" name="busquedaProductosForm" property="form_origen">                    		
                    		<bean:message key="busqueda.multiofertas.estado"/>
                    	</logic:notEqual>
                    </td>
                    
                   
                </tr>
                
                <logic:present property="listaProductosMultioferta" name="busquedaProductosForm">
                
                    <logic:iterate id="productos" property="listaProductosMultioferta" name="busquedaProductosForm" indexId="index">
                        <tr >
                        		<bean:define id="codigo" type="String">
                                    <bean:write name="productos" property="codigo"/>
                                </bean:define>
                                <bean:define id="indexProductoMulti" type="String">
                                    <bean:write name="productos" property="indexProductoMulti"/>
                                </bean:define>
                            <td id="txt5" bgcolor="#c1c1c1" align="center" class="fto"><bean:write name="productos" property="cod_barra" /></td>
                            <td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="descripcion"/></td>
                             <%--<td id="txt2" bgcolor="#c1c1c1">subalm</td>--%>
                            <td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="precio" format="$###,###.##"/></td>
                            <%--<td id="txt2" bgcolor="#c1c1c1">supl</td>--%>
                           <%--<td id="txt2" bgcolor="#c1c1c1"><bean:write name="productos" property="descuento"/></td>--%>
                           	<!--<td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="importe" format="$###,###.##"/></td>-->
                            <td id="txt5" bgcolor="#c1c1c1"><bean:write name="productos" property="cantidad"/></td>
                            <td id="txt5" bgcolor="#c1c1c1">
                            <bean:define id="grupoMulti" type="String">
                            	<bean:write name="productos" property="grupo"/>
                            </bean:define>  
                            <logic:equal value="PEDIDO" name="busquedaProductosForm" property="form_origen">                                        
                           	 <!--<input type="text" name="grupoMulti" id="grupoMulti" size="2" value="<bean:write name="productos" property="grupo"/>" class="fto" onblur="verificaNumero(this);actualiza_grupo('${indexProductoMulti}')" onkeypress="return validar_numerico(event)" />-->
                            <html:text  name="busquedaProductosForm"  property="grupos"  styleId="grupos"  size="2" value = '${grupoMulti}' styleClass="fto" onblur="verificaNumero(this);actualiza_grupo('${indexProductoMulti}','${index}')" onkeypress="return validar_numerico(event)"/> 
                           	</logic:equal> 
                           	
                            </td>
                            <%--<td id="txt2" bgcolor="#c1c1c1"><bean:write name="productos" property="tipo"/></td>--%>
                            <td id="txt5" bgcolor="#c1c1c1">
                            	
                            	<logic:equal value="PEDIDO" name="busquedaProductosForm" property="form_origen">
                    				<logic:equal value="true" property="tiene_suple" name="productos" >
	                            		<a href="#" onclick="javascript:seleccionTratamientos('${indexProductoMulti}');" >
	      									<img src="images/add.png" width="15" height="15" border="0" title="Ver Suplementos" >
	    								</a>
    								</logic:equal>
                    			</logic:equal>
                    			<logic:notEqual value="PEDIDO" name="busquedaProductosForm" property="form_origen">                    		
                    				<bean:write name="productos" property="estado"/>
                    			</logic:notEqual>
                            </td>
                            
                           
                        </tr>
                    </logic:iterate>
                </logic:present>
  </table> 
  </div><!-- fin para multioferta --> 
       
        <div id="tablaSeleccion" style="display: none" >
        <table align="center">
            <thead>
                <tr>
                    <th align="center" bgcolor="#373737" id="txt4" colspan="3"><bean:message key="busqueda.multiofertas.producto.seleccionado"/></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.multiofertas.producto.seleccionado"/><html:text property="producto" styleId="producto" readonly="true" styleClass="fto"/></td>
                    <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.multiofertas.cantidad.producto.seleccionado"/><html:text property="cantidad" readonly="true" styleId="cantidad" styleClass="fto"/></td>
                    <td align="left" bgcolor="#c1c1c1" id="txt5">
                    	<a href="#" onclick="pasar_producto_multioferta('pasar_multioferta')">
      						<img src="images/save.png" width="15" height="15" border="0" >
    					</a>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>            
        <br>
         
    
         
        
        <table width="100%" cellspacing="0" cellpadding="0">
        		<tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.multiofertas.articulo"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="30%"><bean:message key="busqueda.multiofertas.descripcion"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.multiofertas.precio.iva"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.multiofertas.importe"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.multiofertas.grupo"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.multiofertas.estado"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="15%"></th>
                </tr>
           </table>
           <logic:present property="listaProductos" name="busquedaProductosForm">
            	
                <div id="scrolling">
                <table width="100%" cellspacing="0">
                <logic:iterate id="listaProductosId" property="listaProductos" name="busquedaProductosForm">
                        <tr >
                            
                                <bean:define id="codigo" type="String">
                                    <bean:write name="listaProductosId" property="codigo"/>
                                </bean:define>
                                
                                                               
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="listaProductosId" property="cod_barra" /></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="32%"><bean:write name="listaProductosId" property="descripcion"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="13%"><bean:write name="listaProductosId" property="precio" format="$###,###.##" /></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="12%"><bean:write name="listaProductosId" property="importe"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="12%"><bean:write name="listaProductosId" property="grupo"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaProductosId" property="estado"/></td>
                            <td align="left" bgcolor="#c1c1c1" id="txt5" width="15%">
                            	<a href="#" onclick="javascript:pasar_producto_multioferta('pasar_multioferta','${codigo}');">
      								<img src="images/add.png" width="15" height="15" border="0" >
    							</a>
                            </td>
                            
                        </tr>
                    </logic:iterate>
               </table> 
               </div> 
            </logic:present>
        </html:form>
    </body>
   	<script type="text/javascript" src="js/jquery.cookie.js"></script>
    
    <script type="text/javascript">
    	var $j = jQuery.noConflict();
   	 
    	$j("#enviar").on("click",function(){
    		if($j("#tipofamilia").val()=="C"){
	    		if($j("#familia").val() == "0" || $j("#subFamilia").val() == "0" || $j("#grupo").val() == "0"){
	    			alert("Debes seleccionar todos los filtros");
	    		}else{
	    			Seleccion('buscar');
	    		}
	    	}else{
	    		Seleccion('buscar');
	    	}
    	});  
    	
    	$j("#cerrar").on("click",function(){
    		//ARRGLO MULTIOFERTA
    		    		
    		if($j(".vtadirecta",window.parent.document).html() !="VENTA DIRECTA"){
		    		if($j.cookie("borra_prod_multioferta_1") =="777"){  
			    	    $j("#multiofertas tr").each(function(a){
			    	    	 	
			    	    	$j(this).find("td > #grupos").val($j.cookie("indice_multi")).blur();
			    	    });
			    	  
			    	  	$j("#multiofertas tr").each(function(a){
			    	    	 	
			    	    	$j(this).find("td > #grupos").val($j.cookie("indice_multi")).blur();
			    	    		
			    	    });
			    	    
			    	    	$j("#multiofertas tr").each(function(a){
			    	    	 	
			    	    	$j(this).find("td > #grupos").val($j.cookie("indice_multi")).blur();
			    	    		
			    	    });
			    	    	$j("#multiofertas tr").each(function(a){
			    	    	 	
			    	    	$j(this).find("td > #grupos").val($j.cookie("indice_multi")).blur();
			    	    		
			    	    });
			    	    $j.cookie("borra_prod_multioferta_1","");
		    	    }
		    	    var sum = 0;
		    	    parent.dtomofercombo();
		    		cerrar();
		    		/*$j("#multiofertas tr > td > #grupos").each(function(a){
		    			sum += parseInt($j(this).val());
		    			if(sum % 3 == 0 ){
		    				if($j.cookie("borra_prod_multioferta_2") =="777"){    	  
				    			parent.borrar_elementos();		    			
				    			$j.cookie("borra_prod_multioferta_2","");
				    		}
			    			 parent.dtomofercombo();
				    		cerrar();
				    	}		    	
		    		   //cerrar(); 	
		    		});*/
   		    }else{   		
   		    	 
   		    	cerrar(); 	
   		    }		 
   		    
   		   
    	 });
    	 var arr = new Array();	
   	  	 var arr1 = new Array();	
    	 var pos = new Array();
    	 var c1 = 0;
		 var c2 = 0;
		 
		//20141007 javascript i love you :) 
		//GUARDO PRODUCTOS DE LA MULTIOFERTA
		//ORDENO ARREGLO DE PRODUCTOS PARA QUE SIEMPRE QUEDE M,C,C
    	 $j("#contenido tr",window.parent.document).each(function(a){	    	
    			var codbarra = $j(this,window.parent.document).find("td > a").attr("data-barra");
    			var familia  = $j(this,window.parent.document).find("td > a").attr("data-familia");	
   				var ojo =  $j(this,window.parent.document).find("td > a").attr("data-ojo");
   				
    			if(familia == "M"){			
					 arr[0] = codbarra+"-"+familia+"-"+ojo+"-"+c1;   				
    			}  
    			else if(familia == "C" && ojo == "izquierdo"){    	
    									
   					arr[1] = codbarra+"-"+familia+"-"+ojo+"-"+c1; 
   					  					
    			}else if(familia == "C" && ojo == "derecho"){   
    			 						
   					arr[2] = codbarra+"-"+familia+"-"+ojo+"-"+c1;  
   					 					
    			} 
    			if(familia == "O"){
    				pos[c2]  = a;
    				c2++;
    			}  				    				    	
   		 });
   		    		   		     		 
   		 	 
		 //FUNCION QUE AGREGA PRODUCTOS A LA MULTIOFERTA
    	 function agrega_multi(arr){         	 	
	 			v = arr.split("-");
	 			 
	 			//compruebo cantidad de multiofertas ya hechas
		    	var c = 0;
		    	
		        $j("#contenido tr",window.parent.document).each(function(a){
		         	var familia  = $j(this,window.parent.document).find("td > a").attr("data-familia");	
		    	 	if(familia == "O"){
		    			pos[c]  = a;    
		    			$j.cookie("indice_multi",pos.length);
		    			c++;			
		    		}  	
		    	});
	 				 		    	 			    	 			 				 				 		
		 		if(v[1] == "M"){	   		 			
		 			$j("#cantidad_prod").val("1"); 	
		 			$j("#index_producto_multi").val($j.cookie("indice_multi"));	
		 			$j("#indexProductos").val($j.cookie("indice_multi"));				 				  	
					pasar_producto_multioferta('pasar_multioferta',v[0]);	
					$j.cookie('prim_cris_mul','777');											
				}else{ 
				    $j("#cantidad_prod").val("1");
				    $j("#index_producto_multi").val($j.cookie("indice_multi"));
					$j("#ojo").val(v[2]); 
					$j("#tipofamilia",window.parent.document).val("C");   
					$j("#index_multi").val($j.cookie("indice_multi")); 
					$j("#numero_graduacion").val("1.0");  	
					$j("#producto").val(v[0]);	
					$j("#estado").val("producto_confirmacion");			     
					$j("#fecha_graduacion").val($j("#fecha_graduacion",window.parent.document).val());
					$j("#indexProductos").val($j.cookie("indice_multi"));	    				   				
					pasar_producto_multioferta('pasar_multioferta',v[0]);	
					
							      					       			    	 			   					  					     			
	 		}  	
	    }	    	  	  
	   		
	    //AGREGO ARMAZON
 		if($j.cookie("carga_multioferta")=="777"){	 		 	 
   			  $j.each(arr,function(i,v){    			  		 			    		 
					   if(i==0) agrega_multi(v);    									   							    				  	
   			  });
 			 
			  $j.cookie("carga_multioferta","0");
    	}
    	
	    //PRIMER CRISTAL
	    $j(document).ready(function(){
			    //PRIMER CRISTAL
			  	if($j.cookie('prim_cris_mul') =="777"){	
				 	   	$j.each(arr,function(i,v){    			  		 			    		  							
							   if(i==1) agrega_multi(v);    											   							  				  
		   			    });		
		   			    $j.cookie('prim_cris_mul','0');		 	  
				      	$j.cookie('seg_cris_mul','777');				      					           	 				 	   	   			 	   			 	   			 	  		 	 	   			 	   		 	   			 	    						
				 }				 	   	    		    	    		    	   		    				      		
		});     
		
		//SEGUNDO CRISTAL 
		if($j.cookie('seg_cris_mul') =="777"){		 	   
		 	   	$j.each(arr,function(i,v){    			  		 			    		  							
					   if(i==2) agrega_multi(v);  
					   											   							  				  
   			    });	
		 	   	$j.cookie('prim_cris_mul','0');		 	  
				$j.cookie('seg_cris_mul','0');
		 	   	$j.cookie('prod0','0');
		 	   	$j.cookie('prod1','0');
		 	   	$j.cookie('prod2','0');	 	
		 	    		 	   	   			 	   			 	   			 	  		 	 	   			 	   		 	   			 	    						
		}			
		
		 	 	
    </script>
</html:html>
