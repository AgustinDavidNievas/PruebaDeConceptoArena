package editarNota

import java.util.Date
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import seguidorDeCarrera.SeguidorDeCarrera

@Observable
class Nota extends Entity implements Cloneable {


	@Property String fecha
	@Property String descripcion
	@Property Boolean aprobado
	@Property Materia materia
	@Property SeguidorDeCarrera seguidorDeCarrera

	new() {

		super()
		this.seguidorDeCarrera = new SeguidorDeCarrera
		println("Se creo el seguidor de carrera")
		materia = new Materia

	}

	def agregarFecha(String fecha) {

//		this.fecha = fecha  problemas con String / Date

		println("pase por agregarFecha")

	}

	def agregarDesc(String descripcion) {

		this.materia = new Materia
		
		SeguidorDeCarrera.seguidorDeCarreraUnico.agregarMateria(materia)

		this.descripcion = descripcion

		materia.agregarNota(this)
		
		println("pase por agregar Desc")

	}
	
		override clone() {
		super.clone()
	}
	
	def copiarA(Nota destino) {
		destino.fecha = this.fecha
		destino.descripcion = this.descripcion
//		destino.aprobo = this.aprobo
	}

}
