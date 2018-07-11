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
import cl.gmo.pos.venta.web.beans.ProductosBean;
import cl.gmo.pos.venta.web.forms.SuplementosForm;
import cl.gmo.pos.venta.web.helper.SuplementosHelper;

public class SuplementoDispatchActions extends DispatchAction  {
	SuplementosHelper helper = new SuplementosHelper();
	
	Logger log = Logger.getLogger( this.getClass() );
	public SuplementoDispatchActions() {
	}
	
	public void cargaformulario(SuplementosForm formulario, HttpSession session)
	{
		log.info("SuplementoDispatchActions:cargaformulario  inicio");
		helper.cargaFormulario(formulario, session);
		log.info("SuplementoDispatchActions:cargaformulario  fin");
	}
	
	public ActionForward carga(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("SuplementoDispatchActions:carga inicio");
		//String producto = request.getParameter(Constantes.STRING_PRODUCTO).toString();
		HttpSession session = request.getSession();
		//session.setAttribute(Constantes.STRING_PRODUCTO, producto);
		//estrae producto proveniente de la venta 
		
		SuplementosForm formulario = (SuplementosForm)form;
		ProductosBean prod = (ProductosBean)session.getAttribute(Constantes.STRING_PRODUCTO);
		
		formulario.setProducto(prod.getCod_barra());
		
		String ojo = !prod.getOjo().equals("") ? prod.getOjo().toUpperCase() : "";
		formulario.setSeg_ojo(ojo);
		
		
		session.setAttribute(Constantes.STRING_LISTA_SUPLEMENTOS, prod.getListaSuplementos());
		this.cargaformulario(formulario, session);
		log.info("SuplementoDispatchActions:carga  fin");
		return mapping.findForward(Constantes.FORWARD_SUPLEMENTOS);
	}
	
	public ActionForward agregar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("SuplementoDispatchActions:agregar  inicio");
		HttpSession session = request.getSession();
		SuplementosForm formulario = (SuplementosForm)form;
		
		String accion = formulario.getAccion();
		String bloqueado = (String)session.getAttribute(Constantes.STRING_ESTADO_FORM_SUPLEMENTOS);
		ProductosBean prod = (ProductosBean)session.getAttribute(Constantes.STRING_PRODUCTO);
		formulario.setProducto(prod.getCod_barra());
		
		
		
		/*AGREGO DESCRIPCION OJO*/
		//formulario.setSeg_ojo(prod.getOjo());
		
		
		this.cargaformulario(formulario, session);
		if (accion.equals(Constantes.STRING_CERRAR))
		{
			helper.validaCierre(formulario, session);
		}
		if (accion.equals(Constantes.STRING_ELIMINAR_PRODUCTO))
		{
			if (!Constantes.STRING_ACTION_BLOQUEA.equals(bloqueado)) {
				helper.eliminarSuplemento(formulario);
			}
			else
			{
				helper.cargaValores(formulario, session, prod);
				formulario.setError(Constantes.ERROR_ENCARGO_BLOQUEADO);
			}
		}
		if (accion.equals(Constantes.STRING_AGREGAR))
		{
			if (!Constantes.STRING_ACTION_BLOQUEA.equals(bloqueado)) {
				helper.agregaSuplemento(formulario, session);
			}
			else
			{
				helper.cargaValores(formulario, session, prod);
				formulario.setError(Constantes.ERROR_ENCARGO_BLOQUEADO);
			}
		}
		if (accion.equals(Constantes.STRING_CARGA_VALORES))
		{
			helper.cargaValores(formulario, session, prod);
		}
		log.info("SuplementoDispatchActions:agregar  fin");
		return mapping.findForward(Constantes.FORWARD_SUPLEMENTOS);
	}

}
