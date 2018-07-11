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
import cl.gmo.pos.venta.web.forms.ListadoTotalDiaForm;
import cl.gmo.pos.venta.web.helper.ListadoTotalDiaHelper;

public class ListadoTotalDiaDispatchActions extends DispatchAction {

	Logger log = Logger.getLogger( this.getClass() );
	ListadoTotalDiaHelper helper = new ListadoTotalDiaHelper();
	
	public ListadoTotalDiaDispatchActions() {
	}

	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoTotalDiaDispatchActions:cargaFormulario Inicial inicio");
		log.info("ListadoTotalDiaDispatchActions:cargaFormulario Inicial fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_TOTAL_DIA);
	}
	
	
	public ActionForward buscar(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
	{
		log.info("ListadoTotalDiaDispatchActions:buscar Inicial inicio");
		HttpSession session =request.getSession();
		String sucursal = (String)session.getAttribute(Constantes.STRING_SUCURSAL);
		ListadoTotalDiaForm formulario = (ListadoTotalDiaForm)form;
		formulario.setError(Constantes.STRING_ERROR);
		if (helper.valida_campos(formulario))
		{
			helper.cargaListadosTotalesDia(formulario,sucursal);
		}
		session.setAttribute(Constantes.STRING_ACTION_LISTA_VENTA, formulario.getListaTotalDiaVenta());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_ANTICIPO, formulario.getListaTotalDiaAnticipo());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_VENTA_DEVOLUCION, formulario.getListaTotalDiaDevolucion());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_VENTA_ENCARGO, formulario.getListaTotalDiaEncargo());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_VENTA_ENTREGA, formulario.getListaTotalDiaEntrega());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_FECHA_BUSQUEDA_TOTAL, formulario.getFecha_inicio());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_VENTA_MOVIMIENTOS, formulario.getNumero_movimientos());
		session.setAttribute(Constantes.STRING_ACTION_LISTA_VENTA_FECHA, formulario.getFecha_inicio());
		log.info("ListadoTotalDiaDispatchActions:buscar Inicial fin");
		return mapping.findForward(Constantes.FORWARD_LISTADO_TOTAL_DIA);
	}
}
