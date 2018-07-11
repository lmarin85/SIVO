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
		<script type="text/javascript">
		var returnVal = new Array("false", "0") ;


		function autorizadesc(){
	
			var user = document.getElementById('user').value;
			var pass = document.getElementById('pass').value;
			var tipo = document.getElementById('tipo_pedido').value;
			
			if(tipo == '0'){
				alert("Debes seleccionar un tipo de Encargo");
			}else{
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		 			xmlhttp.open("GET","<%=request.getContextPath()%>/ValidaDescuentoServlet?usuario=" + user + "&pass=" + pass + "&tipo=" + tipo,true);
		 			xmlhttp.send(null);
		 			xmlhttp.onreadystatechange=function(){
		   												if (xmlhttp.readyState==4 && xmlhttp.status==200)
		     												{
		     													var descuento=xmlhttp.responseText;
		     													if (descuento == -1) {
																	alert("No estas autorizado a realizar este descuento");
															//		document.getElementById('descuentoTotal').value = 0.0;
																	returnVal = new Array("false", "0") ;
																	
																}
																else
																{
																	returnVal = new Array("true", descuento, user);
																}
																window.parent.hidePopWin(true);
		     												}
		   												};
		   	}
		}
		
		</script>
		
<title>autorizador_descuento</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body onload="if(history.length>0)history.go(+1)">
	<html:hidden property="tipo_pedido" styleId="tipo_pedido" name="seleccionPagoForm"/>
			<table width="200" cellspacing="0" align="center"> 
				<tr>
					<td colspan="1" bgcolor="#373737" id="txt4"><bean:message key="seleccion.autorizador"/></td>
					<td colspan="1" bgcolor="#373737" id="txt4" align="right">
						<a href="#" onclick="window.parent.hidePopWin(true);"> 
						<img src="images/cancel.png" width="14" height="14" border="0"> 
					</a>
					</td>
				</tr>
			</table>
			<table width="200" cellspacing="0" align="center""> 
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" align="left">
						<bean:message key="login.index.usuario"/>
						
					</td>
					<td id="txt5" bgcolor="#c1c1c1" align="left">
						<input type="text" name="user" value="" Class="fto" size="15" id="user" onblur="javascript:this.value=this.value.toUpperCase();"/>
					</td>
				</tr>
				
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" align="left">
						<bean:message key="login.index.password"/>
							
					</td>
					<td id="txt5" bgcolor="#c1c1c1" align="left">
						<input type="password" name="pass"  Class="fto" size="15" id="pass" value=""/>
					</td>
				</tr>
					<tr>
					<td id="txt5" bgcolor="#c1c1c1" align="right" colspan="2">
						<a href="#" onclick="autorizadesc()" id="enviar"> 
							<img src="images/check.png" width="15" height="15" border="0" title="Confirmar Impresión de Boleta" />
					</a>
					</td>
				</tr>
			</table>

</body>
</html>