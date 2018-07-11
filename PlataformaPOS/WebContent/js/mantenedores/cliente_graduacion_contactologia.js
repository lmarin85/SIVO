				
		function validaRadio1(elemento,lado){


			var valorelemento = elemento.value;
			
			valorelemento = trim(valorelemento);
			
			if("" != valorelemento){
				valorelemento = (parseFloat(valorelemento)).toFixed(2);
				
				if(valorelemento <= 0.00 || valorelemento>99.99){
				
					alert("El valor radio1 "+lado+" est\u00E1 fuera del rango permitido mayor a 0 y menor a 99.99");
				
				}				
			}else{
				alert("Debe ingresar un valor en radio1 "+lado+"");
			}
			


		}
		
		
		function insertar_contactologia()
			{
				document.getElementById('accion').value="ingresoContactologia";
				var doctor = document.getElementById('doctor').value;				
				var pagina = document.getElementById('grabar').value; 
				var existeContactologia = document.getElementById('existeContactologia').value;
				
				
				if("true" == existeContactologia){					
					alert("La receta esta asociada a una venta, no puede ser modificada, debe generar una nueva receta");
				}else{
					
					var respuesta = validaInfoContactologia();				
					if("false" != pagina || respuesta == false){
						if(respuesta == true){
							if(doctor != "-1"){						
								document.forms[0].submit();						
							}else{
								alert("Debe ingresar doctor");
							}	
						}
					}else{
						var respuesta3 = confirm("¿Desea modificar la receta?");							
						if(respuesta3 == true){
							if(respuesta == true){
								document.getElementById('accion').value="modificarContactologia";
								document.forms[0].submit();	
							}
						}
							
					}
				}
				
				
			}	
				
		function inicio_pagina()
			{
				var pagina = document.getElementById('grabar').value;
				Seccion = document.getElementById('graduaId');
				var existeContactologia = document.getElementById('existeContactologia').value; 			
				
				if("false" == pagina){
					Seccion.style.display="";
				}else{
					Seccion.style.display="none";
				}
				
				var exito = document.getElementById('exito').value;
				if("inicio_pagina" == exito || "true" == exito || "false" == exito){
					
				}
												
				if("false" == exito){
					alert("Error en el ingreso de Graduación");
					document.getElementById('exito').value="";
				}else if("true" == exito){
					alert("Ingreso de Graduación Contactología Exitoso");
					document.getElementById('exito').value="";
				}
	//se comenta ya que se pidio que ninguna contactologia deberia estar bloqueada 
	//fecha : 14-03-2013 Incidencia: 368
				if(existeContactologia == "true"){	//cambiar a true				
					//bloquearCamposContacotologia();
					//se agrega esta linea ya que se pidio que la contactologia no se bloqueara al estar 
					//asociada a un encargo o presupuesto
					document.getElementById('existeContactologia').value="";
				}
				
			}	
		function ver_graduacion(numero, fecha)
			{
				document.getElementById('accion').value='verGraduacion';
				document.getElementById('fecha_graduacion').value=fecha;
				document.getElementById('numero_graduacion').value=numero;
				
				document.forms[0].submit();
			}	
			
		function nuevo_graduacion(){
			document.getElementById("estaGrabado").value=2;
			var inputs = document.getElementsByTagName("input");
			var cliente = document.getElementById('cliente');
			var exito = document.getElementById('exito');
			var nombre_cliente = document.getElementById('nombre_cliente');
			
			for(var i=0;i<inputs.length;i++){				
				if(inputs[i] != cliente && inputs[i] != exito && inputs[i] != nombre_cliente){
					inputs[i].value = "";
					inputs[i].disabled = false;
				}
			}
			var selects = document.all.tags("select");			
            for(i=0;i<selects.length;i++)
            {
            	selects[i].disabled = false;
            }
            document.getElementById('nombre_doctorDIV').innerHTML = "";
		}
		
		function bloquearCamposContacotologia()
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
		
		function cargaMedico(medico)
		{	
			document.getElementById("doctor").value=medico[0];
           	document.getElementById("nifdoctor").value=medico[1];
           	document.getElementById("dvnifdoctor").value=medico[2];
           	document.getElementById("nombre_doctorDIV").innerHTML =medico[3] + " "+ medico[4];       	
        }