package pruebaDeConceptoArenaRunnable

import org.uqbar.arena.Application
import seguidorDeCarrera.SeguidorDeCarreraWindow
import seguidorDeCarrera.SeguidorDeCarrera

class PruebaDeConceptoArenaApplication extends Application {
	
	override protected createMainWindow() {
		return new SeguidorDeCarreraWindow(this, new SeguidorDeCarrera)
	}
	
	static def void main(String[] args) { 
		new PruebaDeConceptoArenaApplication().start()
	}
	
}