package nuevaMateria

import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate

@Observable
class HomeMaterias extends CollectionBasedHome<Materia> {

	new() {
		this.init
	}

	def void init() {
		this.create("Matematica")
		this.create("Lengua")

	}

	def void create(String pNombre) {
		var materia = new Materia(pNombre)
		//materia.nombre = pNombre

		this.create(materia)
	}
	
	def dameTodasLasMaterias(String nombre){
		allInstances.filter[materia| this.match(nombre, materia.nombre)].toList
		
	}

	def match(String valorEsperado, String valorReal){
		if (valorEsperado == null) {
			return true
			
		}	if (valorReal == null){
			return false
		}
		valorReal.toString().toLowerCase().contains(valorEsperado.toString().toLowerCase())
		
		
	}
	
	override def Predicate<Materia> getCriterio(Materia example) {
		null
	}

	override createExample() {
		new Materia
	}

	override def getEntityType() {
		typeof(Materia)
	}

}
