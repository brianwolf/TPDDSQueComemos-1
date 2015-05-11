package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List


class FiltroExcesoCaloriasD extends FiltroDecoratorD {
	
	new(Filtro decorado) 
	{
		super(decorado)
	}	
	
	override aplicarFiltro(List<Receta> recetasConocidas, Usuario unUsuario)
	{		
		return recetasConocidas.filter[unaReceta | unaReceta.getCalorias()<500].toList()	
	}
}