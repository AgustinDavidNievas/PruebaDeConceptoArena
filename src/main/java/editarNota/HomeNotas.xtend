package editarNota

import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import com.uqbar.commons.collections.Predicate

@Observable
class HomeNotas extends CollectionBasedHome<Nota> {
	
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