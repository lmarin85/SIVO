function cargaGiro(giro){ 
	document.getElementById('descripcionGiroDIV').innerHTML ="";
	document.getElementById("giroID").value=giro[0];
	var Seccion = document.getElementById('descripcionGiroDIV');	
	Seccion.style.display="";
 	document.getElementById('descripcionGiroDIV').innerHTML=giro[1];
 	document.getElementById('descripcionGiro').value = giro[1];
	
}
		
function cargaCliente(cliente)
{				
	document.getElementById("clienteagregadoId").value = cliente[0];
	document.getElementById("nifagregadoId").value = cliente[1];
	document.getElementById('accion').value = "traeClienteSeleccionado";
	
	document.forms[0].submit();

}

function cargaClienteFactura(cliente)
{				
	document.getElementById("clienteagregadoId_factura").value = cliente[0];
	document.getElementById("nifagregadoId_factura").value = cliente[1];
	document.getElementById('accion').value = "traeClienteSeleccionadoFactura";
	document.forms[0].submit();

}

function insetar_cliente(tipo)
{
	//VALIDACIONES 20140811	
	var $j = jQuery.noConflict();
	var val_letras = /^[A-Z a-z��]{3,50}$/;
	var val_telefono = /^[0-9]{6,10}$/;
	var val_telefono_movil = /^[0-9]{11}$/;
	var val_email  = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var val_rut = /^[0-9]{1,12}$/;
	var val_dv = /^[0-9Kk]{1}$/;
	var fnac = /^[0-9\/]{10}$/; 
	var num_dir = /^[0-9]{3,5}$/;
	
	var errores = [];
		
	if(val_dv.test(dv) == true){
		dv = dv.toUpperCase();					
		if(dvval(rut) != dv){
			alert("Debe Ingresar RUT Valido");
			return;
		}
	}
	
	var rut = $j('#rut').val();					
	var dv = $j('#dv').val();
	var apellido  = $j('#apellido').val();
	var nombre  = $j('#nombre').val();
	var agente = $j('#agente').val();
    var direccion = $j('#direccion').val();
    var numero = $j('#numero').val();
	var telefono = $j('#telefono').val();
	var telefono_movil = $j('#telefono_movil').val();
	var genero = $j("input:radio[name=sexo]:checked","#form_cliente").val();
	var genero_val = (genero == "" || typeof(genero) == "undefined") ? "1" : "2";
	var email = $j('#email').val();
	var fnacimiento = $j('#fnacimiento').val();
	var provincia = $j("#provincia").val();
								
	var cambioPag = true;
	
	if(val_rut.test(rut) == false){
		errores[errores.length] = "Debe Ingresar un RUT";
		document.getElementById('rut').focus();
		cambioPag=false;
	}else if(val_dv.test(dv) == false){
		errores[errores.length] = "Debe Ingresar Digito Verificador";
		document.getElementById('dv').focus();
		cambioPag=false;
	}else if(val_letras.test(apellido) == false && !$j('#apellido').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar los Apellidos del Cliente.";
		document.getElementById('apellido').focus();
		cambioPag=false;
	}else if(val_letras.test(nombre) == false && !$j('#nombre').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar el Nombre del Cliente.";
		document.getElementById('nombre').focus();
		cambioPag=false;
	}else if(0 == agente){
		errores[errores.length] = "Debe Ingresar Agente.";
		document.getElementById('agente').focus();
		cambioPag = false;
	}else if(val_telefono.test(telefono) == false && !$j('#telefono').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar Tel\u00E9fono.";
		document.getElementById('telefono').focus();
		cambioPag = false;
	}else if(val_telefono_movil.test(telefono_movil) == false && !$j('#telefono_movil').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar Tel\u00E9fono M�vil (569XXXXXXXX).";
		document.getElementById('telefono_movil').focus();
		cambioPag = false;
	}else if(val_email.test(email) == false && !$j('#email').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar un email v�lido.";
		document.getElementById('email').focus();
		cambioPag = false;
	}else if(genero_val == "1"){
		errores[errores.length] = "Debe Ingresar el g�nero del cliente.";
		cambioPag = false;
	}else if(fnac.test(fnacimiento) == false && !$j('#fnacimiento').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar la Fecha de Nacimiento.";
		cambioPag = false;
		$j("#fnacimiento").val("");
	}/*else if(val_letras.test(direccion) == false && !$j('#direccion').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar una dirección válida.";
		cambioPag = false;
	}*/else if(num_dir.test(numero) == false && !$j('#numero').hasClass("bloq")){
		errores[errores.length] = "Debe Ingresar el número de la dirección.";
		cambioPag = false;
	}else if(provincia == "0"  && !$j('#provincia').hasClass("bloq")){
		errores[errores.length] = "Debe seleccionar una provincia.";
		cambioPag = false;
	}
	
	//COMPRUEBO QUE AL MENOS ESTE UN CHECK ACTIVO 
	var cz = 0;
	$j(".hmk:checked").each(function(z){
		cz++;
	});
	if(cz == 0){
		errores[errores.length] = "Debe seleccionar al menos una opci�n de la secci�n Marketing.";
		cambioPag = false;
	}
	
	var agente_sucursal = $j('#agente_sucursal').val();
	var agente = $j('#agente').val();	
	var estado_pagina = $j('#estado_pagina').val();
	
	if(cambioPag == true){
		if("traeClienteSeleccionado" == estado_pagina){
			alert("Debe habilitar campos para modificar cliente");
			cambioPag = false;
		}
	}
	
	if(cambioPag == true){
		cambioPag = validaUsuarioFactura();
	}
	//Esto se modificar� por el agente en blanco cuando el usuario presione modificar
	/*if("traeClienteSeleccionado" == estado_pagina){
		
		if(agente_sucursal != agente){
			alert("Debe Modificar el agente");
			cambioPag = false;
		}					
	}*/
	var pagina_status = $j("#pagina_status").val();	
	var texto = "";
	
	//FINAL
	
	var valerror = false ;
	if (errores.length > 0) {
		  mostrarErrores(errores);
		  valerror  = false;
	}else{
		  valerror  = true;
	}
	
	if( valerror == true){
		if(cambioPag == true){
			if("nuevo" == pagina_status){
				texto = "�Realmente desea ingresar el cliente?";
			}else{
				texto = "�Realmente desea modificar el cliente?";
			}
			var respuestac = confirm(texto);
			if(respuestac){
				document.getElementById('accion').value = tipo;
				document.forms[0].submit();
				$j("input[type=text],select").prop("disabled",false);
				//SE DEJAN CHEKEADOS LOS CHECKBOX
				$j(".delem,.hmk").attr("disabled",false);
				$j(".delem").each(function() {
					   $j(this).click();
				});
				
				$j.cookie("venta_directa","0");
				
			}
		}
	}
}

