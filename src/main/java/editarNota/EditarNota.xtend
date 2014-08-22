package editarNota

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button

class EditarNota extends MainWindow<Nota> {
	
	new(Nota model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		this.setTitle("Editar Nota")
		new Label(mainPanel).text = "Fecha:"
		new TextBox(mainPanel).bindValueToProperty("fecha")
		new Label(mainPanel).text = "Descripcion"
		new TextBox(mainPanel).bindValueToProperty("descripcion")
		new CheckBox(mainPanel).bindValueToProperty("aprobado") //esto no se si es hacie, se tiene que linkear con el bool
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | this.modelObject.agregarNota("nota") ]//aca se tiene que mandar un objeto nota...
		]
	}
	
}