package editarNota

import java.util.Date
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
class Nota extends Entity implements Cloneable {
	
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
	
	override clone() {
		super.clone()
	}
}