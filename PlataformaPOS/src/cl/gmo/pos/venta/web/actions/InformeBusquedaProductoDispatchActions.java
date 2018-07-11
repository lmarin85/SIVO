package cl.gmo.pos.venta.web.actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.utils.Utils;
import cl.gmo.pos.venta.web.forms.InformeBusquedaProductoForm;
import cl.gmo.pos.venta.web.helper.InformeBusquedaProductoHelper;

public class InformeBusquedaProductoDispatchActions extends DispatchAction{
	Logger log = Logger.getLogger( this.getClass() );
	public InformeBusquedaProductoDispatchActions() {
	}

	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{		
		log.info("InformeBusquedaProductoDispatchActions:cargaFormulario  inicio");
		InformeBusquedaProductoForm formulario = (InformeBusquedaProductoForm) form;
		Utils util = new Utils();
		formulario.setFechaDesde(util.restarDiasFecha(30));
		formulario.setFechaHasta(util.traeFechaHoyFormateadaString());
		formulario.setEstadoPagina("");
		log.info("InformeBusquedaProductoDispatchActions:cargaFormulario  fin");
		
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA_GENERAL_ARTICULOS);
	}
	public ActionForward buscarArticulo(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{		
		log.info("InformeBusquedaProductoDispatchActions:buscarArticulo  inicio");
		
		InformeBusquedaProductoForm formulario = (InformeBusquedaProductoForm)form;
		InformeBusquedaProductoHelper informeBusquedaProducto = new InformeBusquedaProductoHelper();
		
		String fechaDesde = formulario.getFechaDesde();
		String fechaHasta = formulario.getFechaHasta();
		
		/*Date fecha_desde = informeBusquedaProducto.formatoFechaCh(fechaDesde);
		Date fecha_hasta = informeBusquedaProducto.formatoFechaCh(fechaHasta);
		
		int diferenciaMeses = informeBusquedaProducto.fechasDiferenciaEnDias(fecha_desde, fecha_hasta);
		*/
		//if(diferenciaMeses >= 30){
		informeBusquedaProducto.traeInformeBusquedaProducto(Integer.toString(formulario.getCodigoArticulo()), formulario.getDescripcionArticulo(), formulario);
		/*}else{
			formulario.setEstadoPagina("ERROR_DIAS");
		}*/
		
		log.info("InformeBusquedaProductoDispatchActions:buscarArticulo  fin");
		return mapping.findForward(Constantes.FORWARD_BUSQUEDA_GENERAL_ARTICULOS);
	}
	
}
