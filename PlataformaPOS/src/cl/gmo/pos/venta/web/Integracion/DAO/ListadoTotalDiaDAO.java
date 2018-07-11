package cl.gmo.pos.venta.web.Integracion.DAO;

import cl.gmo.pos.venta.web.beans.ListasTotalesDiaBean;

public interface ListadoTotalDiaDAO {
	
	 public ListasTotalesDiaBean traeListasTotales(String fecha_ini,String fecha_fin,String local) throws Exception;

}