function validaUsuarioFactura(){
	
	var rut = document.getElementById('rut').value;				
	rut  = trim(rut);				
	var dv = document.getElementById('dv').value;
	dv = trim(dv);
	
	var remitenteId = document.getElementById("remitenteId").value;
	remitenteId = trim(remitenteId);
	var dvFactura = document.getElementById("dvFactura").value;
	dvFactura = trim(dvFactura);
	var giroID = document.getElementById("giroID").value;
	giroID = trim(giroID);
	var codigo_cliente_agregado_factura = document.getElementById("codigo_cliente_agregado_factura").value;
	codigo_cliente_agregado_factura = trim(codigo_cliente_agregado_factura);
	var nif_cliente_agregado_factura = document.getElementById("nif_cliente_agregado_factura").value;
	var tipo_via_factura = document.getElementById("tipo_via_factura").value;
	tipo_via_factura = trim(tipo_via_factura);
	var via_factura = document.getElementById("via_factura").value;
	via_factura = trim(via_factura);
	var numero_factura = document.getElementById("numero_factura").value;
	numero_factura = trim(numero_factura);
	var localidad_factura = document.getElementById("localidad_factura").value;
	localidad_factura = trim(localidad_factura);
	var provincia_factura = document.getElementById("provincia_factura").value;
	provincia_factura = trim(provincia_factura);
	
	var descripcionGiro = document.getElementById('descripcionGiro').value;
	descripcionGiro = trim(descripcionGiro);
	
	
		if("" != remitenteId){
			if("" != codigo_cliente_agregado_factura){
				
				if(rut != remitenteId){			
					
					if("" == giroID){
						alert("Debe ingresar giro de factura");
						return false;
					}			
					if("" == tipo_via_factura || "0" == tipo_via_factura){
						alert("Debe agregar al cliente (Facturar A:) los campos obligatorios Tipo de v�a");
						return false;
					}
					if("" == via_factura || "0" == via_factura){
						alert("Debe agregar al cliente (Facturar A:) los campos obligatorios v�a");
						return false;
					}
					if("" == numero_factura){
						alert("Debe agregar al cliente (Facturar A:) los campos obligatorios n�mero");
						return false;
					}
					/*if("" == localidad_factura){
						alert("Debe agregar al cliente (Facturar A:) los campos obligatorios localidad");
						return false;
					}*/
					if("" == provincia_factura || "0" == provincia_factura){
						alert("Debe agregar al cliente (Facturar A:) los campos obligatorios provincia");
						return false;
					} 
					if("" == descripcionGiro){						
						alert("Debe agregar al cliente (Facturar A:) los campos obligatorios giro");						
						return false;
					}else{
						var giroID = document.getElementById("giroID").value;
						giroID = trim(giroID);
						if("" == giroID){
							alert("Debe ingresar informaci�n de giro y realizar su busqueda en el sistema");
						}
					}		
					
					return true;
				}else{
					
					var tipo_via = document.getElementById("tipo_via").value;
					tipo_via = trim(tipo_via);
					var via = document.getElementById("via").value;
					via = trim(via);
					var numero = document.getElementById("numero").value;
					numero = trim(numero);
					var localidad = document.getElementById("localidad").value;
					localidad = trim(localidad);
					var provincia = document.getElementById("provincia").value;
					provincia = trim(provincia);
					
					if("" == tipo_via || "0" == tipo_via){
						alert("Debe ingresar Tipo de v�a");
						return false;
					}
					if("" == via || "0" == via){
						alert("Debe ingresar v�a");
						return false;
					}
					if("" == numero){
						alert("Debe ingresar n�mero");
						return false;
					}
					if("" == localidad){
						alert("Debe ingresar localidad");
						return false;
					}
					if("" == provincia || "0" == provincia){
						alert("Debe ingresar provincia");
						return false;
					}
					if("" == descripcionGiro){
						alert("Debe buscar un giro al cliente");
						return false;
					}else{
						var giroID = document.getElementById("giroID").value;
						giroID = trim(giroID);
						if("" == giroID){
							alert("Debe ingresar informaci�n de giro y realizar su busqueda en el sistema");
						}					
					}
					return true;
				}
			}else{
				alert("Debe realizar una busqueda del cliente Facturar A");
				return false;
			}
		}else{
			return true;
		}
	
}

