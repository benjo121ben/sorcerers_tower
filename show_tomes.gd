extends Control
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _enter_tree() -> void:
	for i in range(8):
		add_child(Label.new())

func _ready() -> void:
	wizard_tower.updated.connect(update)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update() -> void:
	(get_child(0) as Label).text = "Tome ARTIFICE " + str(wizard_tower.tower_resources.tome_artifice) if wizard_tower.tower_resources.tome_artifice > 0 else ""
	(get_child(1) as Label).text = "Tome INVOCATION " + str(wizard_tower.tower_resources.tome_invocation) if wizard_tower.tower_resources.tome_invocation > 0 else ""
	(get_child(2) as Label).text = "Tome THAUMATURGY " + str(wizard_tower.tower_resources.tome_thaumaturgy) if wizard_tower.tower_resources.tome_thaumaturgy > 0 else ""
	(get_child(3) as Label).text = "Tome APOTROPAISM " + str(wizard_tower.tower_resources.tome_apotropaism) if wizard_tower.tower_resources.tome_apotropaism > 0 else ""
	(get_child(4) as Label).text = "Tome DIVINATION " + str(wizard_tower.tower_resources.tome_divination) if wizard_tower.tower_resources.tome_divination > 0 else ""
	(get_child(5) as Label).text = "Tome ONEIRISM " + str(wizard_tower.tower_resources.tome_oneirism) if wizard_tower.tower_resources.tome_oneirism > 0 else ""
	(get_child(6) as Label).text = "Tome METAMORPHOSIS " + str(wizard_tower.tower_resources.tome_metamorphosis) if wizard_tower.tower_resources.tome_metamorphosis > 0 else ""
	(get_child(7) as Label).text = "Tome ENCHANTMENT " + str(wizard_tower.tower_resources.tome_enchantment) if wizard_tower.tower_resources.tome_enchantment > 0 else ""

	
