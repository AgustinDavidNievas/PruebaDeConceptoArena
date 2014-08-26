package nuevaMateria

import editarNota.Nota
import java.util.List
import org.uqbar.commons.utils.Observable
import seguidorDeCarrera.SeguidorDeCarrera
import org.uqbar.commons.model.Entity

@Observable
class Materia extends Entity implements Cloneable {

	@Property Boolean finalAprobado
	@Property String nombre
	@Property int anioDeCursada
	@Property List<Nota> notasDeCursada
	@Property String ubicacionDeLaMateria
	@Property String profesor
	@Property SeguidorDeCarrera seguidorDeCarrera

	new(String nombre) {
		this.nombre = nombre
		this.notasDeCursada = newArrayList
	}

	new() {
		super()
		this.notasDeCursada = newArrayList
		
	}

	def crearMateria(String nombre) {
		new Materia(nombre)
		//this.notasDeCursada = newArrayList
		//this.seguidorDeCarrera = new SeguidorDeCarrera
		//this.seguidorDeCarrera.agregarMateria(this)
		SeguidorDeCarrera.seguidorDeCarreraUnico.agregarMateria(this)

	}

	def agregarNota(Nota nota) {
		//this.seguidorDeCarrera = new SeguidorDeCarrera
		
		this.notasDeCursada.add(nota)

	}
	
	override clone()	{
		return super.clone
	}
}
