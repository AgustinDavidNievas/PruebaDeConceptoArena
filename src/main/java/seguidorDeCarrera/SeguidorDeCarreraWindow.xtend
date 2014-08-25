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
import editarNota.Nota
import org.uqbar.arena.widgets.Selector

class SeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarrera> {

	new(WindowOwner parent) {
		super(parent, SeguidorDeCarrera.seguidorDeCarreraUnico)
	}

	override def createMainTemplate(Panel mainPanel) {
		this.setTitle("Seguidor De Carrera")
		this.setTaskDescription("Seguidor de Carrera")
		mainPanel.setLayout(new ColumnLayout(2))
		createFormPanel(mainPanel)

	}

	def addButtons(Panel mainPanel) {
		var buttonsPanel = new Panel(mainPanel)
		buttonsPanel.setLayout(new ColumnLayout(7))
		this.addActions(buttonsPanel)
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel)
		.setCaption("NuevaMateria")
		.onClick[|this.nuevaMateria]
		.setAsDefault

	}

	def createGrid(Panel mainPanel) {

		new Table<Materia>(mainPanel, typeof(Materia)) => [
			heigth = 350
			width = 150
			//			bindItemsToProperty("nombre")
			this.describeResultsGrid(it)
		]

	}

	def describeResultsGrid(Table<Materia> table) {
		new Column<Materia>(table).setTitle("Materias").setFixedSize(30).bindContentsToProperty("nombre")
	}

	override protected createFormPanel(Panel mainPanel) {

		addPanelMaterias(mainPanel)
		addMateriaSeleccionadaPanel(mainPanel)
		addDatosDeMateriaPanel(mainPanel)
		addButtons(mainPanel)
		addResultadosDeParcialesPanel(mainPanel)

	}
	
		def addMateriaSeleccionadaPanel (Panel mainPanel){	
		new Label(mainPanel).
		setWidth(90)
		.bindValueToProperty("materiaSeleccionada")
		
		}
	

	def addResultadosDeParcialesPanel(Panel mainPanel) {
		var resultadosDeParcialesPanel = new Panel(mainPanel)
		resultadosDeParcialesPanel
		.setLayout(new ColumnLayout(1))
		this
		.createGridResultadosParcial(resultadosDeParcialesPanel)

		addButtonsPrueba(resultadosDeParcialesPanel)

	}

	def addButtonsPrueba(Panel resultadosDeParcialesPanel) {

		var buttonsPanel = new Panel(resultadosDeParcialesPanel)
		buttonsPanel.setLayout(new ColumnLayout(7))
		this.addActions2(buttonsPanel)

	}

	def addActions2(Panel buttonsPanel) {
		new Button(buttonsPanel)//TODO: Falta que verifique que alguna nota este seleccionada
		.setCaption("Editar")
		.onClick[|this.editarNota]
		.setAsDefault

		new Button(buttonsPanel)
		.setCaption("+")
		.onClick[|this.editarNota]
		.setAsDefault

		new Button(buttonsPanel) //TODO: preguntar si esta seguro de querer borrar
		.setCaption("-")
		.onClick[|this.borrarNota]
		.setAsDefault

	}

	def createGridResultadosParcial(Panel mainPanel) {
		
		var notasDeParcialLabel= new Label(mainPanel).setText("Notas de Parcial")

		new Table<Nota>(mainPanel, typeof(Nota)) => [
			heigth = 50
			width = 300
			//			bindItemsToProperty("nombre")
			this.describeGridResultadosParcial(it)
		]
	}

	def describeGridResultadosParcial(Table<Nota> table) {
		new Column<Nota>(table)
		.setTitle("Fecha")
		.setFixedSize(60)
		.bindContentsToProperty("fecha")

		new Column<Nota>(table)
		.setTitle("Descripcion")
		.setFixedSize(60)
		.bindContentsToProperty("descripcion")

		new Column<Nota>(table)
		.setTitle("Aprobado")
		.setFixedSize(60)
		.bindContentsToProperty("aprobado")
		.bindContentsToTransformer([nota|if(nota.aprobado) "SI" else "NO"])

	}

	def addPanelMaterias(Panel mainPanel) {
		var panelDeMaterias = new Panel(mainPanel).setWidth(300)
		panelDeMaterias.setLayout(new ColumnLayout(2))
		this.createGrid(panelDeMaterias)

	}

	def addDatosDeMateriaPanel(Panel mainPanel) {
		

		var datosMateriasPanel = new Panel(mainPanel).setWidth(500)
		datosMateriasPanel.setLayout(new ColumnLayout(4))

		var labelAnio = new Label(datosMateriasPanel).setText("Año de Cursada")
		new TextBox(datosMateriasPanel) => [
			//			withFilter[event|StringUtils::isNumeric(event.potentialTextResult)]
			//			bindValueToProperty("columnaAPlantar")	
		]
		labelAnio.foreground = Color::RED
		
		
		var labelProfesor = new Label(datosMateriasPanel).setText("Profesor")
		new TextBox(datosMateriasPanel) => []
		labelProfesor.foreground = Color::magenta
		
		var labelFinalAprobado = new Label(datosMateriasPanel).setText("Final Aprobado")
		labelAnio.foreground = Color::BLUE
		var checkFinalAprobado = new CheckBox(datosMateriasPanel)

	//	checkFinalAprobado.bindEnabledToProperty("finalAprobado")
	//	checkFinalAprobado.bindValueToProperty("finalAprobado")
		
		
		var labelUbicacionDeMateria = new Label(datosMateriasPanel).setText("Ubicación materia")
		.foreground = Color::ORANGE
		new Selector(datosMateriasPanel).allowNull(false) => [
			width = 150
//TODO: que muestre las posibles opciones.
//**Ejemplo
//			bindItemsToProperty("zombies")
//			bindValueToProperty("zombieSeleccionado")	

		
		]

		
	}

	
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
