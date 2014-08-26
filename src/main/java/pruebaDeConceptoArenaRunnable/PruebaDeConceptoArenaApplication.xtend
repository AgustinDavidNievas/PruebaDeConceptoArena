package pruebaDeConceptoArenaRunnable

import org.uqbar.arena.Application
import seguidorDeCarrera.SeguidorDeCarreraWindow
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import editarNota.HomeNotas
import editarNota.Nota
import seguidorDeCarrera.SeguidorDeCarrera
import nuevaMateria.Materia
import nuevaMateria.HomeMaterias

class PruebaDeConceptoArenaApplication extends Application {
	
//	override protected createMainWindow() {
//		return new SeguidorDeCarreraWindow(this)
//	}
//	
	
override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Nota), new HomeNotas)
		ApplicationContext::instance.configureSingleton(typeof(Materia), new HomeMaterias)
		
		return new SeguidorDeCarreraWindow(this)
	}
		
	static def void main(String[] args) { 
		new PruebaDeConceptoArenaApplication().start()
	}
	
}