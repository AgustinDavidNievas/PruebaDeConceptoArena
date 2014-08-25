package seguidorDeCarrera

import editarNota.EditarNota
import java.awt.Color
import nuevaMateria.Materia
import nuevaMateria.NuevaMateria
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import editarNota.CrearNotaWindow

import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.CheckBox


class SeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorDeCarrera)
	}

	override def createMainTemplate(Panel mainPanel) {

		mainPanel.setLayout(new ColumnLayout(2))
		createFormPanel(mainPanel)

	}

	
	def addButtons(Panel mainPanel) {
		var buttonsPanel = new Panel(mainPanel)
		buttonsPanel.setLayout(new ColumnLayout(7))
		this.addActions(buttonsPanel)
	}

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
		new Button(actionsPanel).setCaption("NuevaMateria").onClick[|this.nuevaMateria].setAsDefault

		new Button(actionsPanel)//TODO: Falta que verifique que alguna nota este seleccionada
		.setCaption("Editar").onClick[|this.editarNota].setAsDefault

		new Button(actionsPanel).setCaption("+").onClick[|this.editarNota].setAsDefault

		new Button(actionsPanel) //TODO: preguntar si esta seguro de querer borrar
		.setCaption("-").onClick[|this.borrarNota].setAsDefault

	}

	//Panel linkeado con seguidorDeCarrera que es el main panel
	def createGrid(Panel mainPanel) {

		new Table<Materia>(mainPanel, typeof(Materia)) => [
			heigth = 500
			width = 150
//			bindItemsToProperty("nombre")
			this.describeResultsGrid(it)
		]

	}

	def describeResultsGrid(Table<Materia> table) {
		new Column<Materia>(table)
		.setTitle("Materias")
		.setFixedSize(30)
		.bindContentsToProperty("nombre")
	}

	override protected createFormPanel(Panel mainPanel) {

		addPanelMaterias(mainPanel)
		addButtons(mainPanel)
		addDatosDeMateriaPanel(mainPanel)

	//		addActionsPanel(mainPanel)
	//	
	//		
	//	.bindContentsToTransformer([celular | if (celular.recibeResumenCuenta) "SI" else "NO"])
	}

	def addPanelMaterias(Panel mainPanel) {
		var panelDeMaterias = new Panel(mainPanel)
		.setWidth(300)
		panelDeMaterias.setLayout(new ColumnLayout(2))
		this.createGrid(panelDeMaterias)

	}

	def addDatosDeMateriaPanel(Panel mainPanel) {

		var datosMateriasPanel = new Panel(mainPanel)
		datosMateriasPanel.setLayout(new ColumnLayout(5))

		var labelAnio = new Label(datosMateriasPanel).setText("Año de Cursada")
		new TextBox(datosMateriasPanel) => [
			//			withFilter[event|StringUtils::isNumeric(event.potentialTextResult)]
			//			bindValueToProperty("columnaAPlantar")	
		]
		labelAnio.foreground = Color::RED

		var labelProfesor = new Label(datosMateriasPanel).setText("Profesor")
		new TextBox(datosMateriasPanel) => []
		labelProfesor.foreground = Color::magenta

		var checkFinalAprobado = new CheckBox(datosMateriasPanel)

	//	checkFinalAprobado.bindEnabledToProperty("finalAprobado")
	//	checkFinalAprobado.bindValueToProperty("finalAprobado")
	}

	//Esta es la lista de materias con la barrita linda y toda la cosa.
	//	def protected describeResultsGrid(Table<Materia> table) {
	//			
	//		new Column<Materia>(table) 
	//			.setTitle("Nombre")
	//			.setFixedSize(300)
	//			.bindContentsToProperty("nombre")
	//
	//
	//	}
	//
	////Esta intenta ser la parte de NotasDeCursada 
	//	def void describeResultsGrid(Table<Materia> table) {
	//		new Column<Materia>(table) 
	//		.setTitle("Materias").setFixedSize(150).bindContentsToProperty("nombre")
	//	}
	//	
	//****Acciones de los botones**//
	def void nuevaMateria() {
		this.openDialog(new NuevaMateria(this))
	}

	def void editarNota() {
		this.openDialog(new CrearNotaWindow(this))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	def void borrarNota() { //TODO: Que borre el que esté seleccionado
	}

}
