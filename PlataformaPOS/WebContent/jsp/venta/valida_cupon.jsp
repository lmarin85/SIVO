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
<title>Validador Cupon</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<table width="280" height="25" cellspacing="0" align="center"> 
	<tr>
		<td colspan="1" bgcolor="#373737" id="txt4">Ingresa  Cupon</td>
		<td colspan="1" bgcolor="#373737" id="txt4" align="right">
			<a id="cerrar" href="#" > 
				<img src="images/cancel.png" width="14" height="14" border="0"> 
			</a>
		</td>		
	</tr>
</table>
<table width="280" height="65" cellspacing="0" align="center""> 
	<tr class="txt">
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			 <p>N° Cupon:</p>
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<input type="text" name="cupon" value="" Class="fto num" size="15" id="cupon" maxlength="50" />
		</td>
	</tr>		
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" align="right" colspan="2">
			<a href="#" onclick="" id="enviar"> 
				<img src="images/check.png" width="15" height="15" border="0" title="Validar" />
			</a>
		</td>
	</tr>

</table>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script>	
    
	$("#enviar").on("click",function(){
		$("#contenido tr",window.parent.document).each(function(a){
	      	   var dto = $(this).find("td > #descuento_"+a);
	          // console.log(" DTO  ===>"+dto);
	    });
		var cupon =$.trim($("#cupon").val());
		var nif =$.trim($("#nif",window.parent.document).val());
		
		
		var trio = new Array();  
  		$("#contenido tr",window.parent.document).each(function(a){
			var familia  = 	$(this).find("td > a").attr("data-familia");
			var grupo    = 	$(this).find("td > a").attr("data-grupo");

		    if((familia == "M" ||  familia == "C" || familia == "G")){
		    	trio[a] = familia; 
		    	a++;
		    }    			        			   	 		   		
    	});
  		var sor_trio = trio.sort();
  		
  		if(cupon !="" ){
	  			$.ajax({
					  type: "POST",
					  url: "<%=request.getContextPath()%>/VentaPedido.do?method=valida_cupon",
					  dataType: "text",
					  data:"numero_cupon="+cupon+"&nif="+nif+"&cdg="+$.("#cdg",window.parent.document).val(),
					  asycn:false,
					  success: function(data){
						  var datos = data.split("_");
						  if(datos[1] != "0"){
						  
							  if(sor_trio.length == 3 || sor_trio.length == 1 ){
						  		var trio_temp = sor_trio[0]+sor_trio[1]+sor_trio[2];
						  		if(sor_trio.length == 3){
						  			if(trio_temp == "CCM"){
						  				switch(datos[0]){					  	 
										  	 	 case "1":	
										  	 		var r = confirm("Deseas confirmar el uso del cupon ? \n (Recuerda que al confirmar el cupon ya no podra ser utilizado.)");
										  	 	    if (r == true) {
											  	 	     $('#numero_cupon',window.parent.document).val(cupon);
														 $.cookie("cupon",cupon);
														 window.parent.postValida_cupon();
										  	 	    } else {
										  	 	    	window.parent.hidePopWin(true);		
										  	 	    }
											  	 	
											  	 break;		
										  	 	 case "2":	
										  	 	 	   alert("El cupon ya no se encuentra vigente.");
											  	 	   $.cookie("cupon","");						 					  	 	 												
											  	 break;	
											  	 case "3":	
											  		  alert("El cupon ya fue utilizado, no es posible volver a utilizarlo.");
											  	 	  $.cookie("cupon","");					 					  	 	 												
											  	 break;	
											  	
											  	 case "4":	
										  	 	 	   alert("El cupon no es valido.");
											  	 	   $.cookie("cupon","");						 					  	 	 												
											  	 break;	
											  	 case "5":	
											  		var r = confirm(" El monto disponible para descuento es de : $"+datos[1]+" pesos \n Deseas confirmar el uso del cupon ? \n (Recuerda que al confirmar el cupon ya no podra ser utilizado.)");
										  	 	    if (r == true) {
											  	 	     $('#numero_cupon',window.parent.document).val(cupon);
														 $.cookie("cupon",cupon);
														 window.parent.postValida_cupon();
										  	 	    } else {
										  	 	    	window.parent.hidePopWin(true);		
										  	 	    }						 					  	 	 												
											  	 break;	
											  	 case "6":	
											  		   alert("El beneficio optico ya fue utilizado, no es posible realizar el descuento.");
											  	 	   $.cookie("cupon","");	
											  	 break;
											  	 case "7":	
											  		   alert("El beneficio optico ya fue utilizado, no es posible realizar el descuento.");
											  	 	   $.cookie("cupon","");	
											  	 break;
											  	 case "8":	
											  		   alert("El beneficio optico ya fue utilizado, no es posible realizar el descuento.");
											  	 	   $.cookie("cupon","");	
											  	 break;
											  	 case "100":	
											  		   alert("No es posible aplicar el cupon, el encargo ya posee un cupon asociado.");
											  	 	   $.cookie("cupon","");		
											  	 break;
											  	 default:
												  	   alert("Error , favor contactarse con MDA");
												  	   $.cookie("cupon","");
											  	 break;
									    }
						  			}else{
						  				alert("El encargo no corresponde a un trio optico valido, no se puede aplicar el cupon de descuento.");
						  			}
						  		}else{
						  			 var trio_temp = sor_trio[0];	
						  			 if(sor_trio.length==1 && trio_temp =="G"){
								  		switch(datos[0]){					  	 
									  	 	 case "1":	
									  	 		var r = confirm("Deseas confirmar el uso del cupon ? \n (Recuerda que al confirmar el cupon ya no podra ser utilizado.)");
									  	 	    if (r == true) {
										  	 	     $('#numero_cupon',window.parent.document).val(cupon);
													 $.cookie("cupon",cupon);
													 window.parent.postValida_cupon();
									  	 	    } else {
									  	 	    	window.parent.hidePopWin(true);		
									  	 	    }
										  	 	
										  	 break;		
									  	 	 case "2":	
									  	 	 	   alert("El cupon ya no se encuentra vigente.");
										  	 	   $.cookie("cupon","");						 					  	 	 												
										  	 break;	
										  	 case "3":	
										  		  alert("El cupon ya fue utilizado, no es posible volver a utilizarlo.");
										  	 	  $.cookie("cupon","");					 					  	 	 												
										  	 break;	
										  	
										  	 case "4":	
									  	 	 	   alert("El cupon no es valido.");
										  	 	   $.cookie("cupon","");						 					  	 	 												
										  	 break;	
										  	 case "5":	
										  		var r = confirm(" El monto disponible para descuento es de : $"+datos[1]+" pesos \n Deseas confirmar el uso del cupon ? \n (Recuerda que al confirmar el cupon ya no podra ser utilizado.)");
									  	 	    if (r == true) {
										  	 	     $('#numero_cupon',window.parent.document).val(cupon);
													 $.cookie("cupon",cupon);
													 window.parent.postValida_cupon();
									  	 	    } else {
									  	 	    	window.parent.hidePopWin(true);		
									  	 	    }						 					  	 	 												
										  	 break;	
										  	 case "6":	
										  		   alert("El beneficio optico ya fue utilizado, no es posible realizar el descuento.");
										  	 	   $.cookie("cupon","");	
										  	 break;
										  	 case "7":	
										  		   alert("No es posible usar el cupon de descuento \n,el usuario asociado al encargo no califica para Beneficio Optico GMO.");
										  	 	   $.cookie("cupon","");	
										  	 break;
										  	 case "8":	
										  		   alert("No es posible usar el cupon de descuento \n,el usuario asociado al encargo no se encuentra vigente \n , No aplica para Beneficio Optico GMO.");
										  	 	   $.cookie("cupon","");		
										  	 break;
										  	 case "100":	
										  		   alert("No es posible aplicar el cupon, el encargo ya posee un cupon asociado.");
										  	 	   $.cookie("cupon","");		
										  	 break;
										  	 default:
											  	   alert("Error , favor contactarse con MDA");
											  	   $.cookie("cupon","");
										  	 break;
								  		}
								    }else{
							  			alert("El cupon a utilizar esta asociado al Beneficio Optico GMO \n ,solo es aplicable a un trio optico o Gafa solar.(2)");

								    }
						  		}
										
							  }else{
						  			alert("El cupon a utilizar esta asociado al Beneficio Optico GMO \n ,solo es aplicable a un trio optico o Gafa solar.(1)");
						  	  }
						  }else{
								  switch(datos[0]){					  	 
								  	 	 case "1":	
								  	 		var r = confirm("Deseas confirmar el uso del cupon ? \n (Recuerda que al confirmar el cupon ya no podra ser utilizado.)");
								  	 	    if (r == true) {
									  	 	     $('#numero_cupon',window.parent.document).val(cupon);
												 $.cookie("cupon",cupon);
												 window.parent.postValida_cupon();
								  	 	    } else {
								  	 	    	window.parent.hidePopWin(true);		
								  	 	    }
									  	 	
									  	 break;		
								  	 	 case "2":	
								  	 	 	   alert("El cupon ya no se encuentra vigente.");
									  	 	   $.cookie("cupon","");						 					  	 	 												
									  	 break;	
									  	 case "3":	
									  		  alert("El cupon ya fue utilizado, no es posible volver a utilizarlo.");
									  	 	  $.cookie("cupon","");					 					  	 	 												
									  	 break;	
									  	
									  	 case "4":	
								  	 	 	   alert("El cupon no es valido.");
									  	 	   $.cookie("cupon","");						 					  	 	 												
									  	 break;
									     case "5":	
									  		var r = confirm(" El monto disponible para descuento es de : $"+datos[1]+" pesos \n Deseas confirmar el uso del cupon ? \n (Recuerda que al confirmar el cupon ya no podra ser utilizado.)");
								  	 	    if (r == true) {
									  	 	     $('#numero_cupon',window.parent.document).val(cupon);
												 $.cookie("cupon",cupon);
												 window.parent.postValida_cupon();
								  	 	    } else {
								  	 	    	window.parent.hidePopWin(true);		
								  	 	    }						 					  	 	 												
									  	 break;	
									  	 case "6":	
									  		   alert("El beneficio optico ya fue utilizado, no es posible realizar el descuento.");
									  	 	   $.cookie("cupon","");	
									  	 break;
									  	 case "7":	
									  		   alert("No es posible usar el cupon de descuento \n,el usuario asociado al encargo no califica para Beneficio Optico GMO.");
									  	 	   $.cookie("cupon","");	
									  	 break;
									  	 case "8":	
									  		   alert("No es posible usar el cupon de descuento \n,el usuario asociado al encargo no se encuentra vigente \n , No aplica para Beneficio Optico GMO.");
									  	 	   $.cookie("cupon","");		
									  	 break;
									  	 case "100":	
									  		   alert("No es posible aplicar el cupon de descuento, el encargo ya posee un cupon asociado.");
									  	 	   $.cookie("cupon","");		
									  	 break;
									  	 default:
										  	   alert("Error , favor contactarse con MDA");
										  	   $.cookie("cupon","");
									  	 break;
							    }
						  }
				 	  }
			 	});
  		}else{
			alert("Debes Ingresar un cupon.");
		}
		
	});	
	$("#cerrar").on("click",function(){
		window.parent.hidePopWin(true);		
	});
	
	$(".num").on('keypress',function(e){  k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9]/;n = String.fromCharCode(k);return patron.test(n);}); 

</script>
</body>
</html>