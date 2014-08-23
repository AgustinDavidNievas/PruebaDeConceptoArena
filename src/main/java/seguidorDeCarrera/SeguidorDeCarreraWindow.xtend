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

	new(WindowOwner parent) {
		super(parent, new SeguidorDeCarrera)
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor De Carrera"

		super.createMainTemplate(mainPanel)

		this.createGrid(mainPanel)

	//		this.createGridActions(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		var searchFormPanel = new Panel(mainPanel)
		searchFormPanel.setLayout(new ColumnLayout(2))
	}

	def protected createGrid(Panel mainPanel) {
		var table = new Table<Materia>(mainPanel, typeof(Materia))
		table.heigth = 200
		table.width = 450
		table.bindItemsToProperty("nombre")
		this.describeResultsGrid(table)

	}

	def void describeResultsGrid(Table<Materia> table) {
		new Column<Materia>(table) //
		.setTitle("Materias").setFixedSize(150).bindContentsToProperty("nombre")

	//		
	//			.bindContentsToTransformer([celular | if (celular.recibeResumenCuenta) "SI" else "NO"])
	}
	
	override protected addActions(Panel actionsPanel) {
			new Button(actionsPanel)
			.setCaption("Nueva Materia")
//			.onClick [ | modelObject.crearMateria() ] Creo que aca tendriamos q poner q abra la otra ventana
			.setAsDefault

		
	}

}
