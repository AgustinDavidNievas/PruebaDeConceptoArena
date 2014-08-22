package nuevaMateria

import editarNota.Nota
import java.util.List

class Materia {
	
	@Property Boolean finalAprobado
	@Property String nombre
	@Property int añoDeCursada
	@Property List<Nota> notasDeCursada
	@Property String ubicacionDeLaMateria
	
	new(String nombre){
		this.nombre = nombre
	}
	
	def crearMateria(String nombre){
		new Materia(nombre)
		//probablemente cuando esto pasa se tiene que agregar en la coleccion de materias del seguidor de carrera
	}
	
	def agregarNota(Nota nota){
		this.notasDeCursada.add(nota)
	}
}