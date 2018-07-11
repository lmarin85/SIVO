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
<table width="400" cellspacing="0" align="center"> 
	<tr>
		<td colspan="1" bgcolor="#373737" id="txt4"><bean:message key="seleccion.autorizador"/></td>
		<td colspan="1" bgcolor="#373737" id="txt4" align="right">
			<a href="#" onclick="window.parent.hidePopWin(true);"> 
			<img src="images/cancel.png" width="14" height="14" border="0"> 
		</a>
		</td>
	</tr>
</table>
<table width="400" cellspacing="0" align="center""> 
	<tr class="txt">
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<bean:message key="login.index.usuario"/>
			
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<input type="text" name="user" value="" Class="fto" size="15" id="user" onblur="javascript:this.value=this.value.toUpperCase();"/>
		</td>
	</tr>
	
	<tr class="txt">
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<bean:message key="login.index.password"/>
				
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<input type="password" name="pass"  Class="fto txt" size="15" id="pass" value="" />
		</td>
	</tr>
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<p>Procedimientos: </p>				
		
		</td>
		<td id="txt5" bgcolor="#c1c1c1" align="left">
			<select id="accion" styleClass="fto">
				<option value="0">Selecciona</option>
				<option value="1">Anula cambio</option>
				<option value="2">Modificar forma pago</option>
			</select>
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
		var user = $.trim($('#user').val());
		var pass = $.trim($('#pass').val());

		if($("#accion").val() != "0"){
			if(user !="" && pass != ""){
			 		$.ajax({
						  type: "POST",
						  url: "<%=request.getContextPath()%>/VentaPedido.do?method=valida_permiso_mod_fpago",
						  dataType: "text",
						  data:"usuario="+user+"&pass="+pass,
						  asycn:false,
						  success: function(data){
					  	  switch(data){					  	 
							  	 case "0":
							  	 	alert("Debes estar autorizado para borrar formas de Pago.");
							  	 break;
						  	 	 case "1":	
						  	 	 	   $('#autorizador',window.parent.document).val($('#user').val());
									   $('#tipoaccion',window.parent.document).val($('#accion').val());							  	 	 	
									   $('#form1',window.parent.document).submit();					  	 	   						  	 	 					  	 	
					  	 	 		  				  	 	 									  	 	   	 
							  	 break;	
						  	 	 case "2":
							  	 	alert("No tienes asignado este local para realizar cambios.");					  	 	 	
							  	 break;
							  	 case "3":
							  	 	alert("Usuario o contraseña incorrecta.");	
							  	 break;
						  	 }								  												  		
					 	  }
				 	});
			}else{
				alert("Usuario y contraseña son obligatorios.");
			}
		}else{
			alert("Debes seleccionar el motivo para modificar la boleta.");
		}
	});	
</script>
</body>
</html>