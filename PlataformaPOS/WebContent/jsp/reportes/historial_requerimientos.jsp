<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html:html xmlns="http://www.w3.org/1999/xhtml">
<title><bean:message key="title.pos"/></title>
<link href="css/estilos.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/subModal.css" />
<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
<script type="text/javascript"  src="js/jquery-1.8.2.min.js"></script>
</head>
<body>
	
	<html:form  action="/HistorialRequerimientos.do?method=cargaFormulario">
	<table width="100%" cellspacing="0">
         <table width="100%" cellspacing="0">
          <tr>
           	<td align="left" bgcolor="#373737" id="txt4" ><p>HISTORIAL DE REQUERIMIENTOS</p></td> 
           	<td width="30" align="right" bgcolor="#373737" id="txt1">
           		<a href="javascript:void(0)" id="guardar"> 
           			<img src="images/check.png" width="15"height="15" border="0" title="Guardar"> </a>
			</td>	
  			<td width="30" align="right" bgcolor="#373737" id="txt1"><a id="cerrar" href="javascript:void(0)"> <img src="images/cancel.png" width="15"
					height="15" border="0" title="Cerrar"> </a>
			</td>
           </tr>
  		 </table>
    </table>
    <table width="100%" border="0" cellspacing="1">
		  <tr>
		  		<td id="txt5" bgcolor="#c1c1c1"><input type="text" Class="fto"/>
	            	<a href="#" onclick="validaBuscar()" id="enviar">
	  						<img src="images/lupa.png" width="15" height="15" border="0" title="Buscar lista de presupuesto" >
	  				</a>
	  			 </td>
	  			 <td id="txt5" bgcolor="#c1c1c1" ><label>Familia: </label>&nbsp;
		 			<html:select property="familia" styleId="familia" styleClass="fto sel">    
            			<html:option value="0">Selecciona</html:option>
            			<logic:notEmpty property="listaFamilias" name="historialRequerimientosForm">
            				<html:optionsCollection name="historialRequerimientosForm" property="listaFamilias" label="descripcion" value="codigo" />
            			</logic:notEmpty>
       	 			</html:select>
				  </td>
				  <td id="txt5" bgcolor="#c1c1c1" ></td>
  				  <td id="txt5" bgcolor="#c1c1c1" ></td>				  
  		   </tr>
  		   <tr>
				<td id="txt5" bgcolor="#c1c1c1" ><label>SubFamilia: </label>&nbsp;
					<html:select property="subFamilia" styleId="subFamilia" styleClass="fto sel">    
            			<html:option value="0">Selecciona</html:option>
	            			<logic:notEmpty property="listaSubFamilias" name="historialRequerimientosForm">
	            				<html:optionsCollection name="historialRequerimientosForm" property="listaSubFamilias" label="descripcion" value="codigo" />
	            			</logic:notEmpty>
       	 			</html:select>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" ><label>Grupo Familia: </label>&nbsp;
					<html:select property="grupo"  styleId="grupo" styleClass="fto sel">    
            			<html:option value="0">Selecciona</html:option>
	            			<logic:notEmpty property="listaGruposFamilias" name="historialRequerimientosForm">
	            				<html:optionsCollection name="historialRequerimientosForm" property="listaGruposFamilias" label="descripcion" value="codigo" />
	            			</logic:notEmpty>
       	 			</html:select>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" >
				 	<label>Esfera: </label>&nbsp;<html:text property="esfera" styleId="esfera" styleClass="texto" maxlength="4"/>
				</td>
				<td id="txt5" bgcolor="#c1c1c1" >
				 	<label>Cilindro: </label>&nbsp;<html:text property="cilindro" styleId="cilindro" styleClass="texto" maxlength="4"/>
				</td>
		  </tr>
	</table>
	</html:form>
</body>
<script>
   	$("#cerrar").on("click",function(){
   		parent.carga_url_padre('<%=request.getContextPath()%>/Menu.do?method=CargaMenu');
   	});
   	
	$(".sel").on("change",function(){
   		document.forms[0].submit();
   	});
   
    $(".texto").on("keyup",function(){
    	var valor = $(this).val();
    	if($(this).val().length == 1){ 
    		$(this).val(valor+".");
    	}	
    });
    /*solo numeros*/
    $(".texto").on('keypress',function(e){
	    k = (document.all) ? e.keyCode : e.which;
		if (k==8 || k==0 ) return true;
		patron = /[0-9.]/;
		n = String.fromCharCode(k);
		return patron.test(n);
	}); 
   
</script>
</html:html>