
	var returnVal = "";
	var alto = "710";
	var ancho = "250";	
    var estado = "";
    var autoriza_decuento = false;
    
	document.oncontextmenu=inhabilitar;
	function inhabilitar(){return false;}
		
	

	document.attachEvent ( "OnKeyDown", my_onkeydown_handler);
	
	function inicio()
	{
		document.getElementById('sumaPagar').focus();
	}
	function calculaTotalvtaDirecta()
	{
		if (document.getElementById('dto').value != document.getElementById('descuentoTotal').value) {
			
			var descuento_max = parseFloat(document.getElementById('descuento_max').value);
			var dto = parseFloat(document.getElementById('descuentoTotal').value);
			
			if (parseInt(dto) <= parseInt(descuento_max)) {
				document.getElementById('accion').value="descuento_directa";
				document.getElementById('dto').value = document.getElementById('descuentoTotal').value;
				document.seleccionPagoForm.submit();
			} 
			else 
			{
				
					alert("El descuento debe ser menor o igual al " + descuento_max + "%");
					document.getElementById('descuentoTotal').value = document.getElementById('dto').value;
			}
		}
		
		
	}
	function my_onkeydown_handler()
	{
		switch (event.keyCode)
		{
			case 8:
			event.returnValue = false;
			event.keyCode = 0;
			break;
		}
	}
	function cierra_ventana(ventana)
	{
		popup(ventana , ancho, alto);
	}
	
	function seleccion_documento(documento)
	{
		document.getElementById('tipo_doc').value = documento;
	}
	
	function valida_monto()
	{	
		document.getElementById('diferencia').value = parseInt(document.getElementById('diferencia_total').value - document.getElementById('sumaPagar').value);
		if (document.getElementById('diferencia').value < 0) {
			alert("La diferencia no puede ser menor a 0");
			document.getElementById('sumaPagar').focus();
			document.getElementById('sumaPagar').value = 0;
			document.getElementById('diferencia').value = document.getElementById('diferencia_total').value;
		}
	}
	
	function guarda_Pago()
	{
		
		var correcto = 1;
		if (document.getElementById('estado').value == "PAGADO_TOTAL") {
			alert("No hay saldos pendientes por pagar");
			correcto = 0;
		}
		else
		{
			
			if (document.getElementById('sumaPagar').value == 0) {
				if(document.getElementById('descuentoTotal').value != 100)
				{
					correcto = 0;
					alert("El monto a pagar debe ser mayor a cero");
				}
			
			}
			else
			{
				if (document.getElementById('forma_pago').value == 0) {
					alert("Debe ingresar una forma de pago");
					correcto = 0;
				}
				else
				{
					if(document.getElementById('diferencia_total').value == 0)
					{
						alert("No hay saldos pendientes por pagar");
						correcto = 0;
					}
				} 
			}
		}
		
		if (correcto == 1) {
			document.getElementById('accion').value = "pagar";
			document.seleccionPagoForm.submit();
			load();
		}
		
		//Habilito todos los select
		 $j("#forma_pago option").each(function(i){
	  			$j(this).attr("enabled","enabled");
		 });
		 $j("#sumaPagar").val("").attr("readonly",false);
		
		
	}
	
	function guarda_PagoAlbaran()
	{
		var correcto = 1;
		if (document.getElementById('estado').value == "PAGADO_TOTAL") {
			alert("No hay saldos pendientes por pagar");
			correcto = 0;
		}
		else
		{
			
			if (document.getElementById('sumaPagar').value == 0) {
				if(document.getElementById('descuentoTotal').value != 100)
				{
					correcto = 0;
					alert("El monto a pagar debe ser mayor a cero");
				}
			
			}
			else
			{
				if (document.getElementById('forma_pago').value == 0) {
					alert("Debe ingresar una forma de pago");
					correcto = 0;
				}
				else
				{
					if(document.getElementById('diferencia_total').value == 0)
					{
						alert("No hay saldos pendientes por pagar");
						correcto = 0;
					}
				} 
			}
		}
		
		/*if(document.getElementById('diferencia').value > 0){
			alert("El pago de la devoluci�n debe ser por el valor total.");
			correcto = 0;
		}*/
		if(document.getElementById('diferencia').value < 0){
			alert("El pago de la devolucion no puede ser mayor al valor total");
			correcto = 0;
		}
		
		if (correcto == 1) {
			document.getElementById('accion').value = "pagar";
			document.seleccionPagoForm.submit();
			load();
		}
		
	}
	
	function guarda_Pago_Albaran()
	{
		var correcto = 1;
		if (document.getElementById('estado').value == "PAGADO_TOTAL") {
			alert("No hay saldos pendientes por pagar");
			correcto = 0;
		}
		else
		{
			
			if (document.getElementById('sumaPagar').value == 0) {
				if(document.getElementById('descuentoTotal').value != 100)
				{
					correcto = 0;
					alert("El monto a pagar debe ser mayor a cero");
				}
			
			}
			else
			{
				if (document.getElementById('forma_pago').value == 0) {
					alert("Debe ingresar una forma de pago");
					correcto = 0;
				}
				else
				{
					if(document.getElementById('diferencia_total').value == 0)
					{
						alert("No hay saldos pendientes por pagar");
						correcto = 0;
					}
				} 
			}
		}
		
		
		if (correcto == 1) {
			document.getElementById('accion').value = "pagarDevolcion";
			document.seleccionPagoForm.submit();
			load();
		}
		
	}

	function generaBoleta() 
	{
		var $j = jQuery.noConflict();
		
		if (document.getElementById('tiene_pagos').value != "0")
		{
			if (document.getElementById('estado').value == "PAGADO_TOTAL") {
				alert("No es posible imprimir documentos, la venta ya se encuentra pagada en su totalidad");
			}
			else
			{
				if(document.getElementById('origen').value == "PEDIDO")
				{	
					 var seguro ="N";
					 
					 $j("#contenido tr",window.parent.document).each(function(a){
				      	   var familia  = $j(this).find("td > a").attr("data-grupfam");
				      	   var articulo = $j(this).find("td > a").attr("data-barra");
				      	   var precio = $j.trim($j(this).find("td > a").attr("data-precio"));
				           if(familia == "DES"){
				        	   seguro ="S";
				       	   }
				     });
					
					if (parseInt(document.getElementById('anticipo_def').value) == 0 || $j('#convenio',window.parent.document).val() =="50412" || seguro=="S")
					{
						if (document.getElementById('tiene_pagos_actuales').value == "true") {
							popup('documentos', ancho, alto);
						}
						else
						{
							sin_pagos_imprimir();
						}
						
					}
					else
					{
						alert("El monto pagado no puede ser menor al Anticipo total");
					}
				}
				else
				{
					if (document.getElementById('diferencia_total').value == 0) 
					{
						if (document.getElementById('tiene_pagos_actuales').value == "true") {
							popup('documentos', ancho, alto);
						}
						else
						{
							sin_pagos_imprimir();
						}
						
					}
					else
					{
						alert("Existen pagos pendientes, no se puede imprimir");
					}
				}	
			}
		}
		else
		{
			alert("No hay pagos, no es posible imprimir");
		}
	}
	function generaBoleta2(){
		var origen = document.getElementById("origen").value;
		var estado = document.getElementById('estado').value;		
		if("ALBARAN_DEVOLUCION" == origen && estado != "PAGADO_TOTAL"){
			returnVal = "pago_devolucion";
			window.parent.hidePopWin(true);	
		}else{
			if (document.getElementById('estado').value != "PAGADO_TOTAL") {
				popup('documentos', ancho, alto);
			}
		}
		
		
	}
	function confirmaCambioFolio()
	{
		if (confirm("Esta seguro que ha introducido el n�mero correcto?")) {
			document.getElementById('accion').value = "cambio_folio_documento";
			document.seleccionPagoForm.submit();
		}
	}
	function pregunta_cambio_folio(mensaje)
	{
		if (confirm("Ya existe un documento con esta numeracion, Desea modificar el numero de boleta para el documento ?" + mensaje)) {
			popup('Documento_cambio_folio' , ancho, alto);
		}
		else
		{
			popup('Numero_Documento' , ancho, alto);
		}
	}
	function numeroDocumento() {
		
		if (document.getElementById('tipo_doc').value == 'B') {
			imprimirBoleta();
		}
		if (document.getElementById('tipo_doc').value == 'G') {
			document.getElementById('accion').value = "imprime_guia";
			
			if (document.getElementById('tiene_doc').value == "true") {
				alert(" Ya tiene documentos impresos. no es posible impimir guias.");
				popup('documentos', alto, ancho);
			}
			else
			{
				if (document.seleccionPagoForm.nif.value != "") {
					if (document.seleccionPagoForm.razon.value != "") {
						if (document.seleccionPagoForm.direccion.value != "") {
							if (document.seleccionPagoForm.giro_descripcion.value != "") {
								if (document.seleccionPagoForm.provincia_descripcion.value != "") {								
									
									document.seleccionPagoForm.submit();
									
								}
								else
								{
									alert("Debe seleccionar una provincia");
									popup('documentos', alto, ancho);
								}
					
							}
							else
							{
								alert("Debe seleccionar un giro");
								popup('documentos', alto, ancho);
							}
					
						}
						else
						{
							alert("Debe ingresar una direccion");
							popup('documentos', alto, ancho);
						}
					
					}
					else
					{
						alert("Debe ingresar una raz\u00f3 n social");
						popup('documentos', alto, ancho);
					}
				}
				else
				{
					alert("Debe ingresar un rut (nif)");
					popup('documentos', alto, ancho);
				}
			}
			
			
		}
		
		
	}

	function confirmaNumeroDocumento()
	{
		var num_documento = trim(document.getElementById('numero_1').value);
		var num_documento2 = trim(document.getElementById('numero_2').value);
		if (num_documento == num_documento2) {
			document.getElementById('accion').value = "valida_boleta";
			document.seleccionPagoForm.submit();
		}
		else
		{
			alert("Los numeros de los documento no coninciden");
			document.getElementById('numero_1').value = "";
			document.getElementById('numero_2').value = "";
		}
		
	}
	
	function vuelve_confirmacion(estado, msje)
	{
		if (estado == 'exito') {
			popup('Confirmacion' , ancho, alto);
		} else {
			popup('Numero_Documento' , ancho, alto);
			alert(msje);
		}
	}	
	
	function calcula()
	{
		document.getElementById('sumaParcial').value = parseInt((document
				.getElementById('sumaTotal').value - (document
				.getElementById('sumaTotal').value * ((document
				.getElementById('descuentoTotal').value) / 100))));
				
			document.getElementById('diferencia_total').value = document.getElementById('sumaParcial').value;
			document.getElementById('diferencia').value = parseInt(document.getElementById('sumaParcial').value - document.getElementById('sumaPagar').value);
			
			if (document.getElementById('diferencia').value < 0) {
			alert("La diferencia no puede ser menor a 0");
			document.getElementById('descuentoTotal').focus();
			document.getElementById('descuentoTotal').value = 0;
			}
	}
	function devuelve_descuento(valores)
	{
		var acceso = valores[0];
		var descuento = valores[1];
		if (acceso == "true") {
			var descuento_ingresado = document.getElementById('descuentoTotal').value;
			
			var comparacion = parseFloat(descuento_ingresado) > parseFloat(descuento);
			
			if (comparacion) {
				alert("El descuento mu\00e1ximo autorizado es de " + descuento);
				document.getElementById('descuentoTotal').value = "0";

			}
		}
		else
		{
			document.getElementById('descuentoTotal').value = "0";
		}
		calcula();
		calcula_anticipo_minimo();
		
	}
	
	function Impresion_Realizada()
	{
		returnVal = "Pago_Exitoso";
		window.parent.hidePopWin(true);	
	}
	function Impresion_Defectuosa()
	{
		popup('Confirmacion' , ancho, alto);
		popup('documentos' , ancho, alto);
	}
	document.onmousedown=click;
	function click() { if (event.button==2) {}}
	
	

		function refresh()
		{
			var doc = document.getElementById('documentos');
			var num = document.getElementById('Numero_Documento');
			var conf = document.getElementById('Confirmacion');
			var blanket = document.getElementById('blanket');
			var tiene_fomas_pago = document.getElementById('tiene_fomas_pago').value;
			
			if (doc.style.display = 'block') doc.style.display = 'none';
			if (num.style.display = 'block') num.style.display = 'none';
			if (conf.style.display = 'block') conf.style.display = 'none';
			if (blanket.style.display = 'block') blanket.style.display = 'none';
			

			window.parent.hidePopWin(true);			
		}
		function refreshAlbaran(){
			
			var doc = document.getElementById('documentos');
			var num = document.getElementById('Numero_Documento');
			var conf = document.getElementById('Confirmacion');
			var blanket = document.getElementById('blanket');
			var tiene_fomas_pago = document.getElementById('tiene_fomas_pago').value;
			
			if (doc.style.display = 'block') doc.style.display = 'none';
			if (num.style.display = 'block') num.style.display = 'none';
			if (conf.style.display = 'block') conf.style.display = 'none';
			if (blanket.style.display = 'block') blanket.style.display = 'none';
						
			returnVal = tiene_fomas_pago;
			window.parent.hidePopWin(true);	
			
		}
		
		function eliminar_pago(forma_pago, fecha_pago,ruta){			
			//alert("paso eliminar encargo");
			/*document.getElementById('accion').value="eliminarFormaPago";
			document.getElementById('f_pago').value=forma_pago;	
			document.getElementById('fech_pago').value=fecha_pago;
			document.seleccionPagoForm.submit();*/	
		
			
			showPopWin(ruta+'/SeleccionPago.do?method=valida_des_forma_pago',440, 137,null,false);	
			$j('#accion').val("eliminarFormaPago");
			$j('#f_pago').val(forma_pago);	
			$j('#fech_pago').val(fecha_pago);
			
			$j.cookie('convenio','0');
			$j("#sumaPagar").val("").attr("readonly",false);			
			
		}
		function venta_bloqueada()
		{
			alert("La venta se encuentra bloqueada, no es posible modificar los pagos");
		}
		
		function inicio_pagina(){
			var exitopago = document.getElementById('exitopago').value;
			
			if("TRUE" == exitopago){
				alert("El Pago fue anulado correctamente");
				//window.parent.hidePopWin(false);
				//window.parent.document.location = '<%=request.getContextPath()%>/VentaPedido.do?method=nuevoFormulario';													  					

			}else if("TRUE_2" == exitopago){
				alert("Se elimino la forma de pago correctamente.");
			}else if("LIBERADO_1" == exitopago){
				alert("No se puede anular el encargo cuando ya se encuentra liberado(1).");
			}else if("LIBERADO_2" == exitopago){
				alert("No se puede anular el encargo cuando ya se encuentra liberado(2).");
			}else if("CERRADA" == exitopago){
				alert("No se puede eliminar pagos cuando la caja esta CERRADA");
			}else if("ERROR" == exitopago){
				alert("No se puede eliminar pago ERROR");
			}else if("ERROR(1)" == exitopago){
				alert("No se puede eliminar pago ERROR (1).");
			}
			
			document.getElementById('exitopago').value = "";
		}
		
		function calcula_anticipo_minimo()
		{
			if(document.getElementById('origen').value == "PEDIDO")
			{	
				if(parseInt(document.getElementById('sumaParcial').value) == 0)
				{
					document.getElementById('anticipo_def').value = "0";
				}
				else
				{
					var valor = (parseInt(document.getElementById('sumaParcial').value) * 
									parseInt(document.getElementById('porc_anticipo_def').value)) / 100
					
					 document.getElementById('anticipo_def').value = Math.round(valor);
				}
			}
		}
		
		 
	 	function dialogo(url){
	 		 var dialog = $j('<p>Se reimprimio correctamente la Boleta?</p>').dialog({
                buttons: {
                    "Si": function() { dialog.dialog('close');},
                    "No":  function() {window.open(url)},
                    "Cancelar":  function() {
                        dialog.dialog('close');
                    }
                }
                //height: 100,
			    //width: 300
			 
            });
	 	}			
	 	
		function error_fpago_oa()
		{
			alert("La forma de pago seleccionada se usa solo para convenios con orden de compra");
		}
		function error_fpago_oa_convenio_2()
		{
			alert("Ya ha entregado la Orden de Atencion");
		}
		function error_guia_pago_oa()
		{
			alert("Debe imprimir la Guia, antes de seguir cobrando");
		}
		function error_caja_cerrada()
		{
			alert("la caja esta cerrada para la fecha indicada. no es posible agregar el pago");
		}
		function error_fpago_oa_convenio()
		{
			alert("Tiene un convenio, debe introducir una Orden de Atencion");
		}
		function validaFormaPago(comboBox)
		{
			document.getElementById('accion').value="valida_forma_pago";
			document.seleccionPagoForm.submit();
		}
		function sin_pagos_imprimir()
		{
			alert("No hay pagos nuevos para imprimir");
		}
		function valida_100()
		{
			alert("Debe cancelar el 100% del Encargo");
		}
		
		function pago_repetido(){
			alert("No puede haber dos pagos, en la misma fecha y con la misma forma de pago");
		}
		
		function pago_fecha_anterior()
		{
			alert("La fecha del pago no puede ser anterior a la del pedido o albaran");
		}