function retornaDv(elemento){
	var dv = Digito_verificador(elemento.value);
	if(dv == -1){
		alert("Debe ingresar RUT valido");
	}else{
		document.getElementById('dv').value = dv;
	}
}

function Digito_verificador(rut){
	var ag=rut.split('').reverse();
	for(total=0,n=2,i=0;i<ag.length;((n==7) ? n=2 : n++),i++){
		total+=ag[i]*n;
	}
	var resto=11-(total%11);
	return (resto<10)?resto:((resto>10)?0:'k');
}
			
	
function dvval(T){
	var M=0,S=1;
	
	for(;T;T=Math.floor(T/10))
		S=(S+T%10*(9-M++%6))%11;					
		return S?S-1:'K';

}
			

function bloqueaTelefono()
{
	//alert(document.getElementById('sinfono').checked);
	if(document.getElementById('sinfono').checked == true){
		//document.getElementById('telefono').disabled=true; 
	}else{
		//document.getElementById('telefono').disabled=false;
	}
}

function bloqueaTelefonoMovil()
{
	//alert(document.getElementById('sinfono').checked);
	if(document.getElementById('sinmovil').checked == true){
		//document.getElementById('telefono_movil').disabled=true; 
	}else{
		//document.getElementById('telefono_movil').disabled=false;
	}
}

