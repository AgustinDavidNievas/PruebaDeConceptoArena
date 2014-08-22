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
		new TextBox(mainPanel).bindValueToProperty("nombre")
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ | this.modelObject.crearMateria("nombre") ]
		]
	}
	

//	def crearMateria(String string) {/*me obliga a crear este metodo para que no este bugueado, pero en el ejemplo que vimos
//	 * no esta asi :/
//	 */
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
//	
	def static main(String[] args) {
		new NuevaMateria().startApplication
	}
}