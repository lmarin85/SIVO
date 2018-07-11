<%-- 
    Document   : busqueda_productos_multioferta
    Created on : 29-ago-2014, 13:00
    Author     : LMARIN 
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
   <html:form action="/BusquedaProductos?method=busquedaMultiofertaAsoc&accion=ped" styleId="busqueda" >
    <input type="hidden" value='<bean:write name="busqueda_avanzada" scope="session"/>' id="busqueda_avanzada"> 
    <input type="hidden" value='<bean:write name="busqueda_avanzada_lentilla" scope="session"/>' id="busqueda_avanzada_lentilla">
    
           
    <table width="100%" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4">Multiofertas Asociadas</td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Productos"> 
				</a>
      		</td>
    	</tr>
   	</table>    
    <br>    
    <table width="100%" cellspacing="0" cellpadding="0">
        		<tr id="thead">
                    <th scope="col" id="txt4" bgcolor="#373737" width="15%"><bean:message key="busqueda.productos.articulo"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="45"><bean:message key="busqueda.productos.descripcion"/></th>
                    <th scope="col" id="txt4" bgcolor="#373737" width="5%"></th>
                </tr>
           </table>
           <logic:present property="listaMultioferta" name="busquedaProductosForm">
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
                <logic:iterate id="listaProductosId" property="listaMultioferta" name="busquedaProductosForm">
                       <tr >
                            <bean:define id="codigo_ar" type="String">
                                <bean:write name="listaProductosId" property="codigo"/>
                            </bean:define>
                            <bean:define id="codigo_barra" type="String">
                                <bean:write name="listaProductosId" property="cod_barra"/>
                            </bean:define>
                                                
                            <td id="txt5" bgcolor="#c1c1c1" width="15%"><bean:write name="listaProductosId" property="cod_barra" /></td>
                            <td id="txt5" bgcolor="#c1c1c1" width="50%"><bean:write name="listaProductosId" property="descripcion"/></td>
                                  
                            <td align="left" bgcolor="#c1c1c1" id="txt5" width="10%">
                            	<a class="agrega_pedido" data-multi="${codigo_ar}" data-barra="${codigo_barra}" href="javascript:void(0);">
      								<img src="images/add.png" width="15" height="15" border="0" title="Agregar Producto" />
    							</a>
                            </td>
                            
                        </tr>
                    </logic:iterate>
                    </logic:notEqual>
               </table> 
               </div> 
            </logic:present>
   
     
            
        </html:form>
    </body>
   	<script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script type="text/javascript">
    	var $j = jQuery.noConflict();
    	
    	
    	$j(".agrega_pedido").on("click",function(){
   		    var codmulti = $j(this).attr("data-multi");
   		    var codbarra = $j(this).attr("data-barra");
   		   
   		    $j("#accion",window.parent.document).val("agregarProducto");
   		    $j("#productoSeleccionado",window.parent.document).val(codbarra); 
   		    $j("#codigo_mult",window.parent.document).val(codmulti);
   		    $j("#index_multi",window.parent.document).val(1); 
   		    $j("#cantidad",window.parent.document).val(1); 
   		    window.parent.document.ventaPedidoForm.submit();
   		    $j.cookie("carga_multioferta","777");
   		    $j.cookie("nueva_multioferta","777");
   		   	$j.cookie("borra_prod_multioferta_1","777");
   		   	$j.cookie("borra_prod_multioferta_2","777");
   		    window.parent.hidePopWin(true);		     		   	    
   		   
   		    //seleccionaProducto(cod);
    	});    	
    </script>
    
</html:html>
