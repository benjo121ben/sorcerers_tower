extends Label


@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
	assert(wizard_tower != null, "Popup menu wizard tower is null: " + self.name)
	wizard_tower.leftover_knowledge.connect(func (knowledge): self.text = "Leftover Knowledge: " + str(knowledge))
    