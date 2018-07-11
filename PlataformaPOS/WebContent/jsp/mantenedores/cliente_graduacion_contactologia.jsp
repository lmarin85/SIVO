
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html:html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title><bean:message key="title.pos"/></title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css" />

		<link rel="stylesheet" type="text/css" href="css/subModal.css" />
		<link rel="stylesheet" type="text/css" href="css/formatosFormularios.css" />
		<script type="text/javascript" src="js/common.js"></script>
		<script type="text/javascript" src="js/subModal.js"></script>
		<script language="javascript" src="js/utils.js"></script>
		<script type="text/javascript" src="js/mantenedores/cliente_graduacion_contactologia.js"></script>
		<script type="text/javascript" src="js/prototype.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/jquery.datepick.css"/>
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="js/jquery.datepick.js""></script>
		<script type="text/javascript" src="js/jquery.datepick-es.js"></script>
		<script type="text/javascript">
		//********Validaciones Contactología (pasar a archivo externo.js)**************
		function validaRadio1(elemento,lado){
			
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
				var respuesta = isNaN(valorelemento);
				if(!(respuesta)){
												
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
					
					if(valorelemento <= 0.00 || valorelemento > 99.99){					
						alert("El valor radio1 "+lado+" est\u00E1 fuera del rango permitido mayor a 0 y menor a 99.99");					
					}else{
						elemento.value=valorelemento;
					}
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();					
				}		
			}else{
				alert("Debe ingresar valor en radio 1 "+lado+"");				
			}
		}
		
		
		function validaRadio2(elemento,lado){
			
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
				var respuesta = isNaN(valorelemento);
				if(!(respuesta)){
												
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
					
					if(valorelemento <= 0.00 || valorelemento > 99.99){					
						alert("El valor radio1 "+lado+" est\u00E1 fuera del rango permitido mayor a 0 y menor a 99.99");					
					}else{
						elemento.value=valorelemento;
					}
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();					
				}		
			}
		}
		
		function validaEsfera(elemento,lado){
			
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			var mult = 0.25;
			var cont = 0;
			if("" != valorelemento){
							
				var respuesta = isNaN(valorelemento);
				
				if(!(respuesta)){
				
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
				
					if(valorelemento < -99.00 || valorelemento > 99.00){					
						alert("El valor esfera "+lado+" est\u00E1 fuera del rango permitido entre -99 y 99");					
					}else{
						
						if (valorelemento%mult!=0){
						
							while((valorelemento%mult!=0) && (cont < 55)){
								
								if(valorelemento > 0){				 
							 		valorelemento = parseFloat(valorelemento) + 0.01;
								 }else{
									 valorelemento = parseFloat(valorelemento) + (-0.01);
								 }	
								 
								  valorelemento = parseFloat(valorelemento.toFixed(2));
								  cont++;						 
							}							
							elemento.value=valorelemento;
						}else{
							elemento.value=valorelemento;
						}					
					}
					
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();	
				}		
			
			}else{
				alert("Debe ingresar valor en esfera "+lado+"");	
			}			
		}
		
		function validaCilindro(elemento,lado){
		
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			var mult = 0.25;
			var cont = 0;
			
			if("" != valorelemento){
			
				var respuesta = isNaN(valorelemento);
				
				if(!(respuesta)){
					
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
					if(valorelemento < -99.00 || valorelemento > 0){					
						alert("El valor cilindro "+lado+" est\u00E1 fuera del rango permitido entre -99 y 0");					
					}else{
						if (valorelemento%mult!=0){	
						
							while((valorelemento%mult!=0) && (cont < 55)){
								
								if(valorelemento > 0){				 
							 		valorelemento = parseFloat(valorelemento) + 0.01;
								 }else{
									 valorelemento = parseFloat(valorelemento) + (-0.01);
								 }	
								 
								  valorelemento = parseFloat(valorelemento.toFixed(2));
								  cont++;						 
							}							
							elemento.value=valorelemento;
						
						}else{
							elemento.value=valorelemento;
						}
					}				
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();		
				}			
			
			}else{
				alert("Debe ingresar valor en cilindro "+lado+"");		
			}
		
		
		}
		
		function validaEje(elemento, lado){
			
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			var cilindro = 0;
			
			if("derecho" == lado){
				cilindro = document.getElementById('o_cilindro').value;
			}else if("izquierdo" == lado){
				cilindro = document.getElementById('i_cilindro').value;
			}
			
			if("" != valorelemento){
				
				var respuesta = isNaN(valorelemento);				
				if(!(respuesta)){
				
					valorelemento = parseInt(valorelemento);
					
					if(valorelemento >= 0 && valorelemento <= 180){
						elemento.valeu=	valorelemento;
					}else{
						alert("El valor eje "+lado+" est\u00E1 fuera del rango permitido entre 0 y 180");
					}							
				
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();
				}				
				
			}else{				
				if(cilindro < 0 && cilindro > -99){
					alert("Debe ingresar eje dentro de los rangos  0 y 180");
				}		
			}
		
		}
		
		
		function validaDiamT(elemento, lado){
			
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
				var respuesta = isNaN(valorelemento);	
				
				if(!(respuesta)){
				
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
					
					if(valorelemento >= 0.00  && valorelemento <= 30.00){
						elemento.value = valorelemento;	
					}else{
						alert("El valor diametro total "+lado+" est\u00E1 fuera del rango permitido entre 0 y 30");	
					}
					
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();
				}
			}else{
				alert("Debe ingresar valor en diametro total "+lado+"");	
			}	
		}
		
		function validaDiaZ(elemento, lado){
		
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
							
				var respuesta = isNaN(valorelemento);
				
				if(!(respuesta)){
					
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
					
					if(valorelemento >= 0.00 && valorelemento <= 10.00){
						elemento.value=valorelemento;
					}else{
						alert("El valor diametro zona \u00F3ptica "+lado+" est\u00E1 fuera del rango permitido entre 0 y 10");	
					}
				
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();
				}
				
			}
			
		}
		
		function validaBandasP(elemento, lado){
		
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
				
				var respuesta = isNaN(valorelemento);
				
				if(!(respuesta)){
					
					valorelemento = parseInt(valorelemento);
					
					if(valorelemento >= 0 && valorelemento <= 9){
						elemento.value=valorelemento;
					}else{
						alert("El valor bandas perisf\u00E9ricas "+lado+" est\u00E1 fuera del rango permitido entre 0 y 9");	
					}					
				
				}else{
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();
				}			
			}		
		}
		
		
		function validaRadio3(elemento, lado){
			
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
				
				var respuesta = isNaN(valorelemento);
								
				if(!(respuesta)){
					
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
				
					if(valorelemento >= 0 && valorelemento <= 99.99){
						elemento.value=valorelemento;
					}else{
						alert("El valor radio 3 "+lado+" est\u00E1 fuera del rango permitido entre 0 y 99.99");
					}					
						
				}else{				
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();				
				}			
			}				
		}
		
		
		function validaDiamP(elemento, lado){
		
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
				
				var respuesta = isNaN(valorelemento);
				
				if(!(respuesta)){
				
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
					
					if(valorelemento >= 0 && valorelemento <= 10.00){
						elemento.value=valorelemento;
					}else{
						alert("El valor diametro pupilar "+lado+" est\u00E1 fuera del rango permitido entre 0 y 10.00");
					}					
				
				}else{				
					alert("Debe ingresar solo n\u00FAmeros");
					elemento.focus();				
				}
			}		
		}
		
		function validaAdicion(elemento, lado){
		
			var valorelemento = elemento.value;			
			valorelemento = trim(valorelemento);
			var mult = 0.25;
			var cont = 0;
			if("" != valorelemento){
			
				var respuesta = isNaN(valorelemento);
				
				if(!(respuesta)){
					
					valorelemento = (parseFloat(valorelemento)).toFixed(2);
					
					if(valorelemento >= 0.00 && valorelemento <= 5.00){
					
						if (valorelemento%mult!=0){	
						
							while((valorelemento%mult!=0) && (cont < 55)){
								
								if(valorelemento > 0){				 
							 		valorelemento = parseFloat(valorelemento) + 0.01;
								 }else{
									 valorelemento = parseFloat(valorelemento) + (-0.01);
								 }	
								 
								  valorelemento = parseFloat(valorelemento.toFixed(2));
								  cont++;						 
							}							
							elemento.value=valorelemento;
						
						}else{
							elemento.value=valorelemento;
						}
						
						
					}else{
						alert("El valor adici\u00F3n "+lado+" est\u00E1 fuera del rango permitido entre 0 y 5.00");
					}
				
				}else{
					elemento.value=valorelemento;
				}
				
			}
		
		}
		
		
		function validaInfoContactologia(){
		
			var radio1D = document.getElementById('o_radio1').value;
			radio1D = trim(radio1D);			
			if("" != radio1D){
				if(radio1D <= 0.00 || radio1D > 99.99){
					alert("El valor radio1 derecho est\u00E1 fuera del rango permitido mayor a 0 y menor a 99.99");
					return false;
				}					
			}else{				
				alert("Debe ingresar valor en radio 1 derecho");
				return false;	
			}
			
			
			var radio1I=document.getElementById('i_radio1').value;
			radio1I = trim(radio1I);			
			if("" != radio1I){
				if(radio1I <= 0.00 || radio1I > 99.99){
					alert("El valor radio1 izquierdo est\u00E1 fuera del rango permitido mayor a 0 y menor a 99.99");
					return false;
				}					
			}else{				
				alert("Debe ingresar valor en radio 1 izquierdo");
				return false;	
			}
			
			
			var esferaD = document.getElementById('o_esfera').value;
			esferaD = trim(esferaD);			
			if("" != esferaD){
				if(esferaI < -99.00 || esferaI > 99.00){					
						alert("El valor esfera derecha est\u00E1 fuera del rango permitido entre -99 y 99");
						return false;					
				}			
			}else{
				alert("Debe ingresar valor en esfera derecha");
				return 	false;
			}
			
			
			var esferaI = document.getElementById('i_esfera').value;
			esferaI = trim(esferaI);			
			if("" != esferaI){
				if(esferaI < -99.00 || esferaI > 99.00){					
						alert("El valor esfera izquierda est\u00E1 fuera del rango permitido entre -99 y 99");
						return false;					
				}			
			}else{
				alert("Debe ingresar valor en esfera izquierda");
				return 	false;
			}
			
			
			var cilindroD = document.getElementById('o_cilindro').value;
			cilindroD = trim(cilindroD);	
			if("" != cilindroD){
				if(cilindroD < -99.00 || cilindroD > 0){					
					alert("El valor cilindro derecho est\u00E1 fuera del rango permitido entre -99 y 0");
					return false;				
				}
			}else{
				alert("Debe ingresar valor en cilindro derecho");		
				return false;
			}
			
			
			var cilindroI = document.getElementById('i_cilindro').value;
			cilindroI = trim(cilindroI);	
			if("" != cilindroI){
				if(cilindroI < -99.00 || cilindroI > 0){					
					alert("El valor cilindro izquierdo est\u00E1 fuera del rango permitido entre -99 y 0");
					return false;				
				}
			}else{
				alert("Debe ingresar valor en cilindro izquierdo");		
				return false;
			}
			
			
			var ejeD = document.getElementById('o_eje').value;
			ejeD = trim(ejeD);				
			if(cilindroD < 0){				
				if("" != ejeD){					
					if(ejeD < 0 || ejeD > 180){
						alert("El valor eje derecho est\u00E1 fuera del rango permitido entre 0 y 180");
						return false;
					}						
				}else{
					alert("Debe ingresar eje derecho dentro de los rangos  0 y 180");
					return false;
				}			
			}
			
			
			var ejeI = document.getElementById('i_eje').value;
			ejeI = trim(ejeI);			
			if(cilindroI < 0){				
				if("" != ejeI){					
					if(ejeI < 0 || ejeI > 180){
						alert("El valor eje izquierdo est\u00E1 fuera del rango permitido entre 0 y 180");
						return false;
					}						
				}else{
					alert("Debe ingresar eje izquierdo dentro de los rangos  0 y 180");
					return false;
				}			
			}
			
			
			var diamtD = document.getElementById('o_diamt').value;
			diamtD = trim(diamtD);	
			
			if("" != diamtD){				
				if(diamtD < 0.00  || diamtD > 30.00){
					alert("El valor diametro total derecho est\u00E1 fuera del rango permitido entre 0 y 30");
					return false;
				}				
			}else{
				alert("Debe ingresar valor en diametro total derecho");
				return false;
			}		
			
			
			var diamtI = document.getElementById('i_diamt').value;
			diamtI = trim(diamtI);			
			if("" != diamtI){				
				if(diamtI < 0.00  || diamtI > 30.00){
					alert("El valor diametro total izquierdo est\u00E1 fuera del rango permitido entre 0 y 30");
					return false;
				}				
			}else{
				alert("Debe ingresar valor en diametro total izquierdo");
				return false;
			}
			
			return true;
		}
		function ingreso_presupuesto(){
				var estaGrabado = document.getElementById('estaGrabado').value;
				
				var cliente = document.getElementById('codigo_cliente').value;
				var nombre_cliente = document.getElementById('nombre_cliente').value;
				var pagina = document.getElementById('cerrarPagina').value;
				
				
				if(estaGrabado == 2){
				
					var boton = confirm("¿Desea salir de la página actual sin guardar?");
					
					if(boton){
						if(pagina == 1){				
							parent.carga_url_padre_traspaso_vta_presupuesto("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
						}else{
							parent.carga_url_padre_traspaso_vta_presupuesto_padre("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
						}
					}				
				}else{
					if(pagina == 1){				
						parent.carga_url_padre_traspaso_vta_presupuesto("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}else{
						parent.carga_url_padre_traspaso_vta_presupuesto_padre("<%=request.getContextPath()%>/Presupuesto.do?method=IngresaPresupuestoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}
				}
				
				
									
		}
		
		function ingreso_encargo(){
				var estaGrabado = document.getElementById('estaGrabado').value;
		
				var cliente = document.getElementById('codigo_cliente').value;
				var nombre_cliente = document.getElementById('nombre_cliente').value;
				var pagina = document.getElementById('cerrarPagina').value;
				
				if(estaGrabado == 2){
					var boton = confirm("¿Desea salir de la página actual sin guardar?");
					if(boton){
						if(pagina == 1){
							parent.carga_url_padre_traspaso_vta_presupuesto("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
						}else{
							parent.carga_url_padre_traspaso_vta_presupuesto_padre("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
						}
					}
				}else{
					if(pagina == 1){
						parent.carga_url_padre_traspaso_vta_presupuesto("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}else{
						parent.carga_url_padre_traspaso_vta_presupuesto_padre("<%=request.getContextPath()%>/VentaPedido.do?method=IngresaVentaPedidoGraduacion&cliente="+cliente+"&nombre_cliente="+nombre_cliente+"");
					}				
				}			
				
		}	
		//********FIN Validaciones Contactología**************
		
		function cerrarVentana(){
			var estaGrabado = document.getElementById('estaGrabado').value;
			if(estaGrabado == 2){
				var boton = confirm("¿Desea salir de la página actual sin guardar?");
					
				if(boton){
					window.parent.hidePopWin(false);
				}				
			}else{
				var boton = confirm("¿Está seguro de salir de la página actual?");
				
				if(boton){
					window.parent.hidePopWin(false);
				}
			}			
		}
		
		var $j = jQuery.noConflict();
		$j(function() {
			$j('#fechapedido').datepick();
		});
		
		$j(function() {
			$j('#fecha_entrega').datepick();
		});
		
		$j(function() {
			$j('#fecha_recepcion').datepick();
		});
		
		$j(function() {
			$j('#fecha_caducidad').datepick();
		});	
		$j(function() {
			$j('#revision1').datepick();
		});	
		
		 function buscarDoctorAjax()
        {        	
        	var nifdoctor = document.getElementById('nifdoctor').value;	
        	if("" != nifdoctor){
        		document.getElementById('nombre_doctorDIV').innerHTML = "";
        		document.getElementById('nifdoctor').value = "";
        		document.getElementById('nifdoctor').value = "Buscando...";
        		new Ajax.Request('<html:rewrite page="/Contactologia.do?method=buscarDoctorAjax"/>', {
				      parameters: {nifdoctor: nifdoctor},      
				      onComplete: function(transport, json) {
				      	if("" != json.nifdoctor){
					      	document.getElementById('nifdoctor').value = json.nifdoctor;					      	
					      	document.getElementById('dvnifdoctor').value = json.dvnifdoctor;					      	
					      	document.getElementById('nombre_doctorDIV').innerHTML = json.nombredoctor;
					      	document.getElementById('doctor').value = json.codigodoctor;
					      	var miArray = new Array(10);
					      	
				      	}else{
				      		alert("El doctor con rut "+nifdoctor+" no existe");
				      		document.getElementById('nifdoctor').value = "";
				      	}					      			         		         
				      }
				   });
        		
        	}else{
        		alert("Debe ingresr rut de doctor.");
        	}	
        }
        function buscarMedico()
			{								
				showPopWin("<%=request.getContextPath()%>/BusquedaMedicos.do?method=buscar", 714, 425, cargaMedico, false);
			}
</script>
</head>	
<body onload="inicio_pagina();if(history.length>0)history.go(+1)">

<html:form action="/Contactologia?method=ingresaContactologia" styleId="form1">
<html:hidden property="cerrarPagina" styleId="cerrarPagina"  />
<html:hidden property="grabar" styleId="grabar"  />
<html:hidden property="cliente" styleId="codigo_cliente"  />
<html:hidden property="accion" styleId="accion"/>
<html:hidden property="exito" styleId="exito" />
<html:hidden property="fecha_graduacion" styleId="fecha_graduacion"/>
<html:hidden property="numero_graduacion" styleId="numero_graduacion" />
<html:hidden property="existeContactologia" styleId="existeContactologia" />
<html:hidden property="estaGrabado" styleId="estaGrabado" />
<html:hidden property="doctor" styleId="doctor" />

<div align="center" style="height: 350;">
<table width="100%" cellspacing="0">

            <tr >
              	<td  align="left" bgcolor="#373737" id="txt4" width="90%" height="24"><bean:message key="cliente.graduacion.graduacion.cliente"/></td>
              	<td align="left" bgcolor="#373737" id="txt4" height="24">
    			<div  id="graduaId" style="display:none" >	
	              		<a href="#"	onclick="nuevo_graduacion()">
								 <img src="images/nuevo.png" width="20" height="20"	border="0" title="Nueva Graduación" >
						</a>
					</div>	
    			</td> 
    			<td align="right" bgcolor="#373737" id="txt4" height="24">              		   
              		
					<div id="presupuestoId" >
	              	    &nbsp;       		 
	              		<a href="#" onclick="ingreso_presupuesto();" title="Ingreso de Presupuesto" >	      					
	      					<img src="images/presupuestos.jpg" width="15" height="15" border="0" >
	    				</a>
    				</div>
    			</td>
    			<td align="right" bgcolor="#373737" id="txt4" height="24">              		
					<div id="ventaPedidoId" >
	              	    &nbsp;       		 
	              		<a href="#" onclick="ingreso_encargo();" title="Ingreso de Encargo" >	      					
	      					<img src="images/foto.jpg" width="15" height="15" border="0" >
	    				</a>
    				</div>
    			</td>             	
              	<td align="right" bgcolor="#373737" id="txt4">
              		<a href="#" onclick="insertar_contactologia();">
      						<img src="images/check.png" width="15" height="15" border="0" title="Ingreso de Contactología" >
    				</a>
    			</td>
    			<td width="30" align="right" bgcolor="#373737" id="txt4" >
    				<a href="#" onclick="cerrarVentana()">
      						<img src="images/cancel.png" width="15" height="15" border="0" title="Salir" >
    				</a>
    			</td>
              </tr>
</table>
<table cellspacing="1" width="100%" border="0">
	
	<tr>
		<td id="txt5" bgcolor="#c1c1c1" width="29"><bean:message key="cliente.graduacion.cliente"/></td>
		<td id="txt5" bgcolor="#c1c1c1" colspan="13">
			<html:text property="nombre_cliente" styleId="nombre_cliente" size="30" styleClass="fto"/>
			<a href="#" onclick="">
      			
    		</a>
		</td>
	</tr>
	<tr>
		<td colspan="14" align="left" bgcolor="#373737" id="txt4"><bean:message key="cliente.graduacion.graduacion"/></td>
	</tr>
	
  <tr>
	<td  id="txt5" bgcolor="#c1c1c1" width="40" style="width: 40px">&nbsp;</td>
	<td  id="txt5" bgcolor="#c1c1c1" ><bean:message	key="cliente.contactologia.radio1" /></td>
				<td id="txt5" bgcolor="#c1c1c1" width="80" style="width: 80px"><bean:message
						key="cliente.contactologia.radio2" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1" width="80" style="width: 80px"><bean:message
						key="cliente.contactologia.esfera" />
				</td>
				<td id="txt5" bgcolor="#c1c1c1" style="width: 92px" width="92"><bean:message
						key="cliente.contactologia.cilindro" />
				</td>
				<td  id="txt5" bgcolor="#c1c1c1" style="width: 80px" width="63"><bean:message key="cliente.contactologia.eje"/></td>
    <td  id="txt5" bgcolor="#c1c1c1" width="50"  width="80" style="width: 80px"><bean:message key="cliente.contactologia.diametrot"/></td>
    <td  id="txt5" bgcolor="#c1c1c1"  width="80" style="width: 80px"><bean:message key="cliente.contactologia.diaz0"/></td>
    <td  id="txt5" bgcolor="#c1c1c1" colspan="2" width="250" style="width: 250px"><bean:message key="cliente.contactologia.bandas"/></td>
    
    <td  id="txt5" bgcolor="#c1c1c1" width="80" style="width: 80px"><bean:message key="cliente.contactologia.radio3"/></td>
    <td  id="txt5" bgcolor="#c1c1c1" width="80" style="width: 80px"><bean:message key="cliente.contactologia.diametrop"/></td>
    <td  id="txt5" bgcolor="#c1c1c1" width="80" style="width: 80px"><bean:message key="cliente.contactologia.color"/></td>
    <td  id="txt5" bgcolor="#c1c1c1" width="80" style="width: 80px"><bean:message key="cliente.contactologia.adic"/></td>
  </tr>
  <tr>
    <td id="txt5" bgcolor="#c1c1c1" width="40" style="width: 40px" ><bean:message key="cliente.graduacion.od"/></td>
    <td id="txt5" bgcolor="#c1c1c1" ><html:text property="o_radio1" onblur=" validaRadio1(this,'derecho');" maxlength="5" size="5" styleId="o_radio1" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="77"><html:text property="o_radio2" onblur=" validaRadio2(this,'derecho');"  maxlength="5"  size="5" styleId="o_radio2" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="77"><html:text property="o_esfera" onblur=" validaEsfera(this,'derecha');" size="5" maxlength="5"  styleId="o_esfera" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="92"><html:text property="o_cilindro" onblur=" validaCilindro(this, 'derecho');"  maxlength="5"  size="5" styleId="o_cilindro" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="63"><html:text property="o_eje" onblur="validaEje(this, 'derecho');"   maxlength="5"  size="5" styleId="o_eje" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="o_diamt" onblur="validaDiamT(this, 'derecho')"  maxlength="5"  styleId="o_diamt"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="o_diaz" onblur="validaDiaZ(this,'derecho');" styleId="o_diaz" maxlength="5"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"  colspan="2"  ><html:text
							property="o_bandas" onblur="validaBandasP(this,'derecho');"
							maxlength="5" styleId="o_bandas" size="19" styleClass="fto" />
					</td>
    
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="o_radio3" onblur="validaRadio3(this, 'derecho');"  maxlength="5"  styleId="o_radio3"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="o_diamp" onblur="validaDiamP(this, 'derecho');"  maxlength="5"  styleId="o_diamp"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="o_colo" onblur="this.value=this.value.toUpperCase();"  maxlength="5"  styleId="o_colo"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="o_adic" onblur="validaAdicion(this, 'derecho');this.value=this.value.toUpperCase();" maxlength="5"  styleId="o_adic"  size="5" styleClass="fto"/></td>
  </tr>
  
  <tr>
    <td id="txt5" bgcolor="#c1c1c1" width="29"><bean:message key="cliente.graduacion.oi"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="80"><html:text property="i_radio1" onblur=" validaRadio1(this,'izquierdo');"   maxlength="5"  size="5" styleId="i_radio1" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="77"><html:text property="i_radio2" onblur=" validaRadio2(this,'izquierdo');"     maxlength="5"  size="5" styleId="i_radio2" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="77"><html:text property="i_esfera"  onblur=" validaEsfera(this,'izquierda');"  maxlength="5"  size="5" styleId="i_esfera" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="92"><html:text property="i_cilindro"  onblur=" validaCilindro(this, 'izquierdo');"  maxlength="5"   size="5" styleId="i_cilindro" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1" width="63"><html:text property="i_eje" onblur="validaEje(this, 'izquierdo');"  styleId="i_eje"  maxlength="5"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="i_diamt" onblur="validaDiamT(this, 'izquierdo')"  styleId="i_diamt" maxlength="5"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="i_diaz"  onblur="validaDiaZ(this,'izquierdo');"   styleId="i_diaz"  maxlength="5" size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"  colspan="2" ><html:text
							property="i_bandas" onblur="validaBandasP(this,'izquierdo');"
							styleId="i_bandas" maxlength="5" size="19" styleClass="fto" />
					</td>
    
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="i_radio3"  onblur="validaRadio3(this, 'izquierdo');"   maxlength="5"  styleId="i_radio3"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="i_diamp"  onblur="validaDiamP(this, 'izquierdo');"   maxlength="5" styleId="i_diamp"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="i_colo" onblur="this.value=this.value.toUpperCase();" maxlength="5"    styleId="i_colo"  size="5" styleClass="fto"/></td>
    <td id="txt5" bgcolor="#c1c1c1"><html:text property="i_adic"  onblur="validaAdicion(this, 'izquierdo');this.value=this.value.toUpperCase();"  maxlength="5"  styleId="i_adic"  size="5" styleClass="fto"/></td>    
  </tr>  
</table>



<table width="100%" border="0" cellspacing="0">
	<tr>
		<td id="txt4" bgcolor="#373737">
			<bean:message key="cliente.graduacion.historico"/>
		</td>
		<td id="txt4" bgcolor="#373737">
			
		</td>
		<td id="txt4" bgcolor="#373737" >
		</td>
	</tr>
	
	<tr>
	
		<th id="txt5" bgcolor="#c1c1c1" width="200" height="50" style="width: 200px; height: 50px" >
			<table width="100%" cellspacing="0">
				<tr>
					<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="cliente.graduacion.fecha" /></td>
					<td scope="col" id="txt4" bgcolor="#373737"><bean:message key="cliente.graduacion.numero" /></td>
					<td scope="col" id="txt4" bgcolor="#373737">&nbsp;Detalle</td>
				</tr>
			</table>
			<div id="scroll_historico" style="width: 200px;  height: 150">
			<% int i=1; %>
				<table width="100%" height="100%">
					<logic:present property="listaContactologia"
						name="contactologiaForm">
					<logic:iterate id="listaContactologia"  property="listaContactologia" name="contactologiaForm">
					<bean:define id="numero" type="String">
							<bean:write name="listaContactologia" property="numero" />
						</bean:define>
						<bean:define id="fecha" type="String">
							<bean:write name="listaContactologia" property="fecha" />
						</bean:define>
					<tr>
							<td scope="col" id="txt5" bgcolor="#c1c1c1" width="40%">
							<bean:write name="listaContactologia" property="fecha" /></td>
							<td  scope="col" id="txt5" bgcolor="#c1c1c1"  align="center" width="40%"><bean:write name="listaContactologia" property="numero" /></td>
							<td scope="col" id="txt5" bgcolor="#c1c1c1" width="" align="left">
								<a href="#" onclick="ver_graduacion('${numero}','${fecha}')">
									ver
								</a>
							</td>
						</tr>
						<%i++; %>
					
					</logic:iterate>					
					</logic:present>
				
				</table>
			</div>
			
		</th>
		
		
		<th id="txt5" bgcolor="#c1c1c1" >
			<table width="100%" height="100%" cellspacing="0" >
				<tr>
			   		<td id="txt5" bgcolor="#c1c1c1" >Optometría</td>
				    <td id="txt5" bgcolor="#c1c1c1" colspan="5" >
					    <html:text property="nifdoctor" name="contactologiaForm" styleId="nifdoctor" styleClass="fto" size="10" maxlength="10" /> 
						-
					<html:text property="dvnifdoctor" size="2" readonly="true" styleClass="fto" styleId="dvnifdoctor" />
					
					<a href="#" onclick="javascript:buscarDoctorAjax();"  > <img
						src="images/luparapida.jpg" width="15" height="15" border="0"
						title="Busqueda rápida de cliente"> </a> 
					<a href="#" onclick="javascript:buscarMedico();"
					title="Busqueda de Doctor"> <img src="images/lupa.png"
						width="15" height="15" border="0"> </a>
			<!-- 	<a href="#" onclick="javascript:nuevoDoctor();" id="imagen1" style="display: " > <img
						src="images/nuevo.png" width="15" height="15" border="0"
						title="Ingreso de nuevo doctor"> </a> -->	 		    
				    </td>
				  			    
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" >Nombre Optometría:</td>
			   		<td id="txt5" bgcolor="#c1c1c1"  colspan="5">
			   			<div id="nombre_doctorDIV"><bean:write name="contactologiaForm"  property="nombre_doctor"/></div>
			   		</td>
				   
				</tr>
				<tr>
					<td  id="txt5" bgcolor="#c1c1c1" >
						Otros Datos
					</td>
					<td colspan="5" id="txt5" bgcolor="#c1c1c1" >
						<html:text property="otros"  styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"></html:text>
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" >
						Laboratorio
					</td>
					<td colspan="5" id="txt5" bgcolor="#c1c1c1" >
						<html:text property="laboratorio" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"></html:text>
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" >
						1º Revisión
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						<html:text property="revision1" readonly="true" styleClass="fto" styleId="revision1" ></html:text>
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>					
					<td id="txt5" bgcolor="#c1c1c1" >
						Cálculo Optom.
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						<html:text property="calculo_opt" size="7"  styleClass="fto"></html:text>
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" >
						Fecha Encargo
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
					<html:text property="fecha_pedido" readonly="true" styleId="fechapedido" styleClass="fto"></html:text>
								</td>
					<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						Fecha Recepción
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						<html:text property="fecha_recepcion" size="7"  readonly="true" styleId="fecha_recepcion"  styleClass="fto"></html:text>
					</td>
				</tr>
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" >
						Fecha Entrega
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						<html:text property="fecha_entrega"  readonly="true" styleId="fecha_entrega"  styleClass="fto"></html:text>
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >&nbsp;</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						Seguro<html:checkbox property="seguro" value="S" ></html:checkbox>
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						Fecha Caducidad
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						<html:text property="fecha_caducidad" styleId="fecha_caducidad" readonly="true"  size="7"  styleClass="fto"></html:text>
					</td>
				</tr>
				<tr   >
					<td id="txt5" bgcolor="#c1c1c1" >
						</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						
					</td>
					<td id="txt5" bgcolor="#c1c1c1" >
						</td>
					<td id="txt5" bgcolor="#c1c1c1" >
					</td>
				</tr>
				
				<tr>
					<td id="txt5" bgcolor="#c1c1c1" >
						Recomendaciones
					</td>
					<td colspan="5">
						<html:text property="recomendaciones" styleClass="fto" onblur="javascript:this.value=this.value.toUpperCase();"></html:text>
					</td>
				<tr>
			</table>			
		</th>
		
		
		<th id="txt5" bgcolor="#c1c1c1">
			<table width="3%" height="100%" border="0" cellspacing="0">
				<tr>
					<td id="txt5" bgcolor="#c1c1c1"></td>
				</tr>
				<tr>
					<td  id="txt5" bgcolor="#c1c1c1">
							
					</td>
				</tr>
				<tr>
		
				
			</table>
		</th>		
	
	</tr>
</table>
</div>
</html:form>
</body>
</html:html>