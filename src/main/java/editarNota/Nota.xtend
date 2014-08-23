package editarNota

import java.util.Date
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable

@Observable
class Nota {
	
	@Property Date fecha
	@Property String descripcion
	@Property Boolean aprobado
	@Property Materia materia
	
			
	def agregarNota() {
		materia.agregarNota(this)
	}
	
	new(){
		super()
	}
}