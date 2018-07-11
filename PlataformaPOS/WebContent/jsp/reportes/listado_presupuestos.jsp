<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        
        <link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script language="javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/reportes/listado_presupuestos.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/jquery.datepick.js""></script>
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
		
		
		
<title><bean:message key="title.pos"/></title>
<script type="text/javascript">
			var $j = jQuery.noConflict();
		
			$j(function() {
			$j('#popupDatepicker').datepick();
			});
			
			$j(function() {
			$j('#popupDatepicker2').datepick();
			});
			
			
			load();
           function imprimirlistadoPresupuesto(){
           		var voucher;
        		voucher = window.open("<%=request.getContextPath()%>/CreaListadoPresupuestosServlet"); 
           }
           function cerrar()
           {
           		parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
           }
			
			function busqueda_cliente()
			{			
				
				showPopWin("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes&pagina=pedido", 714, 425,cargaClientePedido, false);
			   	//window.open("<%=request.getContextPath()%>/BusquedaClientes.do?method=cargaBusquedaClientes","popup","width=800, height=400,location=no,top=100,left=120");
			
			}

        </script>


</head>
<body>

	<html:form action="/ListadoPresupuestos?method=buscar">
	<html:hidden property="cliente" value="" styleClass="fto"/>
	<table width="100%" cellspacing="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="listado.presupuesto.listado.presupuesto"/></td> 
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#" onclick="validaBuscar()" id="enviar">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar lista de presupuesto" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="imprimirlistadoPresupuesto()">
      						<img src="images/printer.png" width="15" height="15" border="0" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt1"><a
					href="#" onclick="cerrar()"> <img src="images/cancel.png" width="15"
						height="15" border="0" title="Cerrar"> </a></td>
              </tr>
     </table>
            
		<table width="100%" border="0" cellspacing="1">
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.codigo"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><html:text property="codigo" value="" styleClass="fto" styleId="codigo" /></td>
		    <!--  <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.agente"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" >
		    	<select name="select" id="select">
			      <option class="fto"><bean:message key="listado.presupuesto.seleccionar.agente"/></option>
			     </select>
		    </td>-->
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.divisa"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" >
		    	<html:select property="divisa" styleClass="fto" style="width:150px;"> 
                        <html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection  property="listaDivisas" label="descripcion" value="id" />
                    </html:select>
		     <td id="txt5" bgcolor="#c1c1c1" ></td>
		     <td id="txt5" bgcolor="#c1c1c1" ></td>
		  </tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.fechaIni"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><html:text property="fechaInicio" value="" styleClass="fto" styleId="popupDatepicker" readonly="true"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.fechaTermino"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><html:text property="fechaTermino" value="" styleClass="fto"  styleId="popupDatepicker2" readonly="true"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.cerrado"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" >
		    	<html:select property="cerrado" value="" styleClass="fto">
		    		<html:option value="0"><bean:message key="venta.pedido.seleccione"/></html:option>
		    		<html:option value="N"><bean:message key="listado.presupuesto.no"/></html:option>
		    		<html:option value="S"><bean:message key="listado.presupuesto.si"/></html:option>
		    	</html:select>
		    </td>
		     </tr>
		  <tr>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.cliente"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><input type="text" Class="fto" id="nombre" name="nombre" value=""/>
		    	<a href="#" onclick="javascript:busqueda_cliente()">
      						<img src="images/lupa.png" width="15" height="15" border="0" >
    			</a>
		    </td>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.listado.detallado"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><input type="checkbox"></td>
		    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="listado.presupuesto.forma.pago"/></td>
		    <td id="txt5" bgcolor="#c1c1c1" >
		    	<html:select property="forma_pago" styleClass="fto" style="width:150px;"> 
                        <html:option value="0" ><bean:message key="venta.pedido.seleccione"/></html:option>
                        <html:optionsCollection  property="listaFormasPago" label="descripcion" value="id" />
                </html:select>
		    </td>
		  </tr>
		  <tr>
		  	
		  </tr>
		</table>

<br>
<div id="scrolling">
                <table width="100%" cellspacing="0" cellpadding="0">
                   
                <logic:present property="listaPresupuestos" name="listadoPresupuestosForm">
                
                     <tr bgcolor="#66FFFF">
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.numero"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.fecha.emision"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.agente"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.nombres"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.apellidos"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.importe"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.pocentaje.descuento"/></td>
                    <td scope="col" id="txt4" bgcolor="#373737" ><bean:message key="listado.presupuesto.forma.pago"/></td>
                </tr>
                  <tr>
                  				<td scope="col" id="txt4" bgcolor="#373737"></td>
                             	<td scope="col" id="txt4" bgcolor="#373737">Articulo</td>
                             	<td scope="col" id="txt4" bgcolor="#373737">Descripción</td>
                             	<td scope="col" id="txt4" bgcolor="#373737">Cantidad</td>
                             	<td scope="col" id="txt4" bgcolor="#373737">Precio</td>
                             	<td scope="col" id="txt4" bgcolor="#373737" colspan="3" align="center">% Dto</td>
                          </tr>
               		<logic:iterate id="presupuestos" property="listaPresupuestos" name="listadoPresupuestosForm">
                        <tr bgcolor="#66FFFF">
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="numero"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="fecha"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="agente"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="nombres"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="apellido"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="importe"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="descuento"/></td>
                            <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="presupuestos" property="forma_pago"/></td>
                      </tr>
                   
                      <tr>
                    		<td id="txt5" bgcolor="#c1c1c1" colspan="8">________________________________________________________________________________________________________________________________________________</td>
                      </tr>
                      <tr>
                      		<td id="txt5" bgcolor="#c1c1c1" colspan="8">&nbsp;</td>
                      </tr>
                       <logic:present property="lineas" name="presupuestos">
                        <logic:iterate id="linea" property="lineas" name="presupuestos">
                         	
                             <tr>
                             	<td id="txt5" bgcolor="#c1c1c1"></td>
                        	    <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="linea" property="codigoBarra"/></td>
                        	    <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="linea" property="descripcion"/></td>
                        	    <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="linea" property="cantidad"/></td>
                        	    <td id="txt5" bgcolor="#c1c1c1" ><bean:write name="linea" property="precioIva"/></td>
                        	    <td id="txt5" bgcolor="#c1c1c1" colspan="3" align="center"><bean:write name="linea" property="descuento"/></td>
                             </tr>
                        </logic:iterate>
                        </logic:present>
                       <tr>
                        	<td id="txt5" bgcolor="#c1c1c1" colspan="8"></td>
                        </tr>
                        <tr>
                        	<td id="txt5" bgcolor="#c1c1c1" colspan="4"></td>
                        	<td id="txt5" bgcolor="#c1c1c1" colspan="4"><bean:write name="presupuestos" property="total"/></td>
                        </tr>
                    </logic:iterate>
                    </table>
                    </div>
                    </logic:present>
</html:form>
</body>
</html:html>