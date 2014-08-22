package nuevaMateria

import editarNota.Nota
import java.util.List

class Materia {
	
	@Property Boolean finalAprobado
	@Property String nombre
	@Property int añoDeCursada
	@Property List<Nota> notasDeCursada
	@Property String ubicacionDeLaMateria
	
	
}