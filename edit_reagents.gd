extends Control

@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
	for i in range(10):
		add_child(EditItem.new())
	setup()
	wizard_tower.updated.connect(update)


func setup() -> void:
	var item = get_child(0) as EditItem
	item.label.text = "SALT " + str(wizard_tower.tower_resources.reagent_salt)
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_salt += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_salt -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(1) as EditItem
	item.label.text = "TIN " + str(wizard_tower.tower_resources.reagent_tin)
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_tin += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_tin -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(2) as EditItem
	item.label.text = "LEAD " + str(wizard_tower.tower_resources.reagent_lead)
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_lead += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_lead -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(3) as EditItem
	item.label.text = "IRON " + str(wizard_tower.tower_resources.reagent_iron) 
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_iron += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_iron -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(4) as EditItem
	item.label.text = "COPPER " + str(wizard_tower.tower_resources.reagent_copper) 
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_copper += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_copper -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(5) as EditItem
	item.label.text = "MERCURY " + str(wizard_tower.tower_resources.reagent_mercury)
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_mercury += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_mercury -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(6) as EditItem
	item.label.text = "SILVER " + str(wizard_tower.tower_resources.reagent_silver) 
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_silver += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_silver -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(7) as EditItem
	item.label.text = "ALUMINIUM " + str(wizard_tower.tower_resources.reagent_aluminium) 
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_aluminium += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_aluminium -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(8) as EditItem
	item.label.text = "SULFUR " + str(wizard_tower.tower_resources.reagent_sulfur) 
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_sulfur += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_sulfur -= 1
			wizard_tower.updated.emit()
	)

	item = get_child(9) as EditItem
	item.label.text = "GOLD " + str(wizard_tower.tower_resources.reagent_gold)
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_gold += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.reagent_gold -= 1
			wizard_tower.updated.emit()
	)




func update() -> void:
	var item = get_child(0) as EditItem
	item.label.text = "SALT " + str(wizard_tower.tower_resources.reagent_salt)
	
	
	item = get_child(1) as EditItem
	item.label.text = "TIN " + str(wizard_tower.tower_resources.reagent_tin)
	
	
	item = get_child(2) as EditItem
	item.label.text = "LEAD " + str(wizard_tower.tower_resources.reagent_lead)
	
	
	item = get_child(3) as EditItem
	item.label.text = "IRON " + str(wizard_tower.tower_resources.reagent_iron) 
	
	
	item = get_child(4) as EditItem
	item.label.text = "COPPER " + str(wizard_tower.tower_resources.reagent_copper) 
	
	
	item = get_child(5) as EditItem
	item.label.text = "MERCURY " + str(wizard_tower.tower_resources.reagent_mercury)
	
	
	item = get_child(6) as EditItem
	item.label.text = "SILVER " + str(wizard_tower.tower_resources.reagent_silver) 
	
	item = get_child(7) as EditItem
	item.label.text = "ALUMINIUM " + str(wizard_tower.tower_resources.reagent_aluminium) 

	
	item = get_child(8) as EditItem
	item.label.text = "SULFUR " + str(wizard_tower.tower_resources.reagent_sulfur) 


	item = get_child(9) as EditItem
	item.label.text = "GOLD " + str(wizard_tower.tower_resources.reagent_gold)
	