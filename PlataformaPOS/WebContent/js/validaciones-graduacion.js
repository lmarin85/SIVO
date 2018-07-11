function trim(s){
	s = s.replace(/\s+/gi, ''); //sacar espacios revalidaDNPCpetidos dejando solo uno
	s = s.replace(/^\s+|\s+$/gi, ''); //sacar espacios blanco principio y final
	return s;
}

function validaInformacion(){
	
	var nombre_cliente = document.getElementById('nombre_cliente').value;
	nombre_cliente = trim(nombre_cliente);
	
	if("" == nombre_cliente){
		alert("Debe ingresar cliente");
		return false;
	}
	
	var codigo_cliente = document.getElementById('codigo_cliente').value;
	codigo_cliente = trim(codigo_cliente);
	
	if("" == codigo_cliente || 0 == codigo_cliente || "0" == codigo_cliente){
		
		if(0 == codigo_cliente || "0" == codigo_cliente){
			alert("Debe buscar un cliente");
		}else{
			alert("Debe ingresar un cliente");
		}
		
		return false;
	}
	
	var doctor = document.getElementById('doctor').value;
	if("" == doctor){
		alert("Debe ingresar un doctor");
		return false;		
	}
	
	var agente = document.getElementById('agente').value;
	if(-1 == agente){
		alert("Debe Seleccionar agente");
		return false;		
	}
	
	var fechaEmision = document.getElementById('fechaEmision').value;
	fechaEmision = trim(fechaEmision);
	if("" == fechaEmision){
		alert("Debe ingresar fecha emisi\u00F3n");
		return false;
	}
	
	var OD_cantidad = document.getElementById('OD_cantidad').value;
	OD_cantidad = trim(OD_cantidad);
	if("" != OD_cantidad  && "-1" != OD_cantidad ){
		
		var OD_base = document.getElementById('OD_base').value;
		if("" == OD_base  || "Seleccione" == OD_base ){
			alert("Debe seleccionar Base de Prisma Derecho");
			return false;
		}
		
	}
	
	var OI_cantidad = document.getElementById('OI_cantidad').value;
	OI_cantidad = trim(OI_cantidad);
	if("" != OI_cantidad  && "-1" != OI_cantidad ){
		
		var OI_base = document.getElementById('OI_base').value;
		if("" == OI_base  || "Seleccione" == OI_base ){
			alert("Debe seleccionar Base de Prisma Izquierdo");
			return false;
		}
		
	}
	
	var OD_base = document.getElementById('OD_base').value;
	if("" != OD_base  &&  "Seleccione" != OD_base ){
		var OD_cantidad = document.getElementById('OD_cantidad').value;		
		if("" == OD_cantidad  || "-1" == OD_cantidad ){
			alert("Debe seleccionar Cantidad de Prisma Derecho");
			return false;
		}
	}
	
	var OI_base = document.getElementById('OI_base').value;
	if("" != OI_base  &&  "Seleccione" != OI_base ){
		var OI_cantidad = document.getElementById('OI_cantidad').value;
		if("" == OI_cantidad  || "-1" == OI_cantidad ){
			alert("Debe seleccionar Cantidad de Prisma Izquierdo");
			return false;
		}
	}
	
	
	
	return true;
}

