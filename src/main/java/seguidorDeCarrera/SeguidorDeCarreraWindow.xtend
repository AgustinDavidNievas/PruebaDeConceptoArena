package seguidorDeCarrera

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import nuevaMateria.Materia
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.CheckBox
import nuevaMateria.NuevaMateria
import org.uqbar.arena.windows.Dialog
import editarNota.EditarNota
import org.uqbar.arena.widgets.TextBox

class SeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorDeCarrera)
	}

	override def createMainTemplate(Panel mainPanel) {
//		title = "Seguidor De Carrera"

		super.createMainTemplate(mainPanel)

		this.createGrid(mainPanel)
		
		}
//		
//		new(WindowOwner parent) {
//		super(parent, new PlantsVsZombiesModel)
//		setTitle("Plantas vs Zombies")
//		taskDescription = "Seleccione el zombie y la fila a atacar."
//	}
//
//	override def createMainTemplate(Panel mainPanel) {
//		mainPanel.setLayout(new VerticalLayout)
//		createFormPanel(mainPanel)
//	}
//
//	override protected createFormPanel(Panel mainPanel) {
//		addButtons(mainPanel)
//		addPanelPlantasyZombies(mainPanel)
//		addPlantinesPanel(mainPanel)
//		addActionsPanel(mainPanel)
//	}
//		
//		def addPanelPlantasyZombies(Panel mainPanel) {
//		//Planel de plantas
//		var panelDePlantas = new Panel(mainPanel).setWidth(300)
//		panelDePlantas.setLayout(new ColumnLayout(2))
//		this.createResultsGrid(panelDePlantas)
//
//		//Panel ZOMBIE
//		var panelDeZombie = new Panel(panelDePlantas)
//		panelDeZombie.setLayout(new ColumnLayout(2))
//		new Label(panelDeZombie).setText("Zombies")
//		new Label(panelDeZombie).setText("Elige el zombie y la fila")
//
//		new Label(panelDeZombie).setText("Zombie:")
//		new Selector(panelDeZombie).allowNull(false) => [
//			width = 150
//			bindItemsToProperty("zombies")
//			bindValueToProperty("zombieSeleccionado")			
//		]
//
//		new Button(panelDeZombie).setAsDefault.setCaption("Atacar") => [
//			onClick[|atacar]
//			bindEnabled(new NotNullObservable("zombieSeleccionado"))
//			disableOnError			
//		]
//	}
//		
		override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel)
			.setCaption("NuevaMateria")
			.onClick [ | this.nuevaMateria ] 
			.setAsDefault
		
		new Button(actionsPanel)//TODO: Falta que verifique que alguna nota este seleccionada
			.setCaption("Editar")
			.onClick [ | this.editarNota ] 
			.setAsDefault
		
		new Button(actionsPanel)
			.setCaption("+")
			.onClick [ | this.editarNota]
			.setAsDefault
			
		new Button(actionsPanel) //TODO: preguntar si esta seguro de querer borrar
			.setCaption("-")
			.onClick [ | this.borrarNota]	
			.setAsDefault	
		
		
		
			}
			
		
		
		
			//Panel linkeado con seguidorDeCarrera que es el main panel
	
	def createGrid(Panel mainPanel) {
		var table = new Table<Materia>(mainPanel, typeof(Materia))
		table.heigth = 200
		table.width = 450
		this.describeResultsGrid(table)
		
		
		}

	override protected createFormPanel(Panel mainPanel) {
		var materiasFormPanel = new Panel(mainPanel)
		materiasFormPanel.setLayout(new ColumnLayout(2))
		
		var labelNumero = new Label(materiasFormPanel)
		labelNumero.text = "Año De Cursada"
		labelNumero.foreground = Color::RED
		
		val textoNombreDeMateria = new TextBox(mainPanel)
//		textoNombreDeMateria.bindValueToProperty("anioDeCursada")
		textoNombreDeMateria.width = 300
	
		var labelNombre = new Label(materiasFormPanel)
		labelNombre.text = "Profesor De Cursada"
		labelNombre.foreground = Color::RED
//	
//	var checkFinalAprobado = new CheckBox(searchFormPanel)
//	checkFinalAprobado.bindEnabledToProperty("finalAprobado")
//	checkFinalAprobado.bindValueToProperty("finalAprobado")

//		
//	.bindContentsToTransformer([celular | if (celular.recibeResumenCuenta) "SI" else "NO"])
	
	}

//Esta es la lista de materias con la barrita linda y toda la cosa.

	def protected describeResultsGrid(Table<Materia> table) {
			
		new Column<Materia>(table) 
			.setTitle("Nombre")
			.setFixedSize(300)
			.bindContentsToProperty("nombre")


	}
//
////Esta intenta ser la parte de NotasDeCursada 
//	def void describeResultsGrid(Table<Materia> table) {
//		new Column<Materia>(table) 
//		.setTitle("Materias").setFixedSize(150).bindContentsToProperty("nombre")
//	}
//	


def void nuevaMateria() {
		this.openDialog(new NuevaMateria(this))
	}
	
	def void editarNota() {
		this.openDialog(new EditarNota(this))
		}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}
	
	def void borrarNota() { //TODO: Que borre el que esté seleccionado
		
		
	}

}
