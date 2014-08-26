package nuevaMateria

import org.uqbar.commons.model.CollectionBasedHome

class HomeMaterias extends CollectionBasedHome<Materia> {

	new() {
		this.init
	}

	def void init() {
		create("Matematica")
		create("Lengua")

	}

	def create(String pNombre) {
		var materia = new Materia
		materia.nombre = pNombre

		this.create(materia)
	}

	override protected getCriterio(Materia example) {
		null
	}

	override createExample() {
		new Materia
	}

	override getEntityType() {
		typeof(Materia)
	}

}
