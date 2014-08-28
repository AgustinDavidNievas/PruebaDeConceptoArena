package pruebaDeConceptoArenaRunnable

import editarNota.HomeNotas
import editarNota.Nota
import nuevaMateria.HomeMaterias
import nuevaMateria.Materia
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import seguidorDeCarrera.SeguidorDeCarreraWindow

class PruebaDeConceptoArenaApplication extends Application {
	
static def void main(String[] args) { 
		new PruebaDeConceptoArenaApplication().start()
	}
	
override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Nota), new HomeNotas)
		ApplicationContext.instance.configureSingleton(typeof(Materia), new HomeMaterias)
		return new SeguidorDeCarreraWindow(this)
	}
		
	
	
}