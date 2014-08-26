package seguidorDeCarrera

import java.util.List
import nuevaMateria.Materia
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import editarNota.Nota
import org.uqbar.commons.utils.ApplicationContext
import nuevaMateria.HomeMaterias
import java.io.Serializable

@Observable
class SeguidorDeCarrera implements Serializable{

	@Property List<Materia> coleccionMaterias = new ArrayList
	@Property String ubicacionDeLaMateria
	@Property int anioDeCursada
	@Property Boolean finalAprobado
	@Property String nombre
	
	@Property Observer observerDelCheckBoxAprobado
	@Property Observer observerDelAnioDeCursada

	//Selecciones
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	
	static SeguidorDeCarrera seguidorDeCarreraUnico = new SeguidorDeCarrera
	
	def static seguidorDeCarreraUnico(){
		seguidorDeCarreraUnico
	}
	
	def agregarMateria(Materia materia) {

		this.coleccionMaterias.add(materia)
	}

	new() {
		this.inicializarColeccionDeMaterias
	}

	def void inicializarColeccionDeMaterias() {
		coleccionMaterias = newArrayList
	}
	
	
	def HomeMaterias getHomeMaterias(){
		ApplicationContext.instance.getSingleton(typeof(Materia))
		
	}
	
	def clickEnCheckBoxAprobado(Materia materiaSeleccionada){
		this.observerDelCheckBoxAprobado.apretaronElCheckBox(this,materiaSeleccionada)
	}
	
	def settearonElAnioDeCursadaDe(Materia materiaSeleccionada, int anioDeCursada){
		this.observerDelAnioDeCursada.settearonUnAnio(materiaSeleccionada,anioDeCursada)
	}
	
	def borrarNota() {
		getHomeMaterias().delete(materiaSeleccionada)
		this.actualizar
		materiaSeleccionada = null
	}
	
	def actualizar() {
		coleccionMaterias = newArrayList
		//this.coleccionMaterias= homeMaterias.allInstances.toList
		coleccionMaterias = getHomeMaterias().dameTodasLasMaterias(nombre)
	}
	
}
