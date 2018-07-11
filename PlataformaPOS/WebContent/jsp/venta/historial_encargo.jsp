<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>antiguo_encargo</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/subModal.js"></script>
	<script language="javascript" src="js/utils.js"></script>		
</head>
<body>
	<html:form action="/VentaPedido?method=historial_encargo" styleId="adicionales">
	        <table width="100%" cellspacing="0">
		         <tr>
		           	<td align="left" bgcolor="#373737" id="txt4" rowSpan="1" colSpan="1" >Historial Encargo</td> 	        
		  			<td width="30" align="right" bgcolor="#373737" id="txt1">
		  					<a id="cerrar" href="javascript:void(0)"> 
		  					<img src="images/cancel.png" width="15" height="15" border="0" title="Cerrar"> </a>
					</td>
		         </tr>
	   		 </table>	    	
	        <table width="400px" cellspacing="1">    	
		    	<tr bgcolor="#c1c1c1">
					<td align="left" bgcolor="#c1c1c1" id="txt5" rowSpan="1" colSpan="1" width="50%">
						<p>Encargo origen:</p>					
					</td>
					<td align="left" bgcolor="#c1c1c1" id="txt5" rowSpan="1" colSpan="1" width="50%">
						<html:text property="encargo_padre" name="ventaPedidoForm" styleId="encargo_padre" styleClass="num"></html:text>					
						<a id="buscar_grupos" href="javascript:void(0)">
	  						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar grupos encargo" >							
						</a>
					</td>	
						
				<tr>
				<tr bbgcolor="#c1c1c1">
					<td align="left" bgcolor="#c1c1c1" id="txt5" rowSpan="1" colSpan="1" width="50%">
						<p>Grupo encargo:</p>					
					</td>	
					<td align="left" bgcolor="#c1c1c1" id="txt5" rowSpan="1" colSpan="1" width="50%">
						<html:select property="grupo" styleId="grupo" name="ventaPedidoForm" styleClass="fto" >
							<logic:empty property="listaGrupos" name="ventaPedidoForm">  	             
								<html:option value="-1" ><bean:message key="venta.pedido.seleccione"/></html:option>
							</logic:empty> 
	                    	<logic:notEmpty property="listaGrupos" name="ventaPedidoForm">  	                    		                       	                    
	            				<html:optionsCollection name="ventaPedidoForm" property="listaGrupos" label="grupo" value="grupo" />
	            			</logic:notEmpty>                
                    	</html:select>
					</td>
				</tr>
		    	<tr>
					<td align="left" bgcolor="#c1c1c1" id="txt5" width="100%" colspan="2">   			
						<input type="button" id="agregar" value="Agregar" >
					</td>		
		    	</tr>
	        </table>
     </html:form>
</body>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>	
<script>
	
	
	$("#agregar").on('click',function(){
		var encval = $("#encargo_padre").val();		
		$.ajax({
			  type: "POST",
			  url: 'VentaPedido.do?method=valida_ped_ex&accion=validar_encargo',
			  dataType: "text",
			  data:"encargo_padre="+encval,
			  asycn:false,
			  success: function(data){
			  		switch(data){
			  			case "1":
			  				if($("#encargo_padre").val() !="" || $("#encargo_padre").length >= 9){
								if($("#grupo").val() !='-1'){
  						    		window.location.href ='<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedido&grupoSing='+$("#grupo").val();
  						    		window.parent.hidePopWin(true);
	  						    }else{
									alert('Debes seleccionar un grupo.');
								}
							}else{
								alert("No es un numero de encargo valido.");
							}	  				
			  			break;
			  			case "2":
			  				alert('Encargo no valido (Encargo No corresponde al mismo cliente).');
			  			break;
			  			case "3":
							alert('El encargo asociado no está entregado a cliente.');
						break;
			  			default:
			  				alert('Encargo no valido.');
			  			break;
			  		}
			  }
		  });							
	});
	$('#buscar_grupos').on('click',function(){
		var encval = $("#encargo_padre").val();	
		if($("#encargo_padre").val() !="" || $("#encargo_padre").length >= 9){
				$.ajax({
				  type: "POST",
				  url: 'VentaPedido.do?method=valida_ped_ex&accion=validar_encargo',
				  dataType: "text",
				  data:"encargo_padre="+encval,
				  asycn:false,
				  success: function(data){
			  		switch(data){
			  			case "1":
							window.location.href ='<%=request.getContextPath()%>/VentaPedido.do?method=historial_encargo&accion=carga_grupos&encargo_padre='+$('#encargo_padre').val();
							$('.seguro',window.parent.document).css('display','none').attr('disabled','disabled');	
							
						break;
						case "2":
							alert('Encargo no valido (Encargo No corresponde al mismo cliente).');
						break;
						case "3":
							alert('El encargo asociado no está entregado a cliente.');
						break;
						default:
							alert('Encargo no valido.');
						break;
					}
			    }
		 	});
		 }else{
			alert("No es un numero de encargo valido.");
		 }	  	
	    //$('#grupo').attr('enabled',true);
	});		
	
	$("#cerrar").live("click",function(){
		var r=confirm("No deseas asociar un encargo de origen a esta venta?");
		if (r==true)
		{
		  	window.parent.hidePopWin(false);
 			window.parent.document.location = '<%=request.getContextPath()%>/VentaPedido.do?method=nuevoFormulario';
			$('.seguro',window.parent.document).css('display','none').attr('disabled','disabled');	
 			
		}		
	});
	
    $(".num").on('keypress',function(e){k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9/SV]/;n = String.fromCharCode(k);return patron.test(n);});
	
</script>
</html:html>