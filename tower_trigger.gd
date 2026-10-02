extends Button

@export var input_text: LineEdit = null
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(input_text != null, name + ": input text is null")
	assert(wizard_tower != null, name + ": wizard tower is null")
	button_down.connect(pressed)

func pressed():
	var number = int(input_text.text)
	wizard_tower.run_visions_phase(number)
