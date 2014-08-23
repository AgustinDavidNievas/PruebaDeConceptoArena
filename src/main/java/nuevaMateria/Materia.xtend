package nuevaMateria

import editarNota.Nota
import java.util.List
import org.uqbar.commons.utils.Observable
import seguidorDeCarrera.SeguidorDeCarrera

@Observable
class Materia {
	
	@Property Boolean finalAprobado
	@Property String nombre
	@Property int anioDeCursada
	@Property List<Nota> notasDeCursada
	@Property String ubicacionDeLaMateria
	@Property String profesor
	@Property SeguidorDeCarrera seguidorDeCarrera
	
	new(String nombre){
		this.nombre = nombre
	}
	
	new() {
		super()
	}
	
	def crearMateria(String nombre){
		new Materia(nombre)
		notasDeCursada = newArrayList
		seguidorDeCarrera.agregarMateria(this)
	
		//probablemente cuando esto pasa se tiene que agregar en la coleccion de materias del seguidor de carrera
	}
	
	def agregarNota(Nota nota){
		this.notasDeCursada.add(nota)
	}
}