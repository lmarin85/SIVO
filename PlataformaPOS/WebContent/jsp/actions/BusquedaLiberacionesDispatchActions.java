package cl.gmo.pos.venta.web.actions;

import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.utils.Utils;
import cl.gmo.pos.venta.web.beans.ListaEstadosBean;
import cl.gmo.pos.venta.web.beans.VentaPedidoBean;
import cl.gmo.pos.venta.web.facade.PosClientesFacade;
import cl.gmo.pos.venta.web.forms.BusquedaLiberacionesForm;
import cl.gmo.pos.venta.web.helper.BusquedaLiberacionesHelper;

public class BusquedaLiberacionesDispatchActions extends DispatchAction {

	public BusquedaLiberacionesHelper helper = new BusquedaLiberacionesHelper();
	Logger log = Logger.getLogger( this.getClass() );
	
	public BusquedaLiberacionesDispatchActions() {
	}
	
	
	
	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("BusquedaLiberacionesDispatchActions:cargaFormulario inicio");
		BusquedaLiberacionesForm formulario = (BusquedaLiberacionesForm)form;
		formulario.clean();
		Utils util = new Utils();
		HttpSession session = request.getSession();
		String local = String.valueOf(session.getAttribute(Constantes.STRING_SUCURSAL));
		String valCodLocal = PosClientesFacade.traeCodigoLocal(local);
		formulario.setCodigoLocal(String.valueOf(valCodLocal));
		formulario.setListaPedidos(new ArrayList<VentaPedidoBean>());
		formulario.setListaEstados(helper.traeEstadosEncargo());
		formulario.setPoscroll(Constantes.STRING_CERO);
		formulario.setIndex(Constantes.STRING_BLANCO);
		formulario.setIndex2(Constantes.STRING_BLANCO);
		formulario.setMensaje(Constantes.STRING_BLANCO);
		formulario.setPagina_status("inicio");
		//formulario.setFecha(util.restarDiasFecha(30));
		formulario.setFecha(util.traeFechaHoyFormateadaString());
		formulario.setFechaHasta(util.traeFechaHoyFormateadaString());
		
		
		log.info("BusquedaLiberacionesDispatchActions:cargaFormulario fin");
		return mapping.findForward(Constantes.FORWARD_LIBERACIONES);
	}
	
	
	
	public ActionForward buscarLiberacion(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("BusquedaLiberacionesDispatchActions:buscarLiberacion inicio");
		BusquedaLiberacionesForm formulario = (BusquedaLiberacionesForm)form;		
		
		formulario.setMensaje(Constantes.STRING_BLANCO);
		formulario.setRespuestaLiberacion("");
		System.out.println("Codigo =======>"+formulario.getCodigo());
		System.out.println("Formulario de Liberacion"+formulario.getAccion());
		if(Constantes.STRING_ACTION_DETALLE.equals(formulario.getAccion())){
			
			formulario.setListaDetalle(helper.traeDetalleLiberacionVentasPedidos(formulario));
			for(VentaPedidoBean v :formulario.getListaDetalle()){
				System.out.println("Compruebo cantidad de articulos en el obj Codigo =>"+v.getCod_detalle_vta()+" || "+v.getCod_lista_lib()+" <==> Linea =>"+v.getLinea()+" Grupo => "+v.getGrupo());

			}
			
			
			formulario.setPoscroll(formulario.getPoscroll());
			formulario.setIndex(formulario.getIndex());
			formulario.setIndex2(Constantes.STRING_BLANCO);
			helper.valida_trios_encargos_erroneos(formulario);
			return mapping.findForward(Constantes.FORWARD_LIBERACIONES);
			
		}else if(Constantes.STRING_SUPLEMENTO.equals(formulario.getAccion())){
			
			formulario.setListaDetalle(helper.traeDetalleLiberacionVentasPedidos(formulario));
			formulario.setListaSuplementos(helper.traeSuplementosPedidos(formulario));
			formulario.setPoscroll(formulario.getPoscroll());
			formulario.setIndex(formulario.getIndex());
			formulario.setIndex2(formulario.getIndex2());
			helper.valida_trios_encargos_erroneos(formulario);
			return mapping.findForward(Constantes.FORWARD_LIBERACIONES);
	    //Paso a la liberación
		}else if(Constantes.STRING_ACTION_LIBERACION.equals(formulario.getAccion())){
			
			HttpSession session = request.getSession();
			String local = String.valueOf(session.getAttribute(Constantes.STRING_SUCURSAL));
				//Se comenta la validación de encargos seleccionados LMARIN 20130827
				//if (helper.valida_campos_cdd(formulario)) {
				if (helper.validaEncargosSeleccionados(formulario.getListaPedidos())) {
		
					
					helper.creaArchivoLiberacion(formulario, local);
					if("".equals(formulario.getRespuestaLiberacion())){
						formulario.setRespuestaLiberacion("OK");
					}
					formulario.resetLiberacion(mapping, request);
					formulario.setPoscroll(Constantes.STRING_CERO);
					formulario.setIndex("");
				}
				else
				{
					formulario.setMensaje(Constantes.STRING_ERROR_SELECCION_ENCARGOS);
				}
					
				/*}
				else
				{
					formulario.setMensaje(Constantes.STRING_ERROR_CDD_LIBERACION);
				}*/
			
				return mapping.findForward(Constantes.FORWARD_LIBERACIONES);
				
		 }else if("buscar".equals(formulario.getAccion())){
			HttpSession session = request.getSession();
			String local = String.valueOf(session.getAttribute(Constantes.STRING_SUCURSAL));
			String valCodLocal = PosClientesFacade.traeCodigoLocal(local);
			String fecha = formulario.getFecha();
			String fechaHasta = formulario.getFechaHasta();
			formulario.setCodigoLocal(String.valueOf(valCodLocal));
			formulario.setListaPedidos(helper.traeVentasPedidos(valCodLocal, fecha,fechaHasta,formulario.getEstado_encargo()));
			//formulario.setListaEstados(helper.traeEstadosEncargo());
			//System.out.println(formulario.getListaEstados().get(0).getDescripcion());
			formulario.setPoscroll(Constantes.STRING_CERO);
			formulario.setIndex(Constantes.STRING_BLANCO);
			formulario.setIndex2(Constantes.STRING_BLANCO);
			formulario.setMensaje(Constantes.STRING_BLANCO);
			formulario.setPagina_status("");
			helper.valida_trios_encargos_erroneos(formulario);
		}
		
		
		log.info("BusquedaLiberacionesDispatchActions:buscarLiberacion fin");
		return mapping.findForward(Constantes.FORWARD_LIBERACIONES);
	}
	
	
}
