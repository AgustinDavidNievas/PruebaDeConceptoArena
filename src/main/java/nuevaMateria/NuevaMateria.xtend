package nuevaMateria

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.ErrorsPanel

class NuevaMateria extends MainWindow<Materia> {

	new() {
		super(new Materia)
	}

	override createContents(Panel mainPanel) {
		this.setTitle("Nueva Materia")
		new Label(mainPanel).text = "Nombre:"
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("nombre")
		textoNombre.width = 200

		//esto es para el tamaño, pero parece que no funciona con un MainWindows
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [|this.modelObject.crearMateria("nombre")]
		]
	}

	def static main(String[] args) {
		new NuevaMateria().startApplication
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
