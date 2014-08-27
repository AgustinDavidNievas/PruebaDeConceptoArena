package nuevaMateria

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class NuevaMateria extends Dialog<Materia> {

	new(WindowOwner parent) {
		super(parent, new Materia)
	}

	override createContents(Panel mainPanel) {

		this.setTitle("Nueva Materia")

		new Label(mainPanel).text = "Nombre:"
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("nombre")
		textoNombre.width = 200


		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [|
				this.modelObject.crearMateria("nombre")
			]
		]
		
		
	}

	override createFormPanel(Panel mainPanel) {
		this.setTitle("Nueva Materia")

		new Label(mainPanel).text = "Nombre:"
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("nombre")
		textoNombre.width = 200
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [|  
				this.modelObject.crearMateria("nombre")
			]
		]
		
		
	}
	
}