package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.HashMap

class Recetario {

	private ArrayList<Receta> recetas;

	def agregarRecetaSimple(String nombre, HashMap<Ingrediente, Integer> ingredientes,
		HashMap<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada) {

		val recetaSimple = new RecetaSimple(null, nombre, ingredientes, condimentos, explicacion, dificultad, temporada)
		// Setear tipo de receta publica 
		recetas.add(recetaSimple)
	}

	def getReceta( String nombre) {
		for (i : 0 ..< recetas.length) {
			val receta = recetas.get(i)
			if(receta.nombre == nombre) return receta
		} 
		// Exception!
	}
}