package seguidorDeCarrera

import java.util.List
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Observable
class SeguidorDeCarrera {

	@Property
	List<Materia> coleccionMaterias = new ArrayList

	def agregarMateria(Materia materia) {

		this.coleccionMaterias.add(materia)

	}

	new() {
		this.inicializarColeccionDeMaterias
	}
	
	def inicializarColeccionDeMaterias() {
		coleccionMaterias = newArrayList
	}

}
