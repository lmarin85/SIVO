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
<title>Reimpresión de Boleta</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<table width="400" cellspacing="0" align="center"> 
	<tr>
		<td colspan="1" bgcolor="#373737" id="txt4"><p>ReimpresI&oacute;n de Boleta</p></td>
		<td colspan="1" bgcolor="#373737" id="txt4" align="right">
			<a href="#" onclick="window.parent.hidePopWin(true);"> 
			<img src="images/cancel.png" width="14" height="14" border="0"> 
		</a>
		</td>
	</tr>
</table>
<table width="400" cellspacing="0" align="center""> 
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<p>N&uacute;mero boleta:</p>
			
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<input type="text" name="n1" value="" Class="fto num" size="15" id="n1" onblur="javascript:this.value=this.value.toUpperCase();"/>
		</td>
	</tr>
	
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<p>N&uacute;mero boleta:</p>
				
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<input type="text" name="n2"  Class="fto num" size="15" id="n2" value="" />
		</td>
	</tr>
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" align="right" colspan="2">
			<a href="#" onclick="" id="enviar"> 
				<img src="images/check.png" width="15" height="15" border="0" title="Confirmar Impresión de Boleta" />
		</a>
		</td>
	</tr>
</table>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>	
<script>
           
	$("#enviar").on("click",function(){
		var n1 = $.trim($('#n1').val());
		var n2 = $.trim($('#n2').val());
		if(n1 == n2){
			$.ajax({
					  type: "POST",
					  url: 'SeleccionPago.do?method=reimprimeboleta',
					  dataType: "text",
					  data:"numero_boleta_up="+$('#n1').val()+"&serie="+$("#serie",window.parent.document).val()+"&fech_pago="+$("#fpago",window.parent.document).val(),
					  asycn:false,
					  success: function(data){
					        switch(data){
					        	case "0":
					        		alert("No se pudo cambiar el número de boleta, La fecha de la boleta de pago no corresponde al día de hoy");
					        	break;
					        	case "1":
	   				        		alert("Se actualizó el número de boleta");	
	   				        			window.parent.hidePopWin(false);			        	    
					        	break;
					        	case "2":
	   				        		alert("No se puede ocupar este número de boleta, ya está siendo ocupado por otro encargo.");				        	    
					        	break;
					        	case "3":
	   				        		alert("Rango de boleta no valido para está tienda.");				        	    
					        	break;
					            
					        }
					  								  												  		
				 	  }
			 	});	
		 }else{
		 	 alert("Los números de boleta no coinciden!!!!");
		 }					  	 	 	
	    //$('#form1',window.parent.document).submit();					  	 	   						  	 	 					  	 	
 	    //
	});	
	
   $(".num").on('keypress',function(e){k = (document.all) ? e.keyCode : e.which;if (k==8 || k==0 ) return true;patron = /[0-9]/;n = String.fromCharCode(k);return patron.test(n);}); 
	
</script>
</body>
</html>