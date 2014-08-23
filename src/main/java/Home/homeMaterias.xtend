package Home

import org.uqbar.commons.model.CollectionBasedHome
import nuevaMateria.Materia
import org.uqbar.commons.utils.ApplicationContext

class homeMaterias extends CollectionBasedHome<Materia> {
	
	new() {
		this.init
	}

	def void init() {
		this.create("Analisis I", 2010, "Raul Portal")
		this.create("Algebra y Geometria Analitica", 2010, "Susana Gimenez")
		this.create("Matematica Discreta", 2011, "Marcelo Tinelli")
		this.create("Diseño de Sistemas", 2012, "Jorge Rial")
		this.create("Fisica II", 2012, "Isaac Newton")
	}
	
	def void create(String mNombre, Integer mAnio, String mProfesor) {
		var materia	 = new Materia
		materia.nombre = mNombre
		materia.anioDeCursada = mAnio
		materia.profesor = mProfesor
		this.create(materia)
	}
	
	override protected getCriterio(Materia example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}