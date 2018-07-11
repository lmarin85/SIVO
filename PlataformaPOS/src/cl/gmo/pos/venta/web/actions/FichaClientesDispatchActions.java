package cl.gmo.pos.venta.web.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;

public class FichaClientesDispatchActions extends DispatchAction {
	Logger log = Logger.getLogger( this.getClass() );
	public FichaClientesDispatchActions() {
	}

	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("FichaClientesDispatchActions:cargaFormulario  inicio");
		log.info("FichaClientesDispatchActions:cargaFormulario  fin");
		return mapping.findForward(Constantes.FORWARD_FICHA_CLIENTES);
	}
}
