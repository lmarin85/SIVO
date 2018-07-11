<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/estilos.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script type="text/javascript" src="js/venta/convenios.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
		
		<script type="text/javascript">
			document.oncontextmenu=inhabilitar;	
			function inhabilitar(){return false;}
			var $j = jQuery.noConflict();
			
			var returnVal = "";
			
			function seleccionaDescuento(indice)
			{
				document.getElementById('indice').value = indice;
				document.getElementById('accion').value = 'desplegar_familias';
         		document.forms[0].submit();
			}
			
			function seleccionar_descuento()
			{
		   		var fpago = document.busquedaConveniosForm.sel_fpago.value;
		   		var dto = document.busquedaConveniosForm.sel_dto.value;
		   		var convenio = document.busquedaConveniosForm.sel_convenio.value;
		   		var convenio_det = document.busquedaConveniosForm.sel_convenio_det.value;
		   		var convenio_ln = document.busquedaConveniosForm.sel_convenioln_ident.value;
		   		
		   		if (fpago != "") {
		   			if($j("#convenio",window.parent.document).val()=="50436"
		   				|| $j("#convenio",window.parent.document).val()=="50437"
		   				|| $j("#convenio",window.parent.document).val()=="50438"
		   				|| $j("#convenio",window.parent.document).val()=="50439"
		   				|| $j("#convenio",window.parent.document).val()=="50440"
		   				|| $j("#convenio",window.parent.document).val()=="50441"
		   				|| $j("#convenio",window.parent.document).val()=="50487"
		   				
		   		 	){
		   				$j.cookie("des_seg_armazon","777");
		   				returnVal = new Array(fpago, "0", convenio, convenio_det, convenio_ln);	   				
		   				window.parent.hidePopWin(true);
		   			}else if($j("#convenio",window.parent.document).val()=="50620"){
		   				
		   				var trio = new Array();  
				  		$j("#contenido tr",window.parent.document).each(function(a){
							var familia  = 	$j(this).find("td > a").attr("data-familia");
							var grupo    = 	$j(this).find("td > a").attr("data-grupo");

						    if((familia == "M" ||  familia == "C" ) && grupo != "0" ){
						    	trio[a] = familia; 
						    	a++;
						    }    			        			   	 		   		
				    	});
				  		var sor_trio = trio.sort();
				  		if(sor_trio.length == 3){
			 		  		var trio_temp = sor_trio[0]+sor_trio[1]+sor_trio[2];
			 		  		if(trio_temp="CCM"){
			 		  			$j.cookie("des_seg_armazon","0");
				   				returnVal = new Array(fpago, dto, convenio, convenio_det, convenio_ln);
			            		window.parent.hidePopWin(true);
			 		  		}
				  		}else{
				  			alert("Problema al aplicar el convenio, solo es aplicable a un trio por encargo.");
				  		}
		   			}else{
		   				$j.cookie("des_seg_armazon","0");
		   				returnVal = new Array(fpago, dto, convenio, convenio_det, convenio_ln);
	            		window.parent.hidePopWin(true);
		   			}				
				}
				else
				{
					alert("Debe seleccionar un descuento")
				}
				
			}
		</script>
        
       <title><bean:message key="title.pos"/></title>
       

    </head>
	<body onload="javascript: if(history.length>0)history.go(+1)">
    
        <html:form action="/BusquedaConvenios?method=selecciona_convenio" styleId="selecciona" >
            <html:hidden property="accion" styleId="accion" value="" name="busquedaConveniosForm"/>
            <html:hidden property="indice" styleId="indice" name="busquedaConveniosForm"/>
            <html:hidden property="sel_fpago" name="busquedaConveniosForm"/>
            <html:hidden property="sel_dto" name="busquedaConveniosForm"/>
            <html:hidden property="sel_convenio" name="busquedaConveniosForm"/>
            <html:hidden property="sel_convenio_det" name="busquedaConveniosForm"/>
            <html:hidden property="sel_convenioln_ident" name="busquedaConveniosForm"/>
            
            
    <table width="600px" cellspacing="0">
    	<tr>
      		<td align="left" bgcolor="#373737" id="txt4"><bean:message key="busqueda.convenios.descuentos"/></td>
      		<td bgcolor="#373737" id="txt4" align="right">
      			<a href="#" onclick="window.parent.hidePopWin(false);"> 
						<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar Busqueda de Convenios"> 
				</a>
      		</td>
    	</tr>
    </table>
    <table width="600px" >
    	<tr height="80px" bgcolor="#c1c1c1">
      		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			<table width="350px" cellspacing="0">
      				<tr id="thead">
                    	<th scope="col" id="txt4" bgcolor="#373737" width="50px" align="left">
                    		<bean:message key="busqueda.convenio.fpago"/>
      					</th>
      					<th scope="col" id="txt4"  bgcolor="#373737" width="170px" align="left">
      						<bean:message key="busqueda.convenio.descripcion"/>
      					</th>
      					<th scope="col" id="txt4" bgcolor="#373737" width="50" align="left">
      						<p class="valordto"><bean:message key="busqueda.convenio.dto"/></p>
      					</th>
      					<th scope="col" id="txt4" bgcolor="#373737" width="50" align="left">
      						<bean:message key="busqueda.convenio.seleccionar"/>
      					</th>
      					<th scope="col" id="txt4" bgcolor="#373737" width="30"  align="left">
      					</th>
      				</tr>
      			</table>
      			<div id="scrolling_convenios">
      			<logic:present property="lista_formas_pago" name="busquedaConveniosForm">
                <table width="320px" cellspacing="0" id="contenido">
                <logic:empty property="lista_formas_pago" name="busquedaConveniosForm">
	                <tr>
	                	<td colspan="4" id="txt5" bgcolor="#c1c1c1" align="center">
	                		<bean:message key="busqueda.convenio.mensaje.error"/>
	                	</td>
	                </tr>
                </logic:empty>
                <logic:notEmpty property="lista_formas_pago" name="busquedaConveniosForm">
                <logic:iterate id="lista_fpago_id" property="lista_formas_pago" name="busquedaConveniosForm" indexId="indice">
                        <bean:define id="dto" type="String">
                    		<bean:write name="lista_fpago_id" property="dto"/>
                   		</bean:define>  
                   	
                        <tr id="${indice}">
	                        <td id="txt5" bgcolor="#c1c1c1" width="50px" align="left">
	                        	<bean:write name="lista_fpago_id" property="forma_pago"/>
	      					</td>
	      					<td id="txt5" bgcolor="#c1c1c1" width="170px" align="left">
	      						<bean:write name="lista_fpago_id" property="forma_pago_desc"/>
	      					</td>
	      					<td id="txt5" bgcolor="#c1c1c1" width="50" align="left">
	      						<p class="pdto"><bean:write name="lista_fpago_id" property="dto"/></p>
	      					</td>
	      					<td id="txt5" bgcolor="#c1c1c1" align="center" width="50">
	      						<a href="#" class="des_sel" data-indice="${indice}" data-dto="${dto}">
      								<img src="images/add.png" width="15" height="15" border="0" title="Seleccionar"/>
    							</a>
	      					</td>
	                    </tr>
               </logic:iterate>
               </logic:notEmpty>
               </table> 
               </logic:present>
               </div> 
       		</td>
       		<td align="left" bgcolor="#c1c1c1" id="txt5">
      			<table width="240px" cellspacing="0">
      				<tr id="thead">
      					<th scope="col" id="txt4" bgcolor="#373737" width="70" align="left">
      						<bean:message key="busqueda.convenio.familia"/>
      					</th>
      					<th scope="col" id="txt4" bgcolor="#373737" width="70" align="left">
      						<bean:message key="busqueda.convenio.subfamilia"/>
      					</th>
      					<th scope="col" id="txt4" bgcolor="#373737" width="70" align="left">
      						<bean:message key="busqueda.convenio.grupofamilia"/>
      					</th>
      					<th scope="col" id="txt4" bgcolor="#373737" width="30"  align="left">
      					</th>
      				</tr>
      			</table>
      			<div id="scrolling_convenios">
      			<logic:present property="lista_formas_pago_familias" name="busquedaConveniosForm">
                <table width="220px" cellspacing="0">
                <logic:notEmpty property="lista_formas_pago_familias" name="busquedaConveniosForm">
                <logic:iterate id="lista_fpago_familias_id" property="lista_formas_pago_familias" name="busquedaConveniosForm">
                        <tr>
	                        <td id="txt5" bgcolor="#c1c1c1" width="70" align="left">
	                        	<bean:write name="lista_fpago_familias_id" property="familia"/>
	      					</td>
	      					<td id="txt5" bgcolor="#c1c1c1" width="70" align="left">
	      						<bean:write name="lista_fpago_familias_id" property="subfamilia"/>
	      					</td>
	      					<td id="txt5" bgcolor="#c1c1c1" width="70" align="left">
	      						<bean:write name="lista_fpago_familias_id" property="grupofamilia"/>
	      					</td>
	                    </tr>
               </logic:iterate>
               </logic:notEmpty>
               </table> 
               </logic:present>
                </div> 
       		</td>
      	</tr>
      	<tr height="50">
      		<td id="txt5" bgcolor="#c1c1c1" colspan="2" align="center">
      			<bean:message key="busqueda.convenio.seleccion"/>
      			<bean:write property="sel_fpago" name="busquedaConveniosForm"/> &nbsp&nbsp
      			<bean:write property="sel_dto"  name="busquedaConveniosForm"/>&nbsp;<span class="dtofin">%</span> &nbsp&nbsp
              		<a href="#" onclick="seleccionar_descuento()">
      						<img src="images/check.png" width="15" height="15" border="0" title="Seleccionar">
    				</a>
    				&nbsp&nbsp&nbsp&nbsp
    				<a href="#" onclick="window.parent.hidePopWin(false);">
      						<img src="images/cancel.png" width="15" height="15" border="0"title="Cancelar" >
    				</a>
    		</td>
      	</tr>
    </table>
  </html:form>
  <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script>
  	 /*SE CAMBIA EL HTML 20141015 LMARIN DTO SEG ARMAZON DE MENOR VALOR
  	 CAMBIO ICONOS DTO MONTO DE DINERO*/
  	 var valordto = $.trim($(".pdto").html());
  	 if( valordto.length > 3 ){
	  	 $(".valordto").html("($) Dto");
	  	 $(".dtofin").html("pesos");
  	 }
  	 /*Asigno descuentos*/
  	 $(".des_sel").on("click",function(){  	 
  	 		$.cookie("val_dto_con",$(this).attr("data-dto"));
  	 		  	 	
  	 		seleccionaDescuento($(this).attr("data-indice"));  	 	    	 			  
  	 });  	
   </script>
 </body>
</html:html>