function inicio_pagina_cliente()
{
	var $j = jQuery.noConflict();
	
	var exito = document.getElementById('exito').value;
	var nombre_cliente_facturaDIV1 = document.getElementById("nombre_cliente_facturaDIV1");	
	//nombre_cliente_facturaDIV1.style.display="";		
	
	if("false" == exito){
		alert("Error en el ingreso del Cliente");
	}else if("true" == exito){
		
		alert("Ingreso del Cliente Exitoso");
		if($j.cookie("mostrar_back_vtadirecta") == "777"){
			$j("#volver_vtadirecta").css("display","block");
		}
		var descripcionGiro = document.getElementById("descripcionGiro").value;	 	
		
		if("" != descripcionGiro){
			var Seccion = document.getElementById('descripcionGiroDIV');	
			Seccion.style.display="";
			Seccion = document.getElementById('nombre_cliente_facturaDIV1');
			Seccion.style.display="";
			document.getElementById('descripcionGiroDIV').innerHTML=descripcionGiro;
		}
		
		desactivaCheck();
	
	}else if("existe" == exito){
		alert("El cliente existe, no puede ser ingresado");
	}else if("modificado" == exito){
		alert("Modificaci\u00F3n del Cliente Exitosa");
		if($j.cookie("mostrar_back_vtadirecta") == "777"){
			$j("#volver_vtadirecta").css("display","block");
		}
		var descripcionGiro = document.getElementById("descripcionGiro").value;	 	
		if("" != descripcionGiro){
			var Seccion = document.getElementById('descripcionGiroDIV');	
			Seccion.style.display="";
			Seccion = document.getElementById('nombre_cliente_facturaDIV1');
			Seccion.style.display="";
			document.getElementById('descripcionGiroDIV').innerHTML=descripcionGiro;
		}
		desactivaCheck();
		
		$j(".mk").each(function(){				
			if($j(this).val() == "-1"){
				 $j(this).siblings().prop("checked", false).removeClass("sel");
			}else{
				 $j(this).siblings().prop("checked", true).addClass("sel");
			}					
		});
		
		
	}else if("traeClienteSeleccionadoFactura" == exito){
		var descripcionGiro = document.getElementById("descripcionGiro").value;	
		if("" != descripcionGiro){
			var Seccion = document.getElementById('descripcionGiroDIV');	
			Seccion.style.display="";
			Seccion = document.getElementById('nombre_cliente_facturaDIV1');
			Seccion.style.display="";
			document.getElementById('descripcionGiroDIV').innerHTML=descripcionGiro;
		}
	}else if("ERROR_RUT" == exito){
		alert("Error en el ingreso del cliente, el RUT ingresado no puede ser vacio");
	}

	var fecha = document.getElementById('fnacimiento').value;
									
	if("" == fecha){
		document.getElementById('edad').value = '0';
		document.getElementById('fnacimiento').value = '';
	}else{					
		calculaEdad();
	}
	
	
	
	var estado_pagina = document.getElementById('estado_pagina').value;
	if("traeClienteSeleccionado" == estado_pagina){			
		deshabilitarCamposCliente();
		var Seccion = document.getElementById('modificarId');		
		Seccion.style.display="";
		
		var descripcionGiro = document.getElementById("descripcionGiro").value;	 	
		if("" != descripcionGiro){
			var Seccion = document.getElementById('descripcionGiroDIV');	
			Seccion.style.display="";
			document.getElementById('descripcionGiroDIV').innerHTML=descripcionGiro;
		}
	}	
	
	var pagina_status = document.getElementById('pagina_status').value;
	if("inicioPag"==pagina_status){
		deshabilitarCamposCliente();
		document.getElementById("rut").disabled=false;
		document.getElementById("dv").disabled=false;
		document.getElementById("cdgcodigocliente").value="";
		
	}
	
}

function deshabilitarCamposCliente(){
	var $j = jQuery.noConflict();
	var inputs = document.all.tags("input");
    var i;
	for(i=0;i<inputs.length;i++)
	{
		if (inputs[i].type == "text") {			
			
			inputs[i].disabled = true;						
		}	
	}
	
	var selects = document.all.tags("select");
    for(i=0;i<selects.length;i++)
    {
                selects[i].disabled = true;
    }
    
    $j(".delem,.hmk").attr("disabled",true);
}

function modifica_cliente(){
	var $j = jQuery.noConflict();
	document.getElementById("estaGrabado").value="2";
	document.getElementById('estado_pagina').value="";
	seleccionar(0);
	document.getElementById('agente').options.selectedIndex.value = 0;	
	$j("input[type=text],select").prop("disabled",false);
	
	
	//SE DEJAN CHEKEADOS LOS CHECKBOX
	$j(".delem,.hmk").attr("disabled",false);
	
	desactivaCheck();
	
	$j(".mk").each(function(){				
		if($j(this).val() == "-1"){
			 $j(this).siblings().prop("checked", false);
		}else{
			 $j(this).siblings().prop("checked", true);
		}					
	});
	
	$j("#btngcliente").css("display","block");
	
}

function carga_url_padre(url)
{	
	try{
		if(parent.document.getElementById('menu_principal_id')== null){			
			location.href('<%=request.getContextPath()%>/Index.do?method=cargaLogin');
		}else{			
			parent.carga_url_padre(url);
		}	
			
		
	}catch(Error){
		
		location.href('<%=request.getContextPath()%>/Index.do?method=cargaLogin');
	}
	
}
function carga_url_padre_encargo(url)
{	
	try{		
		location.href(url);	
	}catch(Error){
		
		location.href('<%=request.getContextPath()%>/Index.do?method=cargaLogin');
	}
	
}

