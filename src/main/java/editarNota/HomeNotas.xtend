package editarNota

import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import java.util.Date

@Observable
class HomeNotas extends CollectionBasedHome<Nota> {

	def void create(String pFecha, String pDescripcion, Boolean estasAprobado) {
		var nota = new Nota
		nota.fecha = pFecha
		nota.descripcion = pDescripcion
		nota.aprobado = estasAprobado
		this.create(nota)
	}

	override def getEntityType() {
		typeof(Nota)
	}

	override def createExample() {
		new Nota
	}

	override def /*Predicate<Nota>*/ getCriterio(Nota example) {
		null
	}

}
