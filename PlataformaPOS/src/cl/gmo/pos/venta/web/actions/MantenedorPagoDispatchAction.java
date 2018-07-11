package cl.gmo.pos.venta.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.forms.SeleccionPagoForm;
import cl.gmo.pos.venta.web.helper.SeleccionPagoHelper;

public class MantenedorPagoDispatchAction extends DispatchAction{
	
	SeleccionPagoHelper helper = new SeleccionPagoHelper();
	Logger log = Logger.getLogger( this.getClass() );
	private void carga_formulario(SeleccionPagoForm formulario, HttpSession session)
	{
		log.info("MantenedorPagoDispatchAction:carga_formulario  inicio");

		log.info("MantenedorPagoDispatchAction:carga_formulario  fin");
		formulario = helper.cargaInicial(formulario, session, helper.traeFechaHoyFormateadaString());
	}

	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("MantenedorPagoDispatchAction:cargaFormulario  inicio");
		HttpSession session = request.getSession(true);
		session.setAttribute(Constantes.STRING_ERROR, Constantes.STRING_BLANCO);
		SeleccionPagoForm formulario = (SeleccionPagoForm)form;
		formulario.setOrigen(session.getAttribute(Constantes.STRING_ORIGEN).toString());
		this.carga_formulario(formulario, session);
		session.setAttribute(Constantes.STRING_LISTA_FORMAS_PAGOS, formulario.getListaFormasPago());
		session.setAttribute(Constantes.STRING_CABECERA_BOLETAS, formulario);
		session.setAttribute(Constantes.STRING_CABECERA_GUIA, formulario);
		
		log.info("MantenedorPagoDispatchAction:cargaFormulario  fin");
		return mapping.findForward(Constantes.FORWARD_PAGO);
	}
	
	
}