function validaGraduacion(){
	
	/********* VALIDACIONES OJO DERECHO ********/
	var esferaD = document.getElementById('OD_esfera').value;
	esferaD = trim(esferaD);	
	var cilindroD = document.getElementById('OD_cilindro').value;
	cilindroD = trim(cilindroD);	
	var ejeD = document.getElementById('OD_eje').value;
	ejeD = trim(ejeD);
			
	var adicionD = document.getElementById('OD_adicion').value;
	adicionD = trim(adicionD);
	
	var OD_dnpl = document.getElementById('OD_dnpl').value;
	OD_dnpl = trim(OD_dnpl);
	
	
	
	if("" != esferaD && null != esferaD){
		if(esferaD < -30 || esferaD >30){
			alert("El valor esfera derecha esta fuera del rango permitido -30 y 30");
			return false;
		}		
	}else{
		alert("Debe ingresar esfera derecha.");
		return false;
	}	
	
	
	if("" != cilindroD && null != cilindroD){		
		if(cilindroD < -8  || cilindroD > 8){
			alert("El valor cilindro derecho esta fuera de rango");
			return false;
		}		
	}else{
		alert("Debe ingresar valor del cilindro derecho");
		return false;
	}
	
	
	var intCilindro = parseInt(cilindroD);
	if((cilindroD != "" && null != cilindroD) && (0.00 != parseFloat(cilindroD) && 0 != parseFloat(cilindroD)) ){
		if("" == ejeD || null == ejeD){
			alert("Debe ingresar eje derecho");
			return false;
		}
	}
	
	
	if(ejeD != "" && null != ejeD){
		if("" == cilindroD || null == cilindroD){
			alert("Debe ingresar cilindro derecho");
			return false;
		}
	}	
	if("" != ejeD && null != ejeD){
		if(ejeD < 0 || ejeD >180){
			alert("El valor del eje derecho esta fuera de rango");
			return false;
		}
	}
	
	
	if("" != adicionD && null != adicionD){
		if(adicionD < 0.50 || adicionD >4){
			alert("El valor de la adicion derecha esta fuera de rango");
			return false;
		}
	}
	
	if("" == OD_dnpl || null == OD_dnpl){
		alert("Debe ingresar distancia naso pupilar derecha.");
		return false;
	}else{
		var respuesta = validaDNPL(document.getElementById('OD_dnpl'), "derecha");
		if(respuesta == false){
			return false;
		}
	}
	
	
	
	/********* FIN VALIDACIONES OJO DERECHO ********/
	
	
	
	/********* VALIDACIONES OJO IZQUIERDO ********/
	
	var esferaI = document.getElementById('OI_esfera').value;
	esferaI = trim(esferaI);		
	var cilindroI = document.getElementById('OI_cilindro').value;
	cilindroI = trim(cilindroI);	
	var ejeI = document.getElementById('OI_eje').value;
	ejeI = trim(ejeI);	
	var adicionI = document.getElementById('OI_adicion').value;
	adicionI = trim(adicionI);	
	var OI_dnpl = document.getElementById('OI_dnpl').value;
	OI_dnpl = trim(OI_dnpl);
	
	if("" != esferaI && null != esferaI){
		if(esferaI < -30 || esferaI >30){
			alert("El valor esfera izquierda esta fuera de rango");
			return false;
		}	
	}else{
		alert("Debe ingresar esfera izquierda.");
		return false;
	}
	
	if("" != cilindroI && null != cilindroI){		
		if(cilindroI < -8  || cilindroI > 8){
			alert("El valor cilindro izquierdo esta fuera de rango");
			return false;
		}		
	}else{
		alert("Debe ingresar valor del cilindro izquierdo");
		return false;
	}
	
	if(cilindroI != "" && null != cilindroI && (0.00 != parseFloat(cilindroI) && 0 != parseFloat(cilindroI))){
		if("" == ejeI || null == ejeI){
			alert("Debe ingresar eje izquierdo");
			return false;
		}
	}	
	
	if(ejeI != "" && null != ejeI){
		if("" == cilindroI || null == cilindroI){
			alert("Debe ingresar cilindro izquierdo");
			return false;
		}
	}
	if("" != ejeI && null != ejeI){
		if(ejeI < 0 || ejeI >180){
			alert("El valor del eje izquierdo esta fuera de rango");
			return false;
		}
	}
	
	
	if("" != adicionI && null != adicionI){
		if(adicionI <= 0 || adicionI >4){
			alert("El valor de la adicion izquierda esta fuera de rango");
			return false;
		}
	}
	
	if("" == OI_dnpl || null == OI_dnpl){
		alert("Debe ingresar distancia naso pupilar izquierda.");
		return false;
	}else{
		var respuesta = validaDNPL(document.getElementById('OI_dnpl'), "izquierda");
		if(respuesta == false){
			return false;
		}
	}
	
	var respuestadnpc = validaDNPC(document.getElementById('OD_dnpc'), "derecha");
	if(respuestadnpc == false){
		return false;
	}
	
	/********* FIN VALIDACIONES OJO IZQUIERDO ********/
	
	
	
	
	var fechaProxRevision = document.getElementById('fechaProxRevision').value;
	var fechaEmision = document.getElementById('fechaEmision').value;
		
	fechaEmision = trim(fechaEmision);
	if("" == fechaEmision){
		alert("Debe ingresar fecha de emisi\u00F3n");
		return false;
	}
	
	fechaProxRevision = trim(fechaProxRevision);
	if("" == fechaProxRevision){
		alert("Debe ingresar fecha de revisi\u00F3n");
		return false;
	}
	
	return true;//CAMBIAR  a true
}

