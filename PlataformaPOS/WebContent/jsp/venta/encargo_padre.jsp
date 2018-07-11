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
		           	<td align="left" bgcolor="#373737" id="txt4" rowSpan="1" colSpan="1" >Encargo origen</td> 	        
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
						<html:text property="encargo_padre" name="ventaPedidoForm" styleId="encargo_padre" styleClass="num" maxlength="11"></html:text>					
						
					</td>							
				<tr>	
		    	<tr>
					<td align="left" bgcolor="#c1c1c1" id="txt5" width="100%" colspan="2">   			
						<input type="button" id="agregar" value="Validar" >
					</td>		
		    	</tr>
	        </table>
     </html:form>
</body>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>	
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script>
	$("#encargo_padre").val("");
	
	$("#agregar").on('click',function(){
	
		  var encval = $.trim($("#encargo_padre").val());	
		  var enctmp = encval.split("/");			
		  //$("#encargo_padre",window.parent.document).val(encval);
		  var encargo = enctmp [0]+"/"+enctmp [1];
		  var arr = new Array();
      	  var sumofer = new Array();
      	  var arrin = new Array();
      	  var cant = new Array();
      	  
		  //FIX CONVENIO 51001 Y 51002
		  if($("#convenio",window.parent.document).val() =="51001" || $("#convenio",window.parent.document).val() =="51002"){
			  	 
		      	 
			 	 $("#contenido tr",window.parent.document).each(function(a){
			       		var familia  = $(this).find("td > a").attr("data-grupfam");
			       		var subfam   = $(this).find("td > a").attr("data-subfam");
			       		var indice 	 = $(this).find("td > a").attr("data-indice");
			       		var articulo = $(this).find("td > a").attr("data-barra");
			       		var precio   = $.trim($(this).find("td > a").attr("data-precio"));
			       		if(subfam == "VOG" || subfam == "ANT"){
							arr[a]     = articulo;
							sumofer[a] = precio;
							arrin[a]   = indice;
			        	}
			        	cant[a] = a;
			        	a++;
			   	   });
			   	   
			  	   /*if(arrin.length > 0){
		  	   			alert('Convenio no aplicable a productos BULGARI o CHANEL , debes eliminar esos productos del encargo y volver a asociar el convenio.');
						window.parent.elimina_convenio_sel();
			  	   }*/
			   	   
			   	   /*for( var i= 0;i <= arrin.length-1 ;i++){
			   	   		parent.dtomarin(arrin[i],"0,0");
			   	   }*/
		  	}
		  	if($("#convenio",window.parent.document).val() =="51001" && cant.length < 2){
			  		if(arrin.length > 0 &&  arrin.length < 2){
			  	   		
							if(encval != '' || encval.length >= 9){
								$.ajax({
									  type: "POST",
									  url: 'VentaPedido.do?method=validaPromoLec',
									  dataType: "text",
									  data:"encargo_padre="+encargo,
									  asycn:false,
									  success: function(data){
									  		switch(data){	
									  			case "-2":
									  				alert('Encargo origen no es válido para aplicar promoción(cant), No se puede aplicar el convenio.');
													$.cookie('m_modal','0');
													window.parent.elimina_convenio_sel();			
									  			break;			  		  	  					  	
									  		  	case "0":
									  				alert('Encargo origen no es válido para aplicar promoción , No se puede aplicar el convenio.');
													$.cookie('m_modal','0');
													window.parent.elimina_convenio_sel();			
									  			break;
									  			case "1":
									  				//console.log("encargo padre ==> "+encargo);
									  				$('#encargo_padre',window.parent.document).val(encargo);
					 						    	window.parent.hidePopWin(true);		  						   									
									  			break;
									  			case "2":
									  				alert('La fecha del encargo origen no corresponde al rango de la promoción , No se puede aplicar el convenio.');
									  				$.cookie('m_modal','0');
									  				window.parent.elimina_convenio_sel();
									  			break;
									  			case "3":
													alert('El encargo ya fuen usado  , No se puede aplicar el convenio.');
													$.cookie('m_modal','0');
													window.parent.elimina_convenio_sel();
												break;
									  			default:
									  				alert('El encargo indicado no contiene articulos de la promoción, No se puede aplicar el convenio(*).');
									  				$.cookie('m_modal','0');
									  				window.parent.elimina_convenio_sel();
									  			break;
									  		}
									  }
								  });	
							  }else{
							  		alert("No es un número de encargo válido.");
							  }	
					}else if(arrin.length == 0){
							alert('Convenio aplicable sólo a productos Arnette o Vogue .');
							$.cookie('m_modal','0');
							
							//console.log("MODAL ==>"+$.cookie('m_modal'));
								
							window.parent.elimina_convenio_sel();
					}
			  }else if($("#convenio",window.parent.document).val() =="51002" && cant.length == 2){
			  		
							if(encval != '' || encval.length >= 9){
								$.ajax({
									  type: "POST",
									  url: 'VentaPedido.do?method=validaPromoLec',
									  dataType: "text",
									  data:"encargo_padre="+encargo,
									  asycn:false,
									  success: function(data){
									  		switch(data){	
									  			case "-2":
									  				alert('Encargo origen no es válido para aplicar promoción(cant), No se puede aplicar el convenio.');
													$.cookie('m_modal','0');
													window.parent.elimina_convenio_sel();			
									  			break;			  		  	  					  	
									  		  	case "0":
									  				alert('Encargo origen no es válido para aplicar promoción , No se puede aplicar el convenio.');
													$.cookie('m_modal','0');
													window.parent.elimina_convenio_sel();			
									  			break;
									  			case "1":
									  				//console.log("encargo padre ==> "+encargo);
									  				$('#encargo_padre',window.parent.document).val(encargo);
					 						    	window.parent.hidePopWin(true);		  						   									
									  			break;
									  			case "2":
									  				alert('La fecha del encargo origen no corresponde al rango de la promoción , No se puede aplicar el convenio.');
									  				$.cookie('m_modal','0');
									  				window.parent.elimina_convenio_sel();
									  			break;
									  			case "3":
													alert('El encargo ya fuen usado  , No se puede aplicar el convenio.');
													$.cookie('m_modal','0');
													window.parent.elimina_convenio_sel();
												break;
									  			default:
									  				alert('El encargo indicado no contiene articulos de la promoción, No se puede aplicar el convenio(*).');
									  				$.cookie('m_modal','0');
									  				window.parent.elimina_convenio_sel();
									  			break;
									  		}
									  }
								  });	
							  }else{
							  		alert("No es un número de encargo válido.");
							  }
					
					
			}/*else{
					alert('error: La cantidad de articulos es incorrecta para el convenio.');
					$.cookie('m_modal','0');
					window.parent.elimina_convenio_sel();
			}*/
		  	
		  	
		  	
		  	if($("#convenio",window.parent.document).val() =="51007"){
		  		
		  		 var b = 0;
		  		 var can= 0;
				 var nif = $.trim($("#dvnif",window.parent.document).val());
				 var error = 0;
				 
		     	 $("#contenido tr",window.parent.document).each(function(a){
		        	  
		        	   var articulo = $(this).find("td > a").attr("data-barra");
		        	   var cantidad = parseInt($(this).find("td > input.cantidad_lec").attr("data-cantidad"));
					   //console.log("can ==>"+cantidad);
					   if(cantidad >= 2){
						   error = 1;
					   }
		        	   can += cantidad;
			           if(articulo != ""){
			  				b++;
			           }
		         });
		     
		     	 //console.log("Cantidad ==>"+b + "<=>"+can);
		     	 if(encargo !="" && nif != ""){
				     	 if(error != 1 ){
				     		  				     						  
					  	   	   $.ajax({
								  type: "POST",
								  url: 'VentaPedido.do?method=valida_encargo',
								  dataType: "text",
								  data:"encargo_padre="+encargo,
								  asycn:false,
								  success: function(data){
						  				//console.log("data ==> "+data);

								  		  switch(data){	
								  			case "1":
								  				//console.log("encargo padre ==> "+encargo);
								  				$('#encargo_padre',window.parent.document).val(encargo);
				 						    	window.parent.hidePopWin(true);		  						   									
								  			break;
								  			case "2":
								  				alert('El encargo no es valido (1), No se puede aplicar el convenio(*).');
								  				$.cookie('m_modal','0');
								  				window.parent.elimina_convenio_sel();
								  			break;
								  			case "3":
												alert('El encargo ya fue usado , No se puede aplicar el convenio.');
												$.cookie('m_modal','0');
												window.parent.elimina_convenio_sel();
											break;
								  			case "4":
												alert('El encargo no existe , No se puede aplicar el convenio.');
												$.cookie('m_modal','0');
												window.parent.elimina_convenio_sel();
											break;
								  			case "5":
												alert('El cliente asociado al nuevo encargo debe ser igual al cliente asociado al encargo padre , No se puede aplicar el convenio.');
												$.cookie('m_modal','0');
												window.parent.elimina_convenio_sel();
											break;
								  			case "6":
												alert('El encargo padre esta fuera de la fecha valida para la promoción , No se puede aplicar el convenio.');
												$.cookie('m_modal','0');
												window.parent.elimina_convenio_sel();
											break;
								  			default:
								  				alert('El encargo no es valido (G), No se puede aplicar el convenio(*).');
								  				$.cookie('m_modal','0');
								  				window.parent.elimina_convenio_sel();
								  			break;
								  		}
								  }
							  });
				     	 }else{
				     		 alert("Solo puede haber 1 unidad por linea y maximo 2 lineas por  encargo, Convenio 51007.");
				     	 }
		     	 }else{
		     		 alert("Debes ingresar un encargo valido.");
		     	 }	     	 
		  	}
	});//FIN EVENTO
	
	$("#cerrar").live("click",function(){
		var r=confirm("Para aplicar este convenio, debe estar asociado a un encargo con familia LEC");
		if (r==true)
		{
			$.cookie('m_modal','0');
		  	window.parent.hidePopWin(false);
		  	window.parent.elimina_convenio_sel();
 			//window.parent.document.location = '<%=request.getContextPath()%>/VentaPedido.do?method=nuevoFormulario';
			//$('.seguro',window.parent.document).css('display','none').attr('disabled','disabled');	 			
		}		
	});
	
    $(".num").on('keypress',function(e){k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9/B]/;n = String.fromCharCode(k);return patron.test(n);});
	
</script>
</html:html>