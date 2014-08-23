package seguidorDeCarrera

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import nuevaMateria.Materia
import org.uqbar.arena.widgets.tables.Column

class SeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarrera> {
	
	
	new(WindowOwner parent, SeguidorDeCarrera model) {
		super(parent, model)
		title = "Seguidor De Carrera"
	}
	
	override protected createFormPanel(Panel mainPanel) {
	var searchFormPanel = new Panel(mainPanel)
	searchFormPanel.setLayout(new ColumnLayout(2))
	}
	
	def void describeResultsGrid(Table<Materia> table) {
		new Column<Materia>(table) //
			.setTitle("Materias")
			.setFixedSize(150)
			.bindContentsToProperty("nombre")

//		
//			.bindContentsToTransformer([celular | if (celular.recibeResumenCuenta) "SI" else "NO"])
	}
	
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}