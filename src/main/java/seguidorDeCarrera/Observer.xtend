package seguidorDeCarrera

import nuevaMateria.Materia

class Observer {
	
	def apretaronElCheckBox(SeguidorDeCarrera seguidorDeCarrera,Materia materiaSeleccionada){
		materiaSeleccionada.setFinalAprobado = true
	}
	
	def settearonUnAnio(Materia materiaSeleccionada,int anioDeCursada) {
		materiaSeleccionada.anioDeCursada = anioDeCursada
	}
	
}