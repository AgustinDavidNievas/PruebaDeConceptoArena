package editarNota

import java.util.Date
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import seguidorDeCarrera.SeguidorDeCarrera

@Observable
class Nota extends Entity implements Cloneable  {
	
	@Property Date fecha
	@Property String descripcion
	@Property Boolean aprobado
	@Property Materia materia
	@Property SeguidorDeCarrera seguidorDeCarrera
	
	new(){
		
		super()
		this.seguidorDeCarrera = new SeguidorDeCarrera
		println("Se creo el seguidor de carrera")
		materia = new Materia
		
	
	}
	
	

			
	def agregarFecha(String fecha) {

		
		println("pase por agregarFecha")
		
	}
	
	def agregarDesc(String descripcion) {
		
		this.descripcion = descripcion

		materia.agregarNota(this)
		
	}
	

	

}