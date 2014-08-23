package pruebaDeConceptoArenaRunnable

import org.uqbar.arena.Application
import seguidorDeCarrera.SeguidorDeCarreraWindow

class PruebaDeConceptoArenaApplication extends Application {
	
	override protected createMainWindow() {
		return new SeguidorDeCarreraWindow(this)
	}
	
	static def void main(String[] args) { 
		new PruebaDeConceptoArenaApplication().start()
	}
	
}