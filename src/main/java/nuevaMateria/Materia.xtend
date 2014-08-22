package nuevaMateria

import editarNota.Nota
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
class Materia {
	
	@Property Boolean finalAprobado
	@Property String nombre
	@Property int añoDeCursada
	@Property List<Nota> notasDeCursada
	@Property String ubicacionDeLaMateria
	
	new(String nombre){
		this.nombre = nombre
	}
	
	new() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def crearMateria(String nombre){
		new Materia(nombre)
		//probablemente cuando esto pasa se tiene que agregar en la coleccion de materias del seguidor de carrera
	}
	
	def agregarNota(Nota nota){
		this.notasDeCursada.add(nota)
	}
}