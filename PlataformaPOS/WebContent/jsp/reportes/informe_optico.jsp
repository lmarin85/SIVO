<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
<head>
<title><bean:message key="title.pos"/></title>
		<link href="css/estilos.css" rel="stylesheet" type="text/css" />
		<link href="css/formatosFormularios.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/reportes/informe_optico.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.min.js"></script>
        <script type="text/javascript" src="js/utils.js"></script>
		
<script type="text/javascript">
load();
	
       function imprimirListadoBoletas() {
		var voucher;
        voucher = window.open("<%=request.getContextPath()%>/CreaListadoOpticoServlet");    
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
        
</head>
<body>
<html:form action="/InformeOptico?method=buscar">
<html:hidden property="cdgCli" name="informeOpticoForm"  styleId="cliente" />
<table width="100%" cellspacing="0">
            <tr>
              	<td align="left" bgcolor="#373737" id="txt4" ><bean:message key="informe.optico.informe.optico"/></td> 
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#" onclick="validaBuscar();" id="enviar">
      						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar informe optico" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="imprimirListadoBoletas();">
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
				<td id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.cliente"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><html:text property="cliente" size="15" styleId="nombre" styleClass="fto"/>
					<a href="#" onclick="javascript:busqueda_cliente()">
      						<img src="images/lupa.png" width="15" height="15" border="0" >
    				</a></td>
				<!-- <td id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.graduacion"/></td>
				<td id="txt5" bgcolor="#c1c1c1"><select name="select"
					id="select">
						<option class="fto"><bean:message key="informe.optico.seleccionar.graduacion"/></option>
				</select></td> -->
			</tr>
		</table>
<br>
<table width="100%" cellspacing="0" cellpadding="0">
                <tr bgcolor="#66FFFF">
                    <td scope="col" id="txt4" bgcolor="#373737"><bean:message key="informe.optico.informe"/></td>
                </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="12%" bgcolor="#c1c1c1" id="txt5"><bean:message key="informe.optico.cliente"/></td>
    <td bgcolor="#c1c1c1" id="txt5">&nbsp;<bean:write name="informeOpticoForm" property="nombreCli"/></td>
    <td width="12%" bgcolor="#c1c1c1" id="txt5"><bean:message key="informe.optico.graduacion"/></td>
    <td width="15%" bgcolor="#c1c1c1" id="txt5">&nbsp;<bean:write name="informeOpticoForm" property="graduacionCli"/></td>
  </tr>
  <tr>
    <td  width="12%" id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.nombre"/></td>
    <td bgcolor="#c1c1c1" id="txt5">&nbsp;<bean:write name="informeOpticoForm" property="nombreCli"/></td>
    <td  width="12%" id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.fecha"/></td>
    <td width="15%" bgcolor="#c1c1c1" id="txt5">&nbsp;<bean:write name="informeOpticoForm" property="fechaNacCli"/></td>
  </tr>
  <tr>
    <td width="12%" id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.domicilio"/></td>
    <td bgcolor="#c1c1c1" id="txt5">&nbsp;<bean:write name="informeOpticoForm" property="domicilioCli"/></td>
    <td width="12%" id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.telefono"/></td>
    <td width="15%" bgcolor="#c1c1c1" id="txt5">&nbsp;<bean:write name="informeOpticoForm" property="telCli"/></td>
  </tr>
</table>
<br>

         <logic:present property="listaGraduaciones" name="informeOpticoForm">
             <div id="scrolling">
               		<logic:iterate id="graduacion" property="listaGraduaciones" name="informeOpticoForm">
                        <table width="100%" border="0" cellspacing="0">
						  <tr>
						    <td id="txt5"><bean:message key="informe.optico.fecha.detalle"/><bean:write name="graduacion" property="fechaGrad"/></td>
						    <td align="right" id="txt5"><bean:message key="informe.optico.realizado.por"/><bean:write name="graduacion" property="nombreDoc"/></td>
						  </tr>
						</table>
						<table cellspacing="1" width="100%" border="0">
							
						  <tr>
						    <td >&nbsp;</td>
						        <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.esfera"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.cilindro"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.eje"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.cerca"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.adicion"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.dn.pl"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.dn.pc"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.avsr"/></td>
							    <td  id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.avcc"/></td>
						  </tr>
						  <tr>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.o.d"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="esferaD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="cilindroD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="ejeD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="esferaCercaD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="adicionD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="distNPLejosD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="distNPCercaD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="avSinD"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="avConD"/></td>						   
						  </tr>
						  <tr>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.observacion"/></td>
						    <td colspan="9"><bean:write name="graduacion" property="observ"/></td>
						  </tr>
						  <tr>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:message key="informe.optico.o.i"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="esferaI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="cilindroI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="ejeI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="esferaCercaI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="adicionI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="distNPLejosI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="distNPCercaI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="avSinI"/></td>
						    <td id="txt5" bgcolor="#c1c1c1"><bean:write name="graduacion" property="avConI"/></td>
						  </tr>
						  <tr>
						    <td id="txt5" bgcolor="#c1c1c1" ><bean:message key="informe.optico.observacion"/></td>
						    <td  colspan="9"><bean:write name="graduacion" property="observ"/></td>
						  </tr>
						</table>
                    </logic:iterate>
               </div>
         </logic:present>
</html:form>
</body>
</html>