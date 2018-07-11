<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript">

	function cerrar_venta(){
		alert("Tiempo de Sesi\u00F3n Expirado"); 
		try{
		if(parent.document.getElementById('menu_principal_id')== null){
					
			if(parent.name != "")
			{	
				parent.carga_url_padre('<%=request.getContextPath()%>/Index.do?method=cargaLogin'); 
			}
			else
			{
				location.href('<%=request.getContextPath()%>/Index.do?method=cargaLogin');
			}
		}else{
			parent.carga_url_padre('<%=request.getContextPath()%>/Index.do?method=cargaLogin'); 
		}	
		}catch(Erro){
			location.href('<%=request.getContextPath()%>/Index.do?method=cargaLogin');
		} 
    }
</script>
</head>


	<body onload="cerrar_venta()">
	
	</body>
	
</html>