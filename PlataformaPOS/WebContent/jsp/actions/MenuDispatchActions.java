/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.gmo.pos.venta.web.actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cl.gmo.pos.venta.utils.Constantes;
import cl.gmo.pos.venta.web.beans.SucursalesBean;
import cl.gmo.pos.venta.web.forms.MenuForm;
import cl.gmo.pos.venta.web.helper.LoginHelper;
import cl.gmo.pos.venta.web.helper.MenuHelper;


public class MenuDispatchActions extends DispatchAction{
	Logger log = Logger.getLogger( this.getClass() );
    MenuHelper menuHelper = new MenuHelper();
    
    public MenuDispatchActions(){
    }
    
    public ActionForward CargaMenu(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
    		log.info("MenuDispatchActions:ingresaMedico  inicio");
    		HttpSession session = request.getSession(true);
    		session.setAttribute(Constantes.STRING_TIPO_BOLETA,"");
            MenuForm actionForm = (MenuForm)form;
            actionForm = menuHelper.llenaMenu(actionForm, session.getAttribute(Constantes.STRING_USUARIO).toString());
            log.info("MenuDispatchActions:ingresaMedico  fin");
            return mapping.findForward(Constantes.FORWARD_MENU);
    }
    
    public ActionForward SeleccionaAccion(ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
    {
    	log.info("MenuDispatchActions:SeleccionaAccion  inicio");
        HttpSession session = request.getSession();
        session.setAttribute(Constantes.STRING_ERROR, Constantes.STRING_BLANCO);
        MenuForm menuForm = (MenuForm)form;

        menuForm = menuHelper.llenaMenu(menuForm, session.getAttribute(Constantes.STRING_USUARIO).toString());
        
            if (Constantes.STRING_VENTA_DIRECTA.equals(menuForm.getAccion()))
            {
                if (menuHelper.validaAperturaCaja(session.getAttribute(Constantes.STRING_SUCURSAL).toString())) {
                	menuForm.setInclude(Constantes.STRING_ACTION_VTA_DIRE_CARGA_MENU);
                	return mapping.findForward(Constantes.FORWARD_MENU);
                }
                else
                {
                    session.setAttribute(Constantes.STRING_ERROR, Constantes.STRING_CAJA);
                    return mapping.findForward(Constantes.FORWARD_MENU);
                }
            }
            else if(Constantes.STRING_VENTA_PEDIDO.equals(((MenuForm)form).getAccion()))
            {
               // if (menuHelper.validaAperturaCaja(session.getAttribute(Constantes.STRING_SUCURSAL).toString())) {
                	menuForm.setInclude(Constantes.STRING_ACTION_VTA_PEDI_CARGA_FORMULARIO);
                	return mapping.findForward(Constantes.FORWARD_MENU);
              //  }
              //  else
              //  {
              //      session.setAttribute(Constantes.STRING_ERROR, Constantes.STRING_CAJA);
              //      return mapping.findForward(Constantes.FORWARD_MENU);
              //  }
            }
            else if(Constantes.STRING_CLIENTES.equals(((MenuForm)form).getAccion()))
            {
                	menuForm.setInclude(Constantes.STRING_ACTION_CLIENTE_CARGA_FORMULARIO );
                	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.STRING_GRADUACION.equals(((MenuForm)form).getAccion()))
            {
                	menuForm.setInclude(Constantes.STRING_ACTION_GRADUACION_CARGA_FORMULARIO);
                	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.STRING_PRESUPUESTO.equals(((MenuForm)form).getAccion()))
            {
                	menuForm.setInclude(Constantes.STRING_ACTION_PRESUPUESTO_CARGA_FORMULARIO);
                	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.STRING_MEDICO.equals(((MenuForm)form).getAccion()))
            {
                	menuForm.setInclude(Constantes.STRING_ACTION_MEDICO_CARGA_FORMULARIO);
                	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.STRING_LIBERACIONES.equals(((MenuForm)form).getAccion()))
            {
                	menuForm.setInclude(Constantes.STRING_ACTION_LIBERACION_CARGA_FORMULARIO);
                	
                	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.STRING_CERRAR.equals(menuForm.getAccion())){
            	session.invalidate();
            	return mapping.findForward(Constantes.FORWARD_INDEX);
            	
            }else if(Constantes.STRING_DEVOLUCION.equals(((MenuForm)form).getAccion())){
            	
            	menuForm.setInclude(Constantes.STRING_ACTION_DEVOLUCION_CARGA_FORMULARIO);            	
            	return mapping.findForward(Constantes.FORWARD_MENU);
            	
            }else if(Constantes.STRING_ENTREGA_PEDIDOS.equals(((MenuForm)form).getAccion())){
            	
            	menuForm.setInclude(Constantes.STRING_ACTION_ENTREGA_PEDIDO_CARGA_FORMULARIO);            	
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }else if(Constantes.FORWARD_LISTADO_TOTAL_DIA.equals(((MenuForm)form).getAccion()))
            {
            	menuForm.setInclude(Constantes.STRING_URL_LISTADO_TOTAL_DIA);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.FORWARD_LISTADO_BOLETAS.equals(((MenuForm)form).getAccion()))
            {
            	menuForm.setInclude(Constantes.STRING_URL_LISTADO_BOLETAS);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.FORWARD_LISTADO_PRESUPUESTOS.equals(((MenuForm)form).getAccion()))
            {
            	menuForm.setInclude(Constantes.STRING_URL_LISTADO_PRESUPUESTO);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.FORWARD_LISTADO_TRABAJOS_PENDIENTES.equals(((MenuForm)form).getAccion()))
            {
            	menuForm.setInclude(Constantes.STRING_URL_LISTADO_TRABAJOS_PENDIENTES);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.STRING_ACTION_LISTADO_INFORME_OPTICO.equals(((MenuForm)form).getAccion()))
            {
            	menuForm.setInclude(Constantes.STRING_URL_INFORME_OPTICO);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.STRING_COPIA_GUIA_BOLETA.equals(((MenuForm)form).getAccion()))
            {
            	menuForm.setInclude(Constantes.STRING_URL_COPIA_GUIA_BOLETA);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.FORWARD_BUSQUEDA_GENERAL_ARTICULOS.equals(((MenuForm)form).getAccion()))
            {
            	menuForm.setInclude(Constantes.STRING_URL_INFORME_BUSQUEDA_PRODUCTO);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            else if(Constantes.FORWARD_CAMBIO_FOLIO.equals(((MenuForm)form).getAccion())){
            	menuForm.setInclude(Constantes.STRING_URL_CAMBIO_FOLIO);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
            //LMARIN 20130911
            else if(Constantes.FORWARD_LISTADO_HISTORIAL_REQUERIMIENTOS.equals(((MenuForm)form).getAccion())){
            	
            	menuForm.setInclude(Constantes.STRING_URL_HISTORIAL_REQUERIMIENTO);
            	return mapping.findForward(Constantes.FORWARD_MENU);
            }
           
            log.info("MenuDispatchActions:SeleccionaAccion  fin");
            return mapping.findForward(Constantes.FORWARD_INDEX);

    }

    public ActionForward cargaSucursal(ActionMapping mapping,
    		
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
    		log.info("MenuDispatchActions:cargaSucursal  inicio");
		 	HttpSession session = request.getSession();
	        MenuForm actionForm = (MenuForm)form;
	        LoginHelper loginHelper = new LoginHelper();
	        String usuario = (String) session.getAttribute(Constantes.STRING_USUARIO);
	       
	        ArrayList<SucursalesBean> listaSucursales = loginHelper.traeNombreSucursal(usuario);
	        actionForm.setColSucursales(listaSucursales);  
	        //VALIDACION SOLO TIENDAS HABILITADAS CON BOLETA ELECTRONICA 
	        	if (listaSucursales.size() == 1) {
		        	actionForm.setUsuario(String.valueOf(session.getAttribute(Constantes.STRING_USUARIO)));
		        	actionForm.setNombre_sucursal(String.valueOf(listaSucursales.get(0).getDescripcion()));
		        	session.setAttribute(Constantes.STRING_NOMBRE_SUCURSAL, actionForm.getNombre_sucursal());
		        	session.setAttribute(Constantes.STRING_SUCURSAL, listaSucursales.get(0).getSucursal());
					session.setAttribute(Constantes.STRING_SUCURSAL_TELEFONO, listaSucursales.get(0).getTelefono());
		        	log.info("MenuDispatchActions:cargaSucursal  fin");
		        	return mapping.findForward(Constantes.FORWARD_SUCCESS);
				}
		        else
		        {
		        	session.setAttribute(Constantes.STRING_LISTA_SUCURSALES, listaSucursales);
		        	log.info("MenuDispatchActions:cargaSucursal  fin");
			        return mapping.findForward(Constantes.FORWARD_CARGA_SUCURSAL); 
		        }
	        
	}

	public ActionForward validaSucursal(ActionMapping mapping,
				ActionForm form,
				HttpServletRequest request,
				HttpServletResponse response) 
	 {
			log.info("MenuDispatchActions:validaSucursal  inicio");
		   HttpSession session = request.getSession();
		   MenuForm formulario = (MenuForm)form;
		   session.setAttribute(Constantes.STRING_SUCURSAL, formulario.getCodigoSucursal());
		   ArrayList<SucursalesBean> listaSucursales = new ArrayList<SucursalesBean>();
		   listaSucursales = (ArrayList<SucursalesBean>) session.getAttribute(Constantes.STRING_LISTA_SUCURSALES);
		   
		   for (SucursalesBean sucursalesBean : listaSucursales)
		   {
			 
			   if(sucursalesBean.getSucursal().equals(formulario.getCodigoSucursal()))
			   {
				   session.setAttribute(Constantes.STRING_NOMBRE_SUCURSAL, sucursalesBean.getDescripcion());
				   session.setAttribute(Constantes.STRING_SUCURSAL_TELEFONO, sucursalesBean.getTelefono());
				   session.setAttribute(Constantes.STRING_TIPO_BOLETA, sucursalesBean.getTipo_boleta());
			   }
		   }
		   formulario.setUsuario(String.valueOf(session.getAttribute(Constantes.STRING_USUARIO)));
		   formulario.setNombre_sucursal(String.valueOf(session.getAttribute(Constantes.STRING_NOMBRE_SUCURSAL)));
		   log.info("MenuDispatchActions:validaSucursal  fin");
		   System.out.println("TIPO BOLETA ==> " + session.getAttribute(Constantes.STRING_TIPO_BOLETA).toString());
		  
		   if(formulario.getCodigoSucursal().equals("T002")){
			   return mapping.findForward(Constantes.FORWARD_SUCCESS);
		   }else{
			   if(session.getAttribute(Constantes.STRING_TIPO_BOLETA).toString().equals("E")){
				   return mapping.findForward(Constantes.FORWARD_SUCCESS);
			   }else{
				   session.setAttribute("error_tienda", "tienda_novalida");
				   return mapping.findForward(Constantes.STRING_ERROR);
			   }
		   }
	 }
   
    
}