function validaEsfera(elemento, lado){
	
	var esfera = elemento.value;	
		esfera = trim(esfera);
		var mult = 0.25;
		var cont = 0;
		if("" != esfera){
			if(esfera >= -30 && esfera <= 30){
				esfera = parseFloat(elemento.value).toFixed(2);
				if (esfera%mult!=0){			 
					 while((esfera%mult!=0) && (cont < 55)){
						 
						 if(esfera > 0){				 
							 esfera = parseFloat(esfera) + 0.01;
						 }else{
							 esfera = parseFloat(esfera) + (-0.01);
						 }
						 esfera = parseFloat(esfera.toFixed(2));
						 cont++;
					 }				
					 elemento.value=esfera.toFixed(2);
						 if("derecha" == lado){
							 var elementoadicion = document.getElementById('OD_adicion');
							 validaAdicion(elementoadicion, lado);
						 }else if("izquierda" == lado){
							 var elementoadicion = document.getElementById('OI_adicion');
							 validaAdicion(elementoadicion, lado);
						 }
				}else{			
					 elemento.value = esfera;	
					 if("derecha" == lado){
						 var elementoadicion = document.getElementById('OD_adicion');
						 validaAdicion(elementoadicion, lado);
					 }else if("izquierda" == lado){
						 var elementoadicion = document.getElementById('OI_adicion');
						 validaAdicion(elementoadicion, lado);
					 }
				}
			}else{
				alert("El valor esfera "+lado+" esta fuera del rango permitido -30 y 30");
				elemento.value = "";
				//elemento.focus();
			}
		}else{
			esfera = 0;
			alert("Debe ingresar valores entre -30 y 30");
			elemento.value = "";
			//elemento.value = parseFloat(esfera).toFixed(2);
			//elemento.focus();
		}		
}

function validaCilindro(elemento, lado){
	
	var cilindro = elemento.value;	
		cilindro = trim(cilindro);
		var mult = 0.25;
		var cont = 0;
		
		if("" != cilindro){
			if(cilindro >= -8 && cilindro <= 8){
				cilindro = parseFloat(elemento.value).toFixed(2);
				if (cilindro%mult!=0){			 
					 while((cilindro%mult!=0) && (cont < 55)){				 
						 
						 if(cilindro > 0){
							 cilindro = parseFloat(cilindro) + 0.01;
						 }else{
							 cilindro = parseFloat(cilindro) + (-0.01);
						 }
						 cilindro = parseFloat(cilindro.toFixed(2));
						 cont++;
					 }				 
					 elemento.value=cilindro.toFixed(2);
				}else{			
					 elemento.value = cilindro;			
				}
			}else{
				alert("El valor cilindro "+lado+" esta fuera del rango permitido -8 y 8");
				elemento.value = "";
				//elemento.focus();
			}
		}else{
			cilindro = 0;
			alert("Debe ingresar valores entre -8 y 8");
			elemento.value = "";
			//elemento.value = parseFloat(cilindro).toFixed(2);
			//elemento.focus();
		}
		
		var intCilindro = cilindro;			
		if(((intCilindro >= -8 && intCilindro < 0) || (intCilindro > 0 && intCilindro <= 8)) || (intCilindro >= -8.00 && intCilindro < 0.00) || (intCilindro > 0.00 && intCilindro <= 8.00) ){
			
			if(lado == 'derecho'){				
				document.getElementById('OD_eje').disabled =false;				
			}else if(lado == 'izquierda'){
				document.getElementById('OI_eje').disabled =false;
			}			
		}else{
			
			if(lado == 'derecho'){				
				document.getElementById('OD_eje').value="";
				document.getElementById('OD_eje').disabled =true;			
			}else if(lado == 'izquierda'){				
				document.getElementById('OI_eje').value="";
				document.getElementById('OI_eje').disabled =true;
			}
		}
		
}

function validaEje(elemento, lado){
	
	var eje = elemento.value;	
	eje = trim(eje);
	if("" != eje){		
		var esnumero = validarSiNumero(eje);
		
		if(true == esnumero){
			if(eje < 0 || eje >180){
				alert("El valor del eje "+lado+" esta fuera de rango");
				eje = 0;
				elemento.value = "";
			}
		}else{
			alert("Debe ingresar solo n\u00FAmeros entre 0 y 180");
		}		
	}	
}

