<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/subModal.css" />
<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/subModal.js"></script>				
<title>autorizador_descuento</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<table width="200" cellspacing="0" align="center"> 
	<tr>
		<td colspan="1" bgcolor="#373737" id="txt4">Validador de Descuento</td>
		<td colspan="1" bgcolor="#373737" id="txt4" align="right">
			<a id="cerrar" href="#" > 
				<img src="images/cancel.png" width="14" height="14" border="0"> 
			</a>
		</td>		
	</tr>
</table>
<table width="200" cellspacing="0" align="center""> 
	<tr class="txt">
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			 <p>Rut Cliente:</p>
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<input type="text" name="rut_val" value="" Class="fto num" size="15" id="rut_val" maxlength="10" />
		</td>
	</tr>		
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" align="right" colspan="2">
			<a href="#" onclick="" id="enviar"> 
				<img src="images/check.png" width="15" height="15" border="0" title="Validar" />
			</a>
		</td>
	</tr>
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" align="left" colspan="2">(*) Rut con guión. </td>
	</tr>
</table>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script>	
	$(".num").on('keypress',function(e){  k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9-]/;n = String.fromCharCode(k);return patron.test(n);}); 
    
	$("#enviar").on("click",function(){
	
		var rut_f1  = $.trim($('#rut_val').val());  
		var rut_f2  =  rut_f1.split("-");
		var rut_val =  rut_f2[0] != "" ? rut_f2[0] :"-1";
		
	 	var convenio = $.trim($('#convenio',window.parent.document).val());
		
			
			if(rut_val !="-1" ){
			 		$.ajax({
						  type: "POST",
						  url: "<%=request.getContextPath()%>/SeleccionPago.do?method=validaDtoCliente",
						  dataType: "text",
						  data:"cliente_dto="+rut_val+"&codigo_convenio="+convenio,
						  asycn:false,
						  success: function(data){
							  	  switch(data){					  	 
									  	 case "0":
									  	 	   alert("El cliente no existe.");
									  	 	   $.cookie("rut_val","");
									  	 break;
								  	 	 case "1":	
								  	 	 	   alert("El cliente ya utilizó su DTO.");
									  	 	   $.cookie("rut_val","");
									  	 break;							 					  	 	 												
									  	 break;	
									  	 case "2":	
								  	 	 	   $('#cliente_dto',window.parent.document).val(rut_val);									  	 	 	  
								  	 	 	   window.parent.ingresa_pedido();	
								  	 	 	   $.cookie("abre_convenio",rut_val);							 					  	 	 												
									  	 break;	
									  	 case "3":	
								  	 	 	   alert("El convenio no se encuentra activo.");
									  	 	   $.cookie("rut_val","");						 					  	 	 												
									  	 break;	
									  	 default:
									  	 	 $.cookie("rut_val","");
									  	 break;
							  	   }								  												  		
					 	  }
				 	});
			}else{
				alert("El rut es obligatorio.");
			}
		
	});	
	$("#cerrar").on("click",function(){
		alert("Debes Ingresar un cliente valido para aplicar este convenio");
		window.parent.hidePopWin(true);
		window.parent.elimina_convenio_sel();
		window.parent.hidePopWin(true);		
	});
</script>
</body>
</html>