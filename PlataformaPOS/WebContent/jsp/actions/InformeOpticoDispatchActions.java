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
import cl.gmo.pos.venta.web.forms.InformeOpticoForm;
import cl.gmo.pos.venta.web.helper.InformeOpticoHelper;


public class InformeOpticoDispatchActions extends DispatchAction {
	Logger log = Logger.getLogger( this.getClass() );
	InformeOpticoHelper helper= new InformeOpticoHelper();
	
	public InformeOpticoDispatchActions() {
	}
	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("InformeOpticoDispatchActions:cargaFormulario  inicio");

		log.info("InformeOpticoDispatchActions:cargaFormulario  fin");
		return mapping.findForward(Constantes.FORWARD_INFORME_OPTICO);
	}
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("InformeOpticoDispatchActions:buscar  inicio");
		InformeOpticoForm formulario = (InformeOpticoForm)form;
		HttpSession session =request.getSession();
		try {
			helper.traeInformeOptico(formulario.getCdgCli(), null, null, formulario);
			session.setAttribute(Constantes.STRING_ACTION_INFORME_OPTICO, formulario);
		} catch (Exception e) {
			log.error("InformeOpticoDispatchActions:buscar  error catch",e);
		}
		return mapping.findForward(Constantes.FORWARD_INFORME_OPTICO);
	}

}
