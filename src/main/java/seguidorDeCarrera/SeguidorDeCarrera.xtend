package seguidorDeCarrera

import java.util.List
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import editarNota.Nota

@Observable
class SeguidorDeCarrera {

	@Property List<Materia> coleccionMaterias = new ArrayList
	@Property String ubicacionDeLaMateria
	@Property int anioDeCursada
	@Property Boolean finalAprobado
	
	@Property Observer observerDelCheckBoxAprobado
	@Property Observer observerDelAnioDeCursada

	//Selecciones
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	
	def agregarMateria(Materia materia) {

		this.coleccionMaterias.add(materia)

	}

	new() {
		this.inicializarColeccionDeMaterias
	}

	def inicializarColeccionDeMaterias() {
		coleccionMaterias = newArrayList
	}
	
	def clickEnCheckBoxAprobado(Materia materiaSeleccionada){
		this.observerDelCheckBoxAprobado.apretaronElCheckBox(this,materiaSeleccionada)
	}
	
	def settearonElAnioDeCursadaDe(Materia materiaSeleccionada, int anioDeCursada){
		this.observerDelAnioDeCursada.settearonUnAnio(materiaSeleccionada,anioDeCursada)
	}
}
