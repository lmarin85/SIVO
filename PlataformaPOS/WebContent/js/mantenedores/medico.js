		function inicio_pagina()
			{
				var exito  = document.getElementById('exito').value;
				var pagina = document.getElementById("pagina").value;
				if("-1" == exito){
					alert("Error en el ingreso del Doctor");
				}else if("0" == exito){
					alert("Ingreso del Doctor Exitoso");
				}else if("1" == exito){
					alert("El rut ingresado ya existe");
				}else if("2" == exito){
					alert("Modificación del Doctor Exitoso");
				}
				
				if("optometria" == pagina){
					var Seccion = document.getElementById("buscarDocID");
					Seccion.style.display="none";
				}
			}	
		function cargaCliente(medico)
		{			
			document.getElementById("medicoagregadoId").value = medico[0];
           	document.getElementById("nifagregadoId").value = medico[1];
           	document.getElementById('accion').value = "traeMedicoSeleccionado";
            document.forms[0].submit();
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
			function ingresaMedico()
			{
			   	document.getElementById('accion').value = 'ingresaMedico';
			   	var respuesta = valida_informacion_doctor();
			   	if(respuesta){
			   		document.forms[0].submit();
			   	}
			   	
			}