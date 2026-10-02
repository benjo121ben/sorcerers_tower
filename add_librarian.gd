extends Button

@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
    pressed.connect(func(): wizard_tower.create_librarian())
    