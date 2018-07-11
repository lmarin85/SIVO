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
import cl.gmo.pos.venta.web.beans.GraduacionesBean;
import cl.gmo.pos.venta.web.forms.EntregaPedidoForm;
import cl.gmo.pos.venta.web.helper.EntregaPedidoHelper;
import cl.gmo.pos.venta.web.helper.VentaPedidoHelper;

public class EntregaPedidosDispatchActions extends DispatchAction {
	Logger log = Logger.getLogger( this.getClass() );
	public void cargaInicial(EntregaPedidoForm formulario, String local, HttpSession session)
	{	
		log.info("EntregaPedidosDispatchActions:carga  inicio");
		VentaPedidoHelper helper = new VentaPedidoHelper();
		formulario.setListaFormasPago(helper.traeFormasPago());
		formulario.setListaAgentes(helper.traeAgentes(local));
		formulario.setListaConvenios(helper.traeConvenios());
		formulario.setListaDivisas(helper.traeDivisas());
		formulario.setListaIdiomas(helper.traeIdiomas());
		formulario.setListaPromociones(helper.traePromociones());
		formulario.setListaTiposPedidos(helper.traeListaTiposPedidos());
		log.info("EntregaPedidosDispatchActions:carga  fin");
		
	}
	
	public ActionForward cargaFormulario(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
		log.info("EntregaPedidosDispatchActions:cargaFormulario  inicio");
		EntregaPedidoForm formulario = (EntregaPedidoForm)form;
		HttpSession session = request.getSession(true);
		String local = session.getAttribute(Constantes.STRING_SUCURSAL).toString();
		cargaInicial(formulario,  local,  session);
		formulario.setGraduacion(new GraduacionesBean());
		log.info("EntregaPedidosDispatchActions:cargaFormulario  fin");
		return mapping.findForward(Constantes.FORWARD_ENTREGA_PEDIDO);
	}

	
	public ActionForward cargabuscarPedidos(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		log.info("EntregaPedidosDispatchActions:cargabuscarPedidos  inicio");
		EntregaPedidoForm formulario = (EntregaPedidoForm)form;
		HttpSession session = request.getSession(true);
		String local = session.getAttribute(Constantes.STRING_SUCURSAL).toString();
		cargaInicial(formulario,  local,  session);
		formulario.setGraduacion(new GraduacionesBean());
		log.info("EntregaPedidosDispatchActions:cargabuscarPedidos  fin");
		return mapping.findForward(Constantes.FORWARD_ENTREGA_BUSQUEDA_PEDIDO);
	}
	
	public ActionForward buscarPedidos(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
		log.info("EntregaPedidosDispatchActions:buscarPedidos  inicio");
		EntregaPedidoHelper helper = new EntregaPedidoHelper();	
		EntregaPedidoForm formulario = (EntregaPedidoForm)form;
		HttpSession session = request.getSession(true);
		String local = session.getAttribute(Constantes.STRING_SUCURSAL).toString();
		cargaInicial(formulario,  local,  session);
		
		String pagina=Constantes.STRING_BLANCO;
		
		if(Constantes.STRING_BUSQUEDA.equals(formulario.getAccion())){
		
			formulario = helper.buscarPedidos(formulario);
			pagina = Constantes.FORWARD_ENTREGA_BUSQUEDA_PEDIDO;
			formulario.setGraduacion(new GraduacionesBean());
		}else if(Constantes.STRING_ACTION_TRAE_ENTREGA_PEDIDO.equals(formulario.getAccion())){
			
			formulario = helper.traeEntregaPedido(formulario, session);
			formulario.setPagina(Constantes.STRING_ACTION_ENCONTRADO);
			formulario.setGraduacion(new GraduacionesBean());
			pagina = Constantes.FORWARD_ENTREGA_PEDIDO;	
		}
					
		log.info("EntregaPedidosDispatchActions:buscarPedidos  fin");
		return mapping.findForward(pagina);
	}
}
