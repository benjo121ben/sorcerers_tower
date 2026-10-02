extends Label

@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
	wizard_tower.updated.connect(update)

func update():
	self.text = "Students: " + str(wizard_tower.students)
