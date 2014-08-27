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
class SeguidorDeCarrera implements Serializable {

	@Property List<Materia> materias = new ArrayList
	@Property List<String> ubicaciones
	@Property int anioDeCursada
	val static aniodeCursada_Property = "anioDeCursada"
	@Property Boolean finalAprobado
	@Property String nombre

	@Property Observer observerDelCheckBoxAprobado
	@Property Observer observerDelAnioDeCursada

	//Selecciones
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada

	static SeguidorDeCarrera seguidorDeCarreraUnico = new SeguidorDeCarrera

	def static seguidorDeCarreraUnico() {
		seguidorDeCarreraUnico
	}

	def void inicializarUbicaciones() {
		ubicaciones = newArrayList
		this.ubicaciones.add("2014 - 1°Cuatrimestre")
		this.ubicaciones.add("2014 - 2°Cuatrimestre")
		this.ubicaciones.add("2014 - Anual")
		this.ubicaciones.add("2013 - 1°Cuatrimestre")
		this.ubicaciones.add("2013 - 2°Cuatrimestre")
		this.ubicaciones.add("2013 - Anual")
		this.ubicaciones.add("2012 - 1°Cuatrimestre")
		this.ubicaciones.add("2012 - 2°Cuatrimestre")
		this.ubicaciones.add("2012 - Anual")

	}

	def agregarMateria(Materia materia) {
		this.materias.add(materia)
		val temp = newArrayList
		temp.addAll(materias)
		materias = new ArrayList<Materia>
		setMaterias(temp)
	}

	new() {
		this.inicializarColeccionDeMaterias
		this.inicializarUbicaciones

	}

	def void inicializarColeccionDeMaterias() {
		materias = newArrayList
	}

	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))

	}

	def clickEnCheckBoxAprobado(Materia materiaSeleccionada) {
		this.observerDelCheckBoxAprobado.apretaronElCheckBox(this, materiaSeleccionada)
	}

	def settearonElAnioDeCursadaDe(Materia materiaSeleccionada, int anioDeCursada) {
		this.observerDelAnioDeCursada.settearonUnAnio(materiaSeleccionada, anioDeCursada)
	}

	def borrarNota() {
		getHomeMaterias().delete(materiaSeleccionada)
		this.actualizar
		materiaSeleccionada = null
	}

	def actualizar() {
		materias = newArrayList

		this.materias = homeMaterias.allInstances.toList
//		coleccionMaterias = homeMaterias.dameTodasLasMaterias(nombre)
		this.seleccionarMateriaNumeroUno

	}

	def seleccionarMateriaNumeroUno() {
		if (materias.size > 0)
			materiaSeleccionada = materias.get(0)
	}

}