<%-- 
    Document   : busqueda_productos
    Created on : 09-dic-2011, 10:59:14
    Author     : Advice70
--%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
    	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/venta/busqueda_productos.js"></script>
		<link rel="stylesheet" type="text/css" href="css/estiloFormularios.css" />
		<script type="text/javascript" src="js/utils.js"></script>
		<script type="text/javascript">
		load();
		document.oncontextmenu=inhabilitar;	
		function inhabilitar(){return false;}
		</script>
		<style type="text/css">
		<!--
		#blanket {
		   display: block;
		   position: absolute;
		   top: 0%;
		   left: 0%;
		   width: 710px;
		   height: 100%;
		   background-color: black;
		   z-index:9001;
		   opacity:0.6;
		   filter:alpha(opacity=60);
		}
		#seleccionGraduaciones{
		position:absolute;
			z-index: 9003; /*ooveeerrrr nine thoussaaaannnd*/
		}
		-->
		</style>
        
       <title><bean:message key="title.pos"/></title>
       

    </head>
    <body>
    <logic:equal scope="session" name="estado" value="buscar_graduacion">
		<body onload="carga_busqueda_graduacion();if(history.length>0)history.go(+1)" >
	</logic:equal>
    <logic:equal scope="session" name="estado" value="">
		<body onload="javascript: document.busquedaProductosForm.codigoBarraBusqueda.focus();if(history.length>0)history.go(+1)" 
		>
	</logic:equal>
	<logic:equal scope="session" name="estado" value="error_cerca">
		<body onload="error_cerca();if(history.length>0)history.go(+1)">
	</logic:equal>
	<logic:equal scope="session" name="estado" value="error_graduacion">
		<body onload="error_sin_graduacion();if(history.length>0)history.go(+1)">
	</logic:equal>
    
        <html:form action="/BusquedaProductos?method=buscar" styleId="busqueda" >
            <html:hidden property="accion" styleId="tipo"/>
            <html:hidden property="index_graduacion" styleId="graduacion_seleccionada"/>
            
    <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4"><bean:message key="busqueda.productos.busqueda.productos"/></td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Productos"> 
				</a>
      		</td>
    	</tr>
    	</table>
    	<table width="100%" >
    	<tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.familias.productos"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      				<html:select property="familia" onchange="javascript:Seleccion('familia')" styleId="familia" styleClass="fto">    
            			<html:option value="0"><bean:message key="busqueda.productos.seleccionar"/></html:option>
            			<html:optionsCollection name="busquedaProductosForm" property="listaFamilias" label="descripcion" value="codigo"/>
       	 			</html:select>
       		</td>
      </tr>
      <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.subfamilia.productos"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
    
				
					<html:select property="subFamilia" onchange="javascript:Seleccion('subfamilia')"  styleId="subFamilia" styleClass="fto">
	            			<html:option value="0"><bean:message key="busqueda.productos.seleccionar"/></html:option>
	            			<logic:notEmpty property="listaSubFamilias" name="busquedaProductosForm">
	            				<html:optionsCollection name="busquedaProductosForm" property="listaSubFamilias" label="descripcion" value="codigo"/>
	        				</logic:notEmpty>
	        		</html:select>
				
      			 
      		</td>
      </tr>
       <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.grupo.productos"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      		
      		
      			<html:select property="grupo" onchange="javascript:Seleccion('grupofamilia')"  styleId="grupo" styleClass="fto">
                	<html:option value="0"><bean:message key="busqueda.productos.seleccionar"/></html:option>
                	<logic:notEmpty property="listaGruposFamilias" name="busquedaProductosForm">
                		<html:optionsCollection name="busquedaProductosForm" property="listaGruposFamilias" label="descripcion" value="codigo"/>
            		</logic:notEmpty>
            	</html:select>
 
      			 
      		</td>
      </tr>
      <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.codigo.producto"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			 <html:text property="codigoBusqueda" styleClass="fto" name="busquedaProductosForm"/></td>
      </tr>
      <tr>
      		<td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.codigo.barra"/></td>
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			  <html:hidden property="descripcion" value=""/>
      			  <html:hidden property="fabricante" value=""/>
        		  <html:text name="busquedaProductosForm" property="codigoBarraBusqueda" styleClass="fto" onkeypress="javascript:SeleccionEnter('buscar')"/>
        		  <a href="#" onclick="javascript:Seleccion('buscar')" id="enviar">
      						<img src="images/lupa.png" width="14" height="14" border="0" title="Buscar Productos" />Buscar
    				</a>
      		</td>
      </tr>
      <div align="center"></div>
    </table>
        	<input type="hidden" value='<bean:write name="busqueda_avanzada" scope="session"/>' id="busqueda_avanzada">
        	<logic:equal scope="session" value="true" name="busqueda_avanzada" >
        	<html:hidden property="ojo" styleId="ojo"/>		  
        	<bean:define id="graduacion" property="graduacion" name="busquedaProductosForm"/> 
    		<table width="100%" border="0" cellspacing="1">
      					<tr>
      						<td bgcolor="#c1c1c1" id="txt5" colspan="7">&nbsp;</td>
      					</tr>
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
					    	<a href="#" onclick="javascript:Seleccion('buscar_graduacion')">
					    		<img src="images/lupa.png" width="14" height="14" border="0" title="Buscar Graduaciones" />
					    	</a>
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
		</table>
		</logic:equal>
		<input type="hidden" value='<bean:write name="busqueda_avanzada_lentilla" scope="session"/>' id="busqueda_avanzada_lentilla">
        	<logic:equal scope="session" value="true" name="busqueda_avanzada_lentilla" >
        	<html:hidden property="ojo" styleId="ojo"/>		  
        	<bean:define id="graduacion_lentilla" property="graduacion_lentilla" name="busquedaProductosForm"/> 
    		<table width="100%" border="0" cellspacing="1">
      					<tr>
      						<td bgcolor="#c1c1c1" id="txt5" colspan="11">&nbsp;</td>
      					</tr>
					  <tr>
					    <td  bgcolor="#373737" id="txt4"><bean:message key="busqueda.productos.seleccion"/></td>
					    <td  bgcolor="#373737" id="txt4" colspan="10" align="center">
					    	<bean:message key="busqueda.productos.graduacion"/>
					    	<bean:write name="graduacion_lentilla" property="fecha"/>
					    </td>
					  </tr>
					  <tr>
					    <td bgcolor="#c1c1c1" id="txt5" align="center">
					    <html:radio property="ojo" value="derecho" styleId="ojo_derecho" onclick="cambia_estado('DERECHO')"><bean:message key="busqueda.productos.ojo.derecho"/></html:radio>
					    </td>
					    <td id="txt5" bgcolor="#c1c1c1" colspan="2">&nbsp;</td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.esfera"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.cilindro"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.diametro"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.eje"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.radio"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.ZonaOptica"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center"><bean:message key="busqueda.productos.graduaciones.curvaBase"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					  </tr>
					  <tr>
					    <td bgcolor="#c1c1c1" id="txt5" align="center">
					    	<html:radio property="ojo" value="izquierdo" styleId="ojo_izquierdo" onclick="cambia_estado('IZQUIERDO')"><bean:message key="busqueda.productos.ojo.izquierdo"/></html:radio>
					    </td>
					    <td id="txt5" bgcolor="#c1c1c1"></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="right"><bean:message key="busqueda.productos.o.d"/></td>
			    		<td id="txt2" bgcolor="#c1c1c1" align="center">
				    			<input type="text" readonly="true" class="fto" value='<bean:write name="graduacion_lentilla" property="odesfera"/>' size="3">
						</td>
						    <td id="txt5" bgcolor="#c1c1c1" align="center">
										<input type="text"  readonly="true"  class="fto" value='<bean:write name="graduacion_lentilla" property="odcilindro"/>' size="3">
							</td>
						    <td id="txt5" bgcolor="#c1c1c1"align="center">
						    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oddiamt"/>' size="3">
							</td>
							<td id="txt5" bgcolor="#c1c1c1" align="center">
					    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="odeje"/>' size="3">
							</td>
							<td id="txt5" bgcolor="#c1c1c1" align="center">
						    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="odradio1"/>' size="3">
							</td>
							<td id="txt5" bgcolor="#c1c1c1" align="center">
						    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oddiamz0"/>' size="3">
							</td>
							<td id="txt5" bgcolor="#c1c1c1" align="center">
						    	<input type="text" class="fto"  readonly="true"  value='' size="3">
							</td>
							<td id="txt5" bgcolor="#c1c1c1" width="">
							</td>
					  </tr>
					  <tr>
					  	<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					    <td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					    <td id="txt5" bgcolor="#c1c1c1" align="right"><bean:message key="busqueda.productos.o.i"/></td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center">
				    			<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oiesfera"/>' size="3">				    		
					    <td id="txt5" bgcolor="#c1c1c1" align="center">
							<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oicilindro"/>' size="3">
						</td>
					    <td id="txt5" bgcolor="#c1c1c1" align="center">
					    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oidiamt"/>' size="3">
						</td>
						<td id="txt5" bgcolor="#c1c1c1" align="center">
					    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oieje"/>' size="3">
						</td>
						<td id="txt5" bgcolor="#c1c1c1" align="center">
					    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oiradio1"/>' size="3">
						</td>
						<td id="txt5" bgcolor="#c1c1c1" align="center">
					    	<input type="text" class="fto"  readonly="true"  value='<bean:write name="graduacion_lentilla" property="oidiamz0"/>' size="3">
						</td>
						<td id="txt5" bgcolor="#c1c1c1" align="center">
					    	<input type="text" class="fto"  readonly="true"  value='' size="3">
						</td>
						<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					  </tr>
		</table>
		</logic:equal>
      
        <div id="tablaSeleccion" style="display: none" >
        <table align="center" >
            <thead>
                <tr>
                    <th align="center" bgcolor="#373737" id="txt1" colspan="3"><bean:message key="busqueda.productos.producto.seleccionado"/></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.producto.seleccionado"/><html:text property="producto" styleId="producto" readonly="true" styleClass="fto"/></td>
                    <td align="left" bgcolor="#c1c1c1" id="txt5"><bean:message key="busqueda.productos.cant.produc.seleccionados"/><html:text property="cantidad" styleId="cantidad" styleClass="fto"/></td>
                    <td align="left" bgcolor="#c1c1c1" id="txt5">
                    	<a href="#" onclick="pasar_Producto()">
      						<img src="images/save.png" width="14" height="14" border="0" title="Guardar Producto" >
    					</a>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>            
        
        <table width="100%" cellspacing="0" cellpadding="0">
        		<tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" width="15%"><bean:message key="busqueda.productos.articulo"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="45"><bean:message key="busqueda.productos.descripcion"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="15%"><bean:message key="busqueda.productos.precio.iva"/></th>
                    <!--<th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.importe"/></th>-->
                    <th scope="col" id="txt4" bgcolor="#373737" width="20%"><bean:message key="busqueda.productos.grupo"/></th>
                    <!-- <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.estado"/></th>    -->
                    <th scope="col" id="txt4" bgcolor="#373737" width="5%"></th>
                </tr>
           </table>
           <logic:present property="listaProductos" name="busquedaProductosForm">
                <div id="scrolling_articulos_buscar">
                <table width="100%" cellspacing="0">
                <logic:equal value="sin_productos" name="estado_lista" scope="session">
	                <tr>
	                	<td colspan="5" id="txt5" bgcolor="#c1c1c1" align="center">
	                		NO SE ENCONTRARON RESULTADOS
	                	</td>
	                </tr>
                </logic:equal>
                <logic:notEqual value="sin_productos" name="estado_lista" scope="session">
                <logic:iterate id="listaProductosId" property="listaProductos" name="busquedaProductosForm">
                        <tr >
                            
                                <bean:define id="codigo" type="String">
                                    <bean:write name="listaProductosId" property="cod_barra"/>
                                </bean:define>
                                
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="listaProductosId" property="cod_barra" /><html:hidden property="cod_barras" styleId="codigo_barras" value="${codigo}"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="50%"><bean:write name="listaProductosId" property="descripcion"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="25%"><bean:write name="listaProductosId" property="precio" format="$###,###.##" /></td>
                            <!--<td id="txt5" bgcolor="#c1c1c1" width="12%"><bean:write name="listaProductosId" property="importe"/></td>-->
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaProductosId" property="grupo"/></td>
                            <!--  
                            <td id="txt5" bgcolor="#c1c1c1" width="10%">
                            	<logic:equal value="0" property="estado" name="listaProductosId" ><bean:message key="venta.pedido.vendido"/></logic:equal>
                            	<logic:equal value="1" property="estado" name="listaProductosId" ><bean:message key="venta.pedido.liberado"/></logic:equal>
                            	<logic:equal value="2" property="estado" name="listaProductosId" ><bean:message key="venta.pedido.recepcionado"/></logic:equal>
                            </td>  -->
                            <td align="left" bgcolor="#c1c1c1" id="txt5" width="10%">
                            	<a class="agrega_pedido" data-value="${codigo}" href="javascript:void(0);">
      								<img src="images/add.png" width="15" height="15" border="0" title="Agregar Producto" />
    							</a>
                            </td>
                            
                        </tr>
                    </logic:iterate>
                    </logic:notEqual>
               </table> 
               </div> 
            </logic:present>
   <!-- tabla de seleccion graduacion -->
   			
   			<div id="blanket" style="display:none;"></div>
            <div id="seleccionGraduaciones" style="display:none; width: 600px">
            	
            	<table width="600" cellspacing="0" cellpadding="0">
        		<tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.fecha"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.numero"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OD_esfera"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OD_cilindro"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OD_eje"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OD_adicion"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OI_esfera"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OI_cilindro"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OI_eje"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.OI_adicion"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="10%"><bean:message key="busqueda.productos.graduaciones.Seleccionar"/></th>
                </tr>
           		</table>
           		<div id="scrolling_articulos_buscar" >
           		<logic:present property="listaGraduaciones" name="busquedaProductosForm">
            	<table width="600" cellspacing="0" >
                <logic:iterate id="listaGraduaciones" property="listaGraduaciones" name="busquedaProductosForm">
                        <tr >
                                <bean:define id="codigo" type="String">
                                    <bean:write name="listaGraduaciones" property="codigo"/>
                                </bean:define>
                                
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="fecha" /></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="numero"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OD_esfera" /></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OD_cilindro"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OD_eje"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OD_adicion"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OI_esfera" /></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OI_cilindro"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OI_eje"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="10%"><bean:write name="listaGraduaciones" property="OI_adicion"/></td>
                            <td align="left" bgcolor="#c1c1c1" id="txt5" width="10">
                            	<a href="#" onclick="javascript:seleccionaGraduacion('${codigo}','selecciona_graduacion');">
      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar Graduacion" />
    							</a>
                            </td>
                            
                        </tr>
                    </logic:iterate>
               </table> 
               </logic:present>
               </div>
 			<!-- tabla de seleccion graduacion -->    
            </div>
        </html:form>
    </body>
 <script type="text/javascript" src="js/jquery.cookie.js"></script>
 <script>    
    	var $q = jQuery.noConflict();	
    	var cont = 0;
    	var familia = $q("#familia option:selected").val();
    	$q(".agrega_pedido").on("click",function(){
    		var cod = $q(this).attr("data-value");
	    	$q.ajax({
					  type: "POST",
					  url: 'BusquedaProductos.do?method=tiene_suple',
					  dataType: "text",
					  data:"codigo_barras="+cod,
					  asycn:false,
					  success: function(data){
					  	if(cod != ""){	
				   		   seleccionaProducto(cod);
				   		   $q.cookie('codbarra',cod);
					   	   if(data == "true"){
					   	   		$q.cookie('seg_arm','2');
							    $q.cookie('cris_esp','1');
							    $q.cookie('cris_esp_seg','0');
					   	   }else{
						   		if(familia.indexOf("8") !=-1 ){  
						   			//alert(familia);
							    	$q.cookie('seg_arm','2');
							    	$q.cookie('cris_esp','2');
							    	$q.cookie('cris_esp_seg','0');
							    }else{				    	 
							    	 $q("#seg_cristal",window.parent.document).val("");
							    	 $q.cookie('seg_arm','0');
							    	 $q.cookie('cris_esp','0');
							    	 $q.cookie('cris_esp_seg','0');
							    }
						    }
			 			}				  			  							  											  												  		
				 	 }
			   });    	    	    	  		
    	  });
</script>   
</html:html>