function validaAdicion(elemento, lado){
	
	var esfera = 0;
	var dnpl = 0;
	var adicion = elemento.value;
	adicion = trim(adicion);
	
	if("derecha" == lado){	
		esfera = document.getElementById('OD_esfera').value;
		esfera = trim(esfera);
		dnpl = document.getElementById('OD_dnpl').value;
		dnpl = trim(dnpl);
		
	}else if("izquierda" == lado){
		esfera = document.getElementById('OI_esfera').value;
		esfera = trim(esfera);
		dnpl = document.getElementById('OI_dnpl').value;
		dnpl = trim(dnpl);
	}
	
	
	if("" != esfera){		
		if("derecha" == lado){	
			esfera = parseFloat(document.getElementById('OD_esfera').value).toFixed(2);
			if("" != adicion){
				if(adicion >0 && adicion <=4){
					var cerca = parseFloat(adicion) + parseFloat(esfera);
					document.getElementById('OD_cerca').value = cerca.toFixed(2);
					elemento.value = parseFloat(adicion).toFixed(2);
					dnpl = document.getElementById('OD_dnpl');
					validaDNPL(dnpl, lado);
				}else{
					if(adicion <= 0 ){						
						alert("El valor de la adici\u00F3n no puede ser menor o igual a 0");
					}else{
						alert("El valor de la adici\u00F3n no puede ser mayor a 4");
					}
				}	
				
			}else{
				document.getElementById('OD_cerca').value="";				
				document.getElementById('OD_dnpl').value = "";
				document.getElementById('OD_dnpc').value = "";			
			}		
			
		}else if("izquierda" == lado){
			esfera = parseFloat(document.getElementById('OI_esfera').value).toFixed(2);
			if("" != adicion){
				if(adicion >0 && adicion <=4){
					var cerca = parseFloat(adicion) + parseFloat(esfera);
					document.getElementById('OI_cerca').value = cerca.toFixed(2);
					elemento.value = parseFloat(adicion).toFixed(2);
					dnpl = document.getElementById('OI_dnpl');
					validaDNPL(dnpl, lado);
				}else{
					if(adicion <= 0 ){						
						alert("El valor de la adici\u00F3n no puede ser menor o igual a 0");
					}else{
						alert("El valor de la adici\u00F3n no puede ser mayor a 4");
					}
					
				}					
			}else{
				document.getElementById('OI_cerca').value="";
				document.getElementById('OI_dnpl').value = "";
				document.getElementById('OI_dnpc').value = "";
			}			
		}	
	}else{
		alert("Debe ingresar esfera "+lado+"");		
	}
}

function validacionCerca(elemento, lado){
	
	var esfera = 0;
	var cerca = elemento.value;
	cerca = trim(cerca);
	
	if("derecha" == lado){	
		esfera = document.getElementById('OD_esfera').value;
		esfera = trim(esfera);
	}else if("izquierda" == lado){
		esfera = document.getElementById('OI_esfera').value;
		esfera = trim(esfera);
	}
	
	
	if("" != esfera){		
		if("derecha" == lado){	
			esfera = parseFloat(document.getElementById('OD_esfera').value).toFixed(2);
			if("" != cerca){
				if(cerca > esfera){
					var adicion = parseFloat(cerca) -  parseFloat(esfera);
					document.getElementById('OD_adicion').value = adicion.toFixed(2);
					elemento.value = parseFloat(cerca).toFixed(2);
					var dnpl = document.getElementById('OD_dnpl');
					validaDNPL(dnpl, lado);
				}else{
					alert("El valor de esfera de cerca no puede ser menor o igual a esfera");
				}	
				
			}		
			
		}else if("izquierda" == lado){
			esfera = parseFloat(document.getElementById('OI_esfera').value).toFixed(2);
			if("" != cerca){
				if(cerca > esfera){
					var adicion = parseFloat(cerca) -  parseFloat(esfera);
					document.getElementById('OI_adicion').value = adicion.toFixed(2);
					elemento.value = parseFloat(cerca).toFixed(2); 
					var dnpl = document.getElementById('OI_dnpl');
					validaDNPL(dnpl, lado);
				}else{
					alert("El valor de esfera de cerca no puede ser menor o igual a esfera");
				}				
			}	
			
		}	
	}else{
		alert("Debe ingresar esfera "+lado+"");
	}
	
}

