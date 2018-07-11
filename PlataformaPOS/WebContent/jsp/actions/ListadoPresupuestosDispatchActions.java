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
import cl.gmo.pos.venta.web.forms.ListadoPresupuestosForm;
import cl.gmo.pos.venta.web.helper.ListadoPresupuestosHelper;

public class ListadoPresupuestosDispatchActions extends DispatchAction {
	Logger log = Logger.getLogger( this.getClass() );
	ListadoPresupuestosHelper helper = new ListadoPresupuestosHelper();

	public ListadoPresupuestosDispatchActions() {
	}
	public void cargaInicial(ListadoPresupuestosForm formulario, String local, HttpSession session)
	{
		log.info("ListadoPresupuestosDispatchActions:cargaInicial Inicial inicio");
		helper.traeDatosFormulario(formulario, session);
		log.info("ListadoPresupuestosDispatchActions:cargaInicial Inicial fin");
	}
	public void Limpia(ListadoPresupuestosForm formulario)
	{
		log.info("ListadoPresupuestosDispatchActions:Limpia Inicial inicio");
		formulario.setDivisa(Constantes.STRING_CERO);
		formulario.setForma_pago(Constantes.STRING_CERO);
		formulario.setCerrado(Constantes.STRING_CERO);
		log.info("ListadoPresupuestosDispatchActions:Limpia Inicial fin");
	}
	
	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoPresupuestosDispatchActions:cargaFormulario Inicial inicio");
		ListadoPresupuestosForm formulario = (ListadoPresupuestosForm)form;
		HttpSession session =request.getSession();
		String sucursal = (String)session.getAttribute(Constantes.STRING_SUCURSAL);
		this.cargaInicial(formulario, sucursal, session);
		log.info("ListadoPresupuestosDispatchActions:cargaFormulario Inicial fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_PRESUPUESTOS);
	}
	
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoPresupuestosDispatchActions:buscar Inicial inicio");
		HttpSession session =request.getSession();
		String sucursal = (String)session.getAttribute(Constantes.STRING_SUCURSAL);
		ListadoPresupuestosForm formulario = (ListadoPresupuestosForm)form;
		this.cargaInicial(formulario, sucursal, session);
		helper.cargaListadoPresupuestos(formulario,sucursal);
		this.Limpia(formulario);
		session.setAttribute(Constantes.STRING_ACTION_LISTA_PRESUPUESTO, formulario.getListaPresupuestos());
		session.setAttribute(Constantes.STRING_ACTION_FECHA_BUSQUEDA_PRESUPUESTO, formulario.getFechaInicio()+" - "+formulario.getFechaTermino());
		session.setAttribute(Constantes.STRING_CERRADO, formulario.getCerrado());
		log.info("ListadoPresupuestosDispatchActions:buscar Inicial fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_PRESUPUESTOS);
	}
}
