package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import javax.persistence.Entity

@Entity
public class UsuarioDiabetico extends UsuarioDecorator {
	new(Usuario decorado) {
		super(decorado)
		decorado.condicion.add(Condicion.DIABETICO)

	//decorado.condicion.add( Condicion.DIABETICO )
	}
	
	new(){
	}

	override estadoRutina() {

		// Rutina saludable si tiene una rutina activa o no pesa más de 70 kgs.
		return ( (decorado.getPeso() < 70 || decorado.getRutina().rutinaActiva() ) && decorado.estadoRutina())
	}

	override usuarioValido() {
		return ( (decorado.preferenciasAlimenticias.size > 0) && (decorado.sexo != null) && decorado.usuarioValido())
	}

	override cumpleCondicion(Receta receta) {
		return ((receta.cantidadDeAzucar() == 0 ))
	}

	override notificar() {
		getObservadores().forEach[actualizar(this)]
	}
	
	override consultarPorReceta( Receta receta ){
		consultas.clear()
		if ( receta.puedeVer( this )) consultas.add( receta )
		notificar()
	}
	override esVegano() {
		return false || decorado.esVegano();
	}

	override esHipertenso() {
		return false || decorado.esHipertenso();
	}

	override esDiabetico() {
		return true;
	}

	override cumpleMismasCondiciones(Usuario usuario) {

		usuario.esDiabetico() && decorado.cumpleMismasCondiciones(usuario)
	}

	override crearPerfil() {

		val UsuarioDiabetico usuarioCopia = new UsuarioDiabetico(decorado.crearPerfil)

		return usuarioCopia
	}

	//override getRecetasBuscadasFavoritas() {}	

}
