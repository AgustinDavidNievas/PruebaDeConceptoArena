package nuevaMateria

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import java.awt.Color

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
			onClick [|this.modelObject.crearMateria("nombre")]
		]
		
		/*esto es para entender que shit pasa que no funciona el boton */
		new Label(mainPanel).setBackground(Color::ORANGE).bindValueToProperty("nombre")

		new Label(mainPanel).setText("valor del atributo nombre")
		/**************************shit******************************* */
	}

	override createFormPanel(Panel mainPanel) {
		this.setTitle("Nueva Materia")

		new Label(mainPanel).text = "Nombre:"
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("nombre")
		textoNombre.width = 200

		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [|this.modelObject.crearMateria("nombre")]
		]
		
		
	}
	
}
//	override protected createFormPanel(Panel mainPanel) {
//		val form = new Panel(mainPanel)
//		form.layout = new ColumnLayout(2)
//		new Label(form).text = "Número"
//		val textNumero = new TextBox(form)
//		textNumero.bindValueToProperty("numero")
//
//		new Label(form).text = "Nombre"
//		val txtNombre = new TextBox(form)
//		txtNombre.width = 200
//		txtNombre.bindValueToProperty("nombre")