function nuevo_cliente(){
	$j.cookie("venta_directa","0");
	if($j("#dv").val()!=""){
		$j.cookie("mostrar_check","777");
	}
	document.getElementById('accion').value="nuevo_cliente";
	document.forms[0].submit();
	
}

function habilitarCamposCliente(){
	var $j = jQuery.noConflict();
	var inputs = document.all.tags("input");
    var i;
	for(i=0;i<inputs.length;i++)
	{
		if (inputs[i].type == "text") {			
			
			inputs[i].disabled = false;						
		}	
	}
	
	var selects = document.all.tags("select");
    for(i=0;i<selects.length;i++)
    {
                selects[i].disabled = false;
    }
    
    //SE COMENTA A PETICION DE PAULO BARRERA 20140827
    
	$j(".delem,.hmk").attr("disabled",false);
	$j(".delem,.hmk").find(":checked").each(function() {
			
		   $j(this).removeAttr('checked');
	});
	
	$j("#btngcliente").css("display","block");
}

function seleccionar(elemento) {
	  
	   var combo = document.getElementById('agente');
	   var cantidad = combo.length;
	   for (i = 0; i < cantidad; i++) {
	      if (combo[i].value == elemento) {
	         	combo[i].selected = true;
	      }   
	   }
}

//VALIDACIONES FORMULARIO DE CLIENTES 20140811

function mostrarErrores(errors){
	 var msg = "Por favor ingresa un dato v�lido...\n";
	 for (var i = 0; i<errors.length; i++) {
		 var numError = i + 1;
		  msg += "\n" + numError + ". " + errors[i];
	 }
	 alert(msg);
}


//DESACTIVA CHECKBOX
function desactivaCheck(){
	
	var $j = jQuery.noConflict();
	//limpio fecha false
	if($j("#fnacimiento").val()=="false"){
		$j("#fnacimiento").val("");
	}
	//Agrego checked por defecto en los checkbox		
	//$j(".delem,.mk").attr("disabled",false);
	$j(this).attr("disabled",false);
	$j(".delem").each(function() {	
		if($j.trim($j(this).prev().val()) =="" || $j.trim($j(this).prev().val()) =="null"){
			
			$j(this).click();
		}
	});
	$j("#btngcliente").css("display","block");
}


function utf8_decode(str_data) {
	  //  discuss at: http://phpjs.org/functions/utf8_decode/
	  // original by: Webtoolkit.info (http://www.webtoolkit.info/)
	  //    input by: Aman Gupta
	  //    input by: Brett Zamir (http://brett-zamir.me)
	  // improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	  // improved by: Norman "zEh" Fuchs
	  // bugfixed by: hitwork
	  // bugfixed by: Onno Marsman
	  // bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	  // bugfixed by: kirilloid
	  //   example 1: utf8_decode('Kevin van Zonneveld');
	  //   returns 1: 'Kevin van Zonneveld'

	  var tmp_arr = [],i = 0,ac = 0,c1 = 0,c2 = 0,c3 = 0,c4 = 0;

	  str_data += '';

	  while (i < str_data.length) {
	    c1 = str_data.charCodeAt(i);
	    if (c1 <= 191) {
	      tmp_arr[ac++] = String.fromCharCode(c1);
	      i++;
	    } else if (c1 <= 223) {
	      c2 = str_data.charCodeAt(i + 1);
	      tmp_arr[ac++] = String.fromCharCode(((c1 & 31) << 6) | (c2 & 63));
	      i += 2;
	    } else if (c1 <= 239) {
	      // http://en.wikipedia.org/wiki/UTF-8#Codepage_layout
	      c2 = str_data.charCodeAt(i + 1);
	      c3 = str_data.charCodeAt(i + 2);
	      tmp_arr[ac++] = String.fromCharCode(((c1 & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
	      i += 3;
	    } else {
	      c2 = str_data.charCodeAt(i + 1);
	      c3 = str_data.charCodeAt(i + 2);
	      c4 = str_data.charCodeAt(i + 3);
	      c1 = ((c1 & 7) << 18) | ((c2 & 63) << 12) | ((c3 & 63) << 6) | (c4 & 63);
	      c1 -= 0x10000;
	      tmp_arr[ac++] = String.fromCharCode(0xD800 | ((c1 >> 10) & 0x3FF));
	      tmp_arr[ac++] = String.fromCharCode(0xDC00 | (c1 & 0x3FF));
	      i += 4;
	    }
	  }

	  return tmp_arr.join('');
	}


