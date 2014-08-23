package seguidorDeCarrera

import java.util.List
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable

@Observable
class SeguidorDeCarrera  {

	@Property
	List<Materia> coleccionMaterias
	
	def agregarMateria(Materia materia) {
		
		this.coleccionMaterias.add(materia)
				
	}
	
	
	new () {
		newArrayList(coleccionMaterias)
		coleccionMaterias.add(new Materia("Módulo B"))
		coleccionMaterias.add(new Materia("Módulo A	"))
		
		
		
	}
	
}