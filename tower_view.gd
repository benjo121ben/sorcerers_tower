extends Control
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
	wizard_tower.updated.connect(update)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update() -> void:
	for child in get_children():
		child.queue_free()

	var new_child_list = []
	for entry in wizard_tower.academic_list:
		var label = Label.new()
		var center_cont = CenterContainer.new()
		center_cont.add_child(label)
		var text = ""
		match entry.acad_type:
			Academic.AcademicType.PROFESSOR:
				text += "Professor"
			Academic.AcademicType.LIBRARIAN:
				text += "Librarian " + Academic.Arcana.keys()[entry.arcana]
			Academic.AcademicType.ALCHEMIST:
				text += "Alchemist " + Academic.ReagentRecipe.keys()[entry.reagent]

		label.text = text
		new_child_list.push_back(center_cont)
	
	new_child_list.reverse()
	for entry in new_child_list:
		add_child(entry)

	
