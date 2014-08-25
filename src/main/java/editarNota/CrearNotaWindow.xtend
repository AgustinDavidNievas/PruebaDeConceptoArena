package editarNota

import org.uqbar.arena.windows.WindowOwner

class CrearNotaWindow extends EditarNota {
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}
	
		override executeTask() {
		homeNotas.create(modelObject)
		super.executeTask()
	}
}