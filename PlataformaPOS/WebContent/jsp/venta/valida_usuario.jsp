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
<title>Validador Usuario</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<table width="280" height="25" cellspacing="0" align="center"> 
	<tr>
		<td colspan="1" bgcolor="#373737" id="txt4">Ingresa  Rut</td>
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
			 <p>Rut :</p>
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<input type="text" name="rut" value="" Class="fto" size="15" id="rut" maxlength="50" placeholder="11111111-1" onkeyup="this.value = this.value.toLowerCase();" />
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
  //PLACEHOLDER 
  $(document).ready(function(){
	  function add() {
	    if($(this).val() === ''){
	      $(this).val($(this).attr('placeholder')).addClass('placeholder');
	    }
	  }

	  function remove() {
	    if($(this).val() === $(this).attr('placeholder')){
	      $(this).val('').removeClass('placeholder');
	    }
	  }

	  // Create a dummy element for feature detection
	  if (!('placeholder' in $('<input>')[0])) {

	    // Select the elements that have a placeholder attribute
	    $('input[placeholder], textarea[placeholder]').blur(add).focus(remove).each(add);

	    // Remove the placeholder text before the form is submitted
	    $('form').submit(function(){
	      $(this).find('input[placeholder], textarea[placeholder]').each(remove);
	    });
	  }
	});

	$("#enviar").on("click",function(){
  		
			//var nif = $.trim($("#nif",window.parent.document).val());
			var nif = $.trim($("#rut").val());
			var nif_f = nif.indexOf("-") != -1 ? nif.split("-"): "1-9";
		
			
			if( dv(nif_f[0]) == nif_f[1]){
	  			$.ajax({
					  type: "POST",
					  url: "<%=request.getContextPath()%>/SeleccionPago.do?method=valida_usuario_vp",
					  dataType: "text",
					  data:"serie="+$("#serie",window.parent.document).val()+"&nif="+nif_f[0]+"&v_a_pagar="+parseInt($.trim($("#sumaPagar",window.parent.document).val())),
					  asycn:false,
					  success: function(data){
						  
						  var data_t = data.split("_");
						  var desp = parseInt(data_t[0]);
						  var sumt = parseInt($("#sumaParcial",window.parent.document).val());
						  
						  switch(data_t[1]) {
						  
						  		case "1":
						  			 $("#rut_vs",window.parent.document).val(nif_f[0]);
									 $("#monto_des_vs",window.parent.document).val(desp);
									 window.parent.hidePopWin(true);
							  	break;
						  		case "2":
						  			 alert ("El usuario ingresado no se encuentra vigente.");
							  	break;
						  		case "3":
						  			 alert ("El usuario ingresado no aplica para Venta Personal.");
							  	break;
						  		case "4":
						  			alert("El monto permitido para cancelar con la forma de pago venta personal ,\nes menor a su maximo Disponible.\nMonto disponible: $"+desp);
								  	$("#forma_pago",window.parent.document).val("0");
							  	break;
							  	default:
							  		alert("Problema con el usuario, favor contactarse con la MDA");
							  		$("#forma_pago",window.parent.document).val("0");
							  	break;
						  }
					
				 	  }
			 	});
			}else{
				alert("El rut "+nif+" no es valido,favor ingresa un rut valido \nRecuerda que el rut debe tener  guion (-) y digito verificador.");
	       		document.getElementById("rut").value = "";	
			}
	  			
	});	
	
	
	$("#cerrar").on("click",function(){
		if($("#rut_vs",window.parent.document).val() == "" || $("#rut_vs",window.parent.document).val() == null){
			$("#forma_pago",window.parent.document).val("0");
			window.parent.hidePopWin(true);		
		}else{
			window.parent.hidePopWin(true);	
		}
	});
	
	function dv(T) {
	    var M = 0, S = 1;
	    for (; T; T = Math.floor(T / 10))
	        S = (S + T % 10 * (9 - M++ % 6)) % 11;
	    return S ? S - 1 : 'k';
	}
	
	$(".num").on('keypress',function(e){  k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9]/;n = String.fromCharCode(k);return patron.test(n);}); 

</script>
</body>
</html>