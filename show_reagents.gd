extends Control
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _enter_tree() -> void:
	for i in range(10):
		add_child(Label.new())

func _ready() -> void:
	wizard_tower.updated.connect(update)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update() -> void:
	(get_child(0) as Label).text = "Reagent SALT " + str(wizard_tower.tower_resources.reagent_salt) if wizard_tower.tower_resources.reagent_salt > 0 else ""
	(get_child(1) as Label).text = "Reagent TIN " + str(wizard_tower.tower_resources.reagent_tin) if wizard_tower.tower_resources.reagent_tin > 0 else ""
	(get_child(2) as Label).text = "Reagent LEAD " + str(wizard_tower.tower_resources.reagent_lead) if wizard_tower.tower_resources.reagent_lead > 0 else ""
	(get_child(3) as Label).text = "Reagent IRON " + str(wizard_tower.tower_resources.reagent_iron) if wizard_tower.tower_resources.reagent_iron > 0 else ""
	(get_child(4) as Label).text = "Reagent COPPER " + str(wizard_tower.tower_resources.reagent_copper) if wizard_tower.tower_resources.reagent_copper > 0 else ""
	(get_child(5) as Label).text = "Reagent MERCURY " + str(wizard_tower.tower_resources.reagent_mercury) if wizard_tower.tower_resources.reagent_mercury > 0 else ""
	(get_child(6) as Label).text = "Reagent SILVER " + str(wizard_tower.tower_resources.reagent_silver) if wizard_tower.tower_resources.reagent_silver > 0 else ""
	(get_child(7) as Label).text = "Reagent ALUMINIUM " + str(wizard_tower.tower_resources.reagent_aluminium) if wizard_tower.tower_resources.reagent_aluminium > 0 else ""
	(get_child(8) as Label).text = "Reagent SULFUR " + str(wizard_tower.tower_resources.reagent_sulfur) if wizard_tower.tower_resources.reagent_sulfur > 0 else ""
	(get_child(9) as Label).text = "Reagent GOLD " + str(wizard_tower.tower_resources.reagent_gold) if wizard_tower.tower_resources.reagent_gold > 0 else ""
