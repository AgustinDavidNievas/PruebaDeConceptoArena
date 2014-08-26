package editarNota

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.arena.layout.ColumnLayout

class EditarNota extends Dialog<Nota> {

	Nota original

	new(WindowOwner owner, Nota nota) {

		super(owner, nota)
		original = nota.clone() as Nota
	}

	//	new(Nota model) {
	//		super(model)
	//	}
	//	
	//	new() {
	//		super(new Nota)
	//	}
	override protected createFormPanel(Panel mainPanel) {

		//override createContents(Panel mainPanel) {
		this.setTitle("Editar Nota")
		new Label(mainPanel).text = "Fecha:"

		//new TextBox(mainPanel).bindValueToProperty("fecha")
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("fecha")
		textoNombre.width = 200
		new Label(mainPanel).text = "Descripcion"

		//new TextBox(mainPanel).bindValueToProperty("descripcion")
		val textoNombre2 = new TextBox(mainPanel)
		textoNombre2.bindValueToProperty("descripcion")
		textoNombre2.width = 200
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)
		new Label(form).text = "Aprobado"
		var checkResumen = new CheckBox(form)
		checkResumen.bindEnabledToProperty("aprobado")
		checkResumen.bindValueToProperty("aprobado")
	}

	override protected void addActions(Panel actions) {
		new Button(actions).setCaption("Aceptar").onClick[|this.modelObject.agregarFecha("fecha")].onClick[|
			this.modelObject.agregarDesc("descripcion")]

		//		.onClick[|this.accept].setAsDefault.disableOnError
		new Button(actions) //
		.setCaption("Cancelar").onClick [ |
			original.copiarA(this.modelObject)
			this.cancel
		]

	}

	//		new Button(mainPanel) => [
	//			caption = "Aceptar"
	//			onClick [ | this.modelObject.agregarNota() ]
	//		]
	def getHomeNotas() {
		ApplicationContext.instance.getSingleton(typeof(Nota)) as HomeNotas
	}

//def static main(String[] args) {
//		new EditarNota().startApplication
//	}
}
