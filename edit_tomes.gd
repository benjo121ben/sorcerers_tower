extends Control
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
	for i in range(8):
		add_child(EditItem.new())

	var item = get_child(0) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			print("called")
			wizard_tower.tower_resources.tome_artifice += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_artifice -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(1) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_invocation += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_invocation -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(2) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_thaumaturgy += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_thaumaturgy -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(3) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_apotropaism += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_apotropaism -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(4) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_divination += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_divination -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(5) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_oneirism += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_oneirism -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(6) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_metamorphosis += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_metamorphosis -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(7) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_enchantment += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.tower_resources.tome_enchantment -= 1
			wizard_tower.updated.emit()
	)

	wizard_tower.updated.connect(update)


func update() -> void:
	var item = get_child(0) as EditItem
	item.label.text = "Tome ARTIFICE " + str(wizard_tower.tower_resources.tome_artifice)
	
	item = get_child(1) as EditItem
	item.label.text = "Tome INVOCATION " + str(wizard_tower.tower_resources.tome_invocation)
	
	
	item = get_child(2) as EditItem
	item.label.text = "Tome THAUMATURGY " + str(wizard_tower.tower_resources.tome_thaumaturgy)
	
	item = get_child(3) as EditItem
	item.label.text = "Tome APOTROPAISM " + str(wizard_tower.tower_resources.tome_apotropaism) 
	
	
	item = get_child(4) as EditItem
	item.label.text = "Tome DIVINATION " + str(wizard_tower.tower_resources.tome_divination) 
	
	
	item = get_child(5) as EditItem
	item.label.text = "Tome ONEIRISM " + str(wizard_tower.tower_resources.tome_oneirism)
	
	
	item = get_child(6) as EditItem
	item.label.text = "Tome METAMORPHOSIS " + str(wizard_tower.tower_resources.tome_metamorphosis) 
	
	
	item = get_child(7) as EditItem
	item.label.text = "Tome ENCHANTMENT " + str(wizard_tower.tower_resources.tome_enchantment) 

	
