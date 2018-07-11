<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html:form action="/InformeBusquedaProducto?method=buscarArticulo">
<head>
<title><bean:message key="title.pos"/></title>

<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<script type="text/javascript" src="js/jquery.datepick-es.js"></script>

<script type="text/javascript">
		   	var $j = jQuery.noConflict();
		
			$j(function() {			
				$j('#fechaDesde').datepick({yearRange: '1900:-0'});	
			});
			
			$j(function() {			
				$j('#fechaHasta').datepick({yearRange: '1900:-0'});	
			});
			
		    function trimBusqueda(s){
				s = s.replace(/\s+/gi, ''); //sacar espacios repetidos dejando solo uno
				s = s.replace(/^\s+|\s+$/gi, ''); //sacar espacios blanco principio y final
				return s;
			}	   

		   function cerrar()
           {
           		parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
           }
           function hacer_busqueda(){
           		var codigoArticulo = document.getElementById("codigoArticulo").value;
           		var descripcionArticulo = document.getElementById("descripcionArticulo").value;
           		//var fechaDesde = document.getElementById("fechaDesde").value;
           		//var fechaHasta = document.getElementById("fechaHasta").value;
           		
           		codigoArticulo = trimBusqueda(codigoArticulo);
           		descripcionArticulo = trimBusqueda(descripcionArticulo);
           		
           		
           		
           		var buscar_cod=false;
           		var buscar_desc=false;
           		if("" != codigoArticulo){
           			buscar_cod=true;
           		}
           		if("" != descripcionArticulo){
           			buscar=true;
           			buscar_desc=true;
           		}
           		
           		if(buscar_cod){
           			
           			if(buscar_desc) {
           				var contador = descripcionArticulo.length;
						if(contador < 5){
	           				alert("La descripcion debe tener mínimo 5 carácteres ");	
		           		}else{
	           				document.forms[0].submit();
	           			}
					}
					else
					{
						alert("Debe  ingresar una descripcion valida");
					}
           		}else
           		{
           			alert("Debe  ingresar un codigo de producto");
           		}          		
           }
           
           function inicio_pagina_busqueda(){
           		var estadoPagina = document.getElementById("estadoPagina").value;
           		
           		if("ERROR_DIAS" == estadoPagina){
           			alert("La diferencia de fechas no puede superar a un mes");           			
           		}           		
           }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
</head>
<body onload="inicio_pagina_busqueda()" > 
<html:hidden property="estadoPagina" styleId="estadoPagina"/>
<table width="100%" cellspacing="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="busqueda.general.art.busqueda.art"/></td> 
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#" onclick="hacer_busqueda();">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar Productos">
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt1"><a
					href="#" onclick="cerrar()"> <img src="images/cancel.png" width="15"
						height="15" border="0" title="Cerrar"> </a></td>
              </tr>
              
     </table>
<table width="100%" border="0" cellspacing="1" align="center">
			<tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="busqueda.general.codigo.articulo"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text property="codigoArticulo"
						value="" styleClass="fto" styleId="codigoArticulo" /></td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="busqueda.general.descripcion"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text property="descripcionArticulo"  styleId="descripcionArticulo"  
						value="" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"/></td>
			</tr>
		  <!--  <tr>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="busqueda.general.codigo.fecha_desde"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text property="fechaDesde"
						styleClass="fto" styleId="fechaDesde"  readonly="true"  /></td>
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="busqueda.general.codigo.fecha_hasta"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text property="fechaHasta"  styleId="fechaHasta"  
						styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"  readonly="true" /></td>
			</tr>
		  --> 	
		</table>
		

         <logic:present property="listaBusquedaProducto" name="informeBusquedaProductoForm">
             <div id="scrolling">
            	
               
		
               		<logic:iterate id="articulos" property="listaBusquedaProducto" name="informeBusquedaProductoForm">
                    <table width="100%" cellspacing="0" cellpadding="0">
                    <tr >
                    	<td colspan="5">&nbsp;&nbsp;</td>
                    
                	</tr>
                	<tr bgcolor="#66FFFF">
                    	<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="busqueda.general.articulo"/></td>
                    	<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="busqueda.general.descripcion"/></td>
                    	<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="busqueda.general.familia"/></td>
                    	<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="busqueda.general.subfamilia"/></td>
                    	<td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="busqueda.general.grupo.familia"/></td>
                	</tr>
                        <tr bgcolor="#66FFFF">
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="codigoBarra"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="descripcion"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="familia"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="subFamilia"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulos" property="grupoFamilia"/></td>
                        </tr>
                       	<logic:present property="listaBusquedaProducto" name="articulos">  
                        	<tr bgcolor="#66FFFF">
                    			<td scope="col" id="txt4" bgcolor="#373737" >Precio</td>
                    			<td scope="col" id="txt4" bgcolor="#373737" >Precio Iva</td>
                    			<td scope="col" id="txt4" bgcolor="#373737" colspan="4">Tarifa</td>
                			</tr>
                        	<logic:iterate id="articulo" name="articulos" property="listaBusquedaProducto">
                        		<tr bgcolor="#66FFFF">
                            		<td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulo" property="precio"/></td>
                            		<td id="txt5" bgcolor="#c1c1c1" ><bean:write name="articulo" property="precioIva"/></td>
                            		<td id="txt5" bgcolor="#c1c1c1" colspan="4"><bean:write name="articulo" property="tarifa"/></td>
                           		</tr>
                    		</logic:iterate>
                    	</logic:present>
                   
                    </table>
                     </logic:iterate>
               </div>
         </logic:present>
</body>
</html:form>