function validaDNPL(elemento, lado){
	
	var dnpl = elemento.value;
	dnpl = trim(dnpl);
	
	if("" != dnpl){
		if(dnpl >= 20 && dnpl <= 40){
			
			dnpl = parseFloat(elemento.value).toFixed(2);		
			if("derecha" == lado){			
				var res = parseFloat(dnpl) - parseFloat(1);
				var adicion = document.getElementById('OD_adicion').value;
				if("" != adicion){
					document.getElementById('OD_dnpc').value = parseFloat(res).toFixed(2);
				}else{
					document.getElementById('OD_dnpc').value="";
				}
				elemento.value = parseFloat(dnpl).toFixed(2);
				return true;
			}else if("izquierda" == lado){
				var res = parseFloat(dnpl) - parseFloat(1);				
				var adicion = document.getElementById('OI_adicion').value;
				if("" != adicion){
					document.getElementById('OI_dnpc').value = parseFloat(res).toFixed(2);
				}else{
					document.getElementById('OI_dnpc').value="";
				}				
				elemento.value = parseFloat(dnpl).toFixed(2);
				return true;	
			}
		}else{			
			alert("Distancia Naso pupilar, valor está fuera de rango");
			return false;	
		}
	}else{		
		if("derecha" == lado){
			document.getElementById('OD_dnpc').value="";
		}else if("izquierda" == lado){
			document.getElementById('OI_dnpc').value="";
		}
		return false;	
	}	
		
}

function validaDNPC(elemento, lado){
	
	var dnpc = elemento.value;
	dnpc = trim(dnpc);
	
	if("" != dnpc){
		if(dnpc >= 20 && dnpc <= 40){
		
			if("derecha" == lado){			
				var adicion = document.getElementById('OD_adicion').value;
				adicion = trim(adicion);
				if("" == adicion){
					alert("Debe ingresar receta de cerca");
					document.getElementById('OD_dnpc').value="";
					return false;
				}
				
			}else if("izquierda" == lado){
				var adicion = document.getElementById('OI_adicion').value;
				adicion = trim(adicion);
				if("" == adicion){
					alert("Debe ingresar receta de cerca");
					document.getElementById('OI_dnpc').value="";
					return false;
				}
			}		
		
		}else{
			alert("Distancia Naso pupilar cerca, valor está fuera de rango");
			return false;	
		}
	}	
	return true;
}

function validarSiNumero(numero){
    if (!/^([0-9])*$/.test(numero)){    	
    	return false;
    }else{
    	return true;
    }
}


function limpiar_pantalla(){
	
	document.getElementById('OD_esfera').value = "";				
	document.getElementById('OD_cilindro').value = "";				
	document.getElementById('OD_eje').value = "";	
	document.getElementById('OD_cerca').value = "";			
	document.getElementById('OD_adicion').value = "";	
	document.getElementById('OD_dnpl').value = "";
	document.getElementById('OD_dnpc').value = "";
	document.getElementById('OD_avsc').value = "";
	document.getElementById('OD_avcc').value = "";
	
				
	document.getElementById('OI_esfera').value = "";				
	document.getElementById('OI_cilindro').value = "";				
	document.getElementById('OI_eje').value = "";
	document.getElementById('OI_cerca').value = "";						
	document.getElementById('OI_adicion').value = "";
	document.getElementById('OI_dnpl').value = "";
	document.getElementById('OI_dnpc').value = "";
	document.getElementById('OI_avsc').value = "";
	document.getElementById('OI_avcc').value = "";
	
	document.getElementById('OD_cantidad').value = "";
	document.getElementById('OD_base').value = "";
	document.getElementById('OD_altura').value = "";
	
	document.getElementById('OI_cantidad').value = "";
	document.getElementById('OI_base').value = "";
	document.getElementById('OI_altura').value = "";
	
}

function valida_informacion_doctor(){
	
	var rut = document.getElementById('rut').value;
	rut = trim(rut);
	
	var apellidos = document.getElementById('apellidos').value;
	apellidos = trim(apellidos);
	
	var nombres = document.getElementById('nombres').value;
	nombres = trim(nombres);
	
	var provincia = document.getElementById('provincia').value;
	
	if(""==rut){
		alert("Debe ingresar rut");
		return false;
	}
	
	if(""==apellidos){
		alert("Debe ingresar apellido");
		return false;
	}
	
	if(""==nombres){
		alert("Debe ingresar nombre");
		return false;
	}
	
	if(provincia == -1){
		alert("Debe seleccionar provincia");
		return false;
	}
	
	return true;
}
