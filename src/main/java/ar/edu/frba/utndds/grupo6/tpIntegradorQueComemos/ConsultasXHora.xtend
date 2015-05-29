package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Map
import java.util.Calendar

class ConsultasXHora implements Observador {
	
	private Map< Integer , Integer> consultasXHora
	private Calendar calendario = Calendar.getInstance();
	
	
	override actualizar( UsuarioPosta usuario ) { 
		if ( consultasXHora.containsKey( calendario.get(Calendar.HOUR_OF_DAY ) )) {
			consultasXHora.put( calendario.get( Calendar.HOUR_OF_DAY ) , consultasXHora.get(calendario.get( Calendar.HOUR_OF_DAY )) + 1 )	
		} else {
			consultasXHora.put( calendario.get( Calendar.HOUR_OF_DAY ), 1 )
		}
		
	}
	
}