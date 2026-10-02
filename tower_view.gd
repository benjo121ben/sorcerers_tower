extends Control
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")
@export var denizenViewTemplate : PackedScene = null 

func _ready() -> void:
	wizard_tower.updated.connect(update)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update() -> void:
	for child in get_children():
		child.queue_free()

	var new_child_list = []
	var index = 0
	for entry in wizard_tower.academic_list:
		var denizenView: DenizenView = denizenViewTemplate.instantiate()

		denizenView.plusButton.pressed.connect(func(): move_index_up(index))
		denizenView.minusButton.pressed.connect(func(): move_index_down(index))
		denizenView.delButton.pressed.connect(func(): delete_index(index))
		index+= 1
		var label = denizenView.label
		var text = ""
		match entry.acad_type:
			Academic.AcademicType.PROFESSOR:
				text = "Professor"
			Academic.AcademicType.LIBRARIAN:
				text = "Librarian " + Academic.Arcana.keys()[entry.arcana]
			Academic.AcademicType.ALCHEMIST:
				text = "Alchemist " + Academic.ReagentRecipe.keys()[entry.reagent]
				match entry.reagent:
					Academic.ReagentRecipe.SALT:
						text = "Alchemist " + "(2 Knowledge => Salt)"
					Academic.ReagentRecipe.TIN_LEAD:
						text = "Alchemist " + "(2 Salt => Tin + Lead)"
					Academic.ReagentRecipe.IRON:
						text = "Alchemist " + "(2 Tin => Iron)"
					Academic.ReagentRecipe.COPPER:
						text = "Alchemist " + "(2 Tin => Copper)"
					Academic.ReagentRecipe.MERCURY:
						text = "Alchemist " + "(Coper + Iron + Tin => Mercury)"
					Academic.ReagentRecipe.SILVER:
						text = "Alchemist " + "(Tome + Tin => Silver)"
					Academic.ReagentRecipe.ALUMINIUM:
						text = "Alchemist " + "(Tome + Silver + Copper => Alum)"
					Academic.ReagentRecipe.SULFUR:
						text = "Alchemist " + "(Student + Lead + Salt => Sulfur)"
					Academic.ReagentRecipe.GOLD:
						text = "Alchemist " + "(Every Reagen except Salt => Gold)"
					_: text = ""


		label.text = text
		new_child_list.push_back(denizenView)
	
	new_child_list.reverse()
	for entry in new_child_list:
		add_child(entry)

	
func move_index_up(index: int):
	if (index == len(wizard_tower.academic_list) - 1):
		return
	var prev = wizard_tower.academic_list[index + 1]
	wizard_tower.academic_list[index + 1] = wizard_tower.academic_list[index]
	wizard_tower.academic_list[index] = prev
	wizard_tower.updated.emit()


func move_index_down(index: int):
	if (index == 0):
		return

	var prev = wizard_tower.academic_list[index - 1]
	wizard_tower.academic_list[index -1] = wizard_tower.academic_list[index]
	wizard_tower.academic_list[index] = prev
	wizard_tower.updated.emit()

func delete_index(index: int):
	wizard_tower.academic_list.remove_at(index)
	wizard_tower.updated.emit()
