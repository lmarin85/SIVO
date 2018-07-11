
        
        function contactologia()
		{
			document.getElementById('accion').value='contactologia';
			document.forms[0].submit();
		}

        function cargaCliente(cliente)
		{				
			document.getElementById("clienteagregadoId").value = cliente[0];
			document.getElementById("codigo_cliente").value = cliente[0];				
        	document.getElementById("nifagregadoId").value = cliente[1];
        	document.getElementById("nombre_cliente").value = cliente[2]; 
        	document.getElementById('cerrarPagina').value="0";
        	        	      	
        	location.href("<%=request.getContextPath()%>/Graduaciones.do?method=cargaFormulario&cliente="+cliente[0]+"&nombre="+cliente[2]+"&apellido="+cliente[3]+"&cerrarPagina=0");
        	//document.forms[0].submit();
	
		}
        
        function ver_graduacion(numero, fecha)
		{
			document.getElementById('accion').value='verGraduacion';
			document.getElementById('fecha_graduacion').value=fecha;
			document.getElementById('numero_graduacion').value=numero;
			
			document.forms[0].submit();
		}
	function insertar_graduacion()
		{
			document.getElementById('accion').value='insertarGraduacion';
			var pagina = document.getElementById('pagina').value;
			var existe_graduacion = document.getElementById('existe_graduacion').value;
			
			var respuesta1 = validaInformacion();
			var respuesta  = true;
			if(respuesta1 == true){
				respuesta  = validaGraduacion();
			}
			
			//valida diferente adicion
			var check = document.getElementById('diferenteADD');
			var pasaValidacionADD = true;
			if (!check.checked) {
				if ("" != document.getElementById('OI_adicion').value || "" != document.getElementById('OD_adicion').value) {
					if (document.getElementById('OI_adicion').value != 	document.getElementById('OD_adicion').value)
					{
						pasaValidacionADD = false;
					}
				}
				
			}
			//fin
			
			if (pasaValidacionADD) {
				if("true" != existe_graduacion){	
					
					if(respuesta == true && respuesta1 == true){
						if("NOGRABAR" != pagina){
							var OD_esfera = document.getElementById('OD_esfera').value;
							var OD_cilindro = document.getElementById('OD_cilindro').value;
							var OD_eje = document.getElementById('OD_eje').value;
							var OD_cerca = document.getElementById('OD_cerca').value; 
							var OD_adicion = document.getElementById('OD_adicion').value;
							var OD_dnpl = document.getElementById('OD_dnpl').value;
							var OD_dnpc = document.getElementById('OD_dnpc').value;
							
							if(""==OD_eje){
								OD_eje="      ";
							}
							if(""==OD_cerca){
								OD_cerca="       ";
							}
							if(""==OD_adicion){
								OD_adicion="       ";
							}
							if(""==OD_dnpl){
								OD_dnpl="       ";
							}
							if(""==OD_dnpc){
								OD_dnpc="       ";
							}
							
							var OI_esfera = document.getElementById('OI_esfera').value;
							var OI_cilindro = document.getElementById('OI_cilindro').value;
							var OI_eje = document.getElementById('OI_eje').value;
							var OI_cerca = document.getElementById('OI_cerca').value; 
							var OI_adicion = document.getElementById('OI_adicion').value;
							var OI_dnpl = document.getElementById('OI_dnpl').value;
							var OI_dnpc = document.getElementById('OI_dnpc').value;
							
							if(""==OI_eje){
								OI_eje="      ";
							}
							if(""==OI_cerca){
								OI_cerca="       ";
							}
							if(""==OI_adicion){
								OI_adicion="       ";
							}
							if(""==OI_dnpl){
								OI_dnpl="       ";
							}
							if(""==OI_dnpc){
								OI_dnpc="       ";
							}
							
							
							var mensaje1 = "Estos son los datos de la receta registrados:    \n ";
							var mensaje2 = "  Ojo   Esf         Cil       Eje       Cerca         Add         DNPL         DNPC  \n ";
							var mensaje3 = "   D     "+OD_esfera+"       "+OD_cilindro+"       "+OD_eje+"          "+OD_cerca+"           "+OD_adicion+"         "+OD_dnpl+"          "+OD_dnpc+"\n ";
							var mensaje4 = "    I      "+OI_esfera+"       "+OI_cilindro+"       "+OI_eje+"          "+OI_cerca+"           "+OI_adicion+"         "+OI_dnpl+"          "+OI_dnpc+"\n ";
							var mensaje5 = "\u00BFEst\u00E1 seguro(a) que esta correctos?";
							var mensaje = mensaje1 + mensaje2 + mensaje3 + mensaje4 + mensaje5;
							var respuesta3 = confirm(mensaje);		
							if(respuesta3){
								document.forms[0].submit();
							}
						
						}else if("NOGRABAR" == pagina){
							
							var respuesta4 = confirm("¿Desea modificar la receta?");							
							if(respuesta4 == true){						
								var OD_esfera = document.getElementById('OD_esfera').value;
								var OD_cilindro = document.getElementById('OD_cilindro').value;
								var OD_eje = document.getElementById('OD_eje').value;
								var OD_cerca = document.getElementById('OD_cerca').value; 
								var OD_adicion = document.getElementById('OD_adicion').value;
								var OD_dnpl = document.getElementById('OD_dnpl').value;
								var OD_dnpc = document.getElementById('OD_dnpc').value;
								
								if(""==OD_eje){
									OD_eje="      ";
								}
								if(""==OD_cerca){
									OD_cerca="       ";
								}
								if(""==OD_adicion){
									OD_adicion="       ";
								}
								if(""==OD_dnpl){
									OD_dnpl="       ";
								}
								if(""==OD_dnpc){
									OD_dnpc="       ";
								}
								
								var OI_esfera = document.getElementById('OI_esfera').value;
								var OI_cilindro = document.getElementById('OI_cilindro').value;
								var OI_eje = document.getElementById('OI_eje').value;
								var OI_cerca = document.getElementById('OI_cerca').value; 
								var OI_adicion = document.getElementById('OI_adicion').value;
								var OI_dnpl = document.getElementById('OI_dnpl').value;
								var OI_dnpc = document.getElementById('OI_dnpc').value;
								
								if(""==OI_eje){
									OI_eje="      ";
								}
								if(""==OI_cerca){
									OI_cerca="       ";
								}
								if(""==OI_adicion){
									OI_adicion="       ";
								}
								if(""==OI_dnpl){
									OI_dnpl="       ";
								}
								if(""==OI_dnpc){
									OI_dnpc="       ";
								}
								
								var mensaje1 = "Estos son los datos de la receta registrados:    \n ";
								var mensaje2 = "  Ojo   Esf         Cil       Eje       Cerca         Add         DNPL         DNPC  \n ";
								var mensaje3 = "   D     "+OD_esfera+"          "+OD_cilindro+"        "+OD_eje+"          "+OD_cerca+"             "+OD_adicion+"          "+OD_dnpl+"           "+OD_dnpc+"\n ";
								var mensaje4 = "    I      "+OI_esfera+"          "+OI_cilindro+"        "+OI_eje+"          "+OI_cerca+"             "+OI_adicion+"          "+OI_dnpl+"           "+OI_dnpc+"\n ";
								var mensaje5 = "\u00BFEst\u00E1 seguro(a) que esta correctos?";
								var mensaje = mensaje1 + mensaje2 + mensaje3 + mensaje4 + mensaje5;
								var respuesta3 = confirm(mensaje);		
								if(respuesta3){
									document.getElementById('accion').value='modificarGraduacion';
									document.forms[0].submit();
								}
							}	
						}
						
					}			
				}else{
					//if("NOGRABAR" == pagina)
					alert("La receta esta asociada a una venta, no puede ser modificada, debe generar una nueva receta");
				}
			}
			else
				{
					alert("La ADD para cada Ojo es distinta");
				}
			
			
		}	
	function inicio_pagina()
		{
			var exito = document.getElementById('exito').value;
			
			//if("inicio_pagina" == exito || "true" == exito || "false" == exito){
			if("inicio_pagina" == exito){
				var cdg_cliente = document.getElementById('codigo_cliente').value;
				if(cdg_cliente == 0){
					limpiar_pantalla();
				}
				
			}			
			
			if("false" == exito){
				alert("Error en el ingreso de Graduaci\u00F3n");
			}else if("true" == exito){
				alert("Ingreso de Graduación Exitoso");
			}
			
			var cdg_cliente = document.getElementById('codigo_cliente').value;
			var Seccion = document.getElementById('recetasId');
			if(cdg_cliente == 0){
				Seccion.style.display="none";
			}else{
				Seccion.style.display="";
			}		
			
			
			var presupuestoId = document.getElementById('presupuestoId');
			if(cdg_cliente == 0){
				presupuestoId.style.display="none";
			}else{
				presupuestoId.style.display="";
			}
			
			var ventaPedidoId = document.getElementById('ventaPedidoId');
			if(cdg_cliente == 0){
				ventaPedidoId.style.display="none";
			}else{
				ventaPedidoId.style.display="";
			}
			
			
			var  verGraduaId = document.getElementById('pagina').value;
			Seccion = document.getElementById('graduaId');
			if("NOGRABAR" == verGraduaId){
				Seccion.style.display="";
			}else{
				Seccion.style.display="none";
			} 
			
			var existe_graduacion = document.getElementById('existe_graduacion').value;
			
			if("true" == existe_graduacion){
				bloquearCamposOptometria();
			}else{
				var ejeD = document.getElementById('OD_eje').value;
				var ejeI = document.getElementById('OI_eje').value;
				
				if(null != ejeD && "" != ejeD ){
					document.getElementById('OD_eje').disabled =false;		
				}else{
					document.getElementById('OD_eje').disabled =true;
				}
				
				if(null != ejeI && "" != ejeI ){
					document.getElementById('OI_eje').disabled =false;		
				}else{
					document.getElementById('OI_eje').disabled =true;
				}				
			}
			
			
		}
		
		function suma_fecha(){
			
			var fechaEmision = document.getElementById('fechaEmision').value;
						
			if("" == fechaEmision){
				alert("Debe ingresar fecha de emisi\u00F3n");
			}else{	
				
				var fechastr = fechaEmision.split("/");
				var fecha = new Date();
				
				fecha.setFullYear(fechastr[2], fechastr[1], fechastr[0]);
				
				var anio = parseInt(fechastr[2])+2;
				
				var mes = fechastr[1];			
				
				var dia = "";
				var diaIn = parseInt(fechastr[0]);					
				var diaint = parseInt(diaIn)-parseInt(1);					
				if(diaint < 10){
					if(diaint == 0){						
						dia = "01";
					}else{
						dia = "0"+diaint;
					}
				}else{
					dia = diaint;
				}
				dia = "01";
				document.getElementById('fechaProxRevision').value =dia+"/"+mes+"/"+anio; 				 
			}		
		}
		
		function nuevo_graduacion(){
			
			document.getElementById('estaGrabado').value=2;
			document.getElementById("nombre_doctorDIV").innerHTML="";
			document.getElementById('pagina').value="";
			
			document.getElementById('OD_esfera').value = "";				
			document.getElementById('OD_cilindro').value = "";				
			document.getElementById('OD_eje').value = "";				
			document.getElementById('OD_adicion').value = "";
			document.getElementById('OD_dnpl').value = "";
			document.getElementById('OD_dnpc').value = "";
			document.getElementById('OD_avsc').value = "";
			document.getElementById('OD_avcc').value = "";
			document.getElementById('OD_cerca').value = "";
			document.getElementById('OD_altura').value = "";
						
										
			document.getElementById('OI_esfera').value = "";				
			document.getElementById('OI_cilindro').value = "";				
			document.getElementById('OI_eje').value = "";				
			document.getElementById('OI_adicion').value = "";
			document.getElementById('OI_dnpl').value = "";
			document.getElementById('OI_dnpc').value = "";
			document.getElementById('OI_avsc').value = "";
			document.getElementById('OI_avcc').value = "";
			document.getElementById('OI_cerca').value = "";
			document.getElementById('OI_altura').value = "";
			
							
			document.getElementById('OD_observaciones').value = "";	
			document.getElementById('OI_observaciones').value = "";				
			document.getElementById('fechaProxRevision').value = "";
			document.getElementById('fechaEmision').value = "";
			
			//document.getElementById('doctor').options.selectedIndex = 0;
			document.getElementById('agente').options.selectedIndex = 0; 
			
			document.getElementById('existe_graduacion').value = "";
			
			var inputs = document.getElementsByTagName("input");
			var cliente = document.getElementById('cliente');
			var exito = document.getElementById('exito');
			var nombre_cliente = document.getElementById('nombre_cliente');
			var cerrarPagina = document.getElementById("cerrarPagina");
			
			for(var i=0;i<inputs.length;i++){				
				if(inputs[i] != cliente && inputs[i] != exito && inputs[i] != nombre_cliente && inputs[i] != cerrarPagina){
					inputs[i].value = "";
					inputs[i].disabled = false;
				}
			}
			var selects = document.all.tags("select");			
            for(i=0;i<selects.length;i++)
            {
            	selects[i].disabled = false;
            }
				
		}
		
		function cargaMedico(medico)
		{	
			document.getElementById("doctor").value=medico[0];
           	document.getElementById("nifdoctor").value=medico[1];
           	document.getElementById("dvnifdoctor").value=medico[2];
           	document.getElementById("nombre_doctorDIV").innerHTML =medico[3] + " "+ medico[4];       	
        }
		function seleccionar(elemento) {
		   
		   var combo = document.getElementById('doctor');
		   var cantidad = combo.length;
		   for (i = 0; i < cantidad; i++) {
		      if (combo[i].value == elemento) {
		         	combo[i].selected = true;
		      }   
		   }
		}
		function bloquearCamposOptometria()
        {
             		var inputs = document.all.tags("input");
             		var i;
					for(i=0;i<inputs.length;i++)
					{
						if (inputs[i].type == "text") {
							if(inputs[i].id == "nombre_cliente"){
								
							}else{
								inputs[i].disabled = true;
							}
							
						}	
					}
			
                   var selects = document.all.tags("select");
                   for(i=0;i<selects.length;i++)
                   {
                               selects[i].disabled = true;
                   }
        }
		