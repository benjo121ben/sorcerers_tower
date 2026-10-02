extends Control

@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")
@export var label: Label
@export var plusButton: Button
@export var minusButton: Button

func _ready() -> void:
	assert(wizard_tower != null, "Popup menu wizard tower is null: " + self.name)
	assert(plusButton != null, "plusbutton is null: " + self.name)
	assert(minusButton != null, "minusbutton is null: " + self.name)
	wizard_tower.updated.connect(func(): label.text = "Students: " + str(wizard_tower.students))
	plusButton.pressed.connect(add_student)
	minusButton.pressed.connect(remove_student)


func add_student():
	wizard_tower.students += 1
	wizard_tower.updated.emit()


func remove_student():
	wizard_tower.students -= 1
	wizard_tower.updated.emit()
