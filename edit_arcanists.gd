extends Control
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
	for i in range(8):
		add_child(EditItem.new())

	var item = get_child(0) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.artifice_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.artifice_arcanist -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(1) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.invocation_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.invocation_arcanist -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(2) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.thaumaturgy_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.thaumaturgy_arcanist -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(3) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.apotropaism_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.apotropaism_arcanist -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(4) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.divination_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.divination_arcanist -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(5) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.oneirism_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.oneirism_arcanist -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(6) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.metamorphosis_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.metamorphosis_arcanist -= 1
			wizard_tower.updated.emit()
	)
	
	item = get_child(7) as EditItem
	item.plusButton.pressed.connect(
		func (): 
			wizard_tower.enchantment_arcanist += 1
			wizard_tower.updated.emit()
	)
	item.minusButton.pressed.connect(
		func (): 
			wizard_tower.enchantment_arcanist -= 1
			wizard_tower.updated.emit()
	)

	wizard_tower.updated.connect(update)


func update() -> void:
	var item = get_child(0) as EditItem
	item.label.text = "Arcanists (artifice) " + str(wizard_tower.artifice_arcanist)
	
	item = get_child(1) as EditItem
	item.label.text = "Arcanists (invocation) " + str(wizard_tower.invocation_arcanist)
	
	
	item = get_child(2) as EditItem
	item.label.text = "Arcanists (thaumaturgy) " + str(wizard_tower.thaumaturgy_arcanist)
	
	item = get_child(3) as EditItem
	item.label.text = "Arcanists (apotropaism) " + str(wizard_tower.apotropaism_arcanist) 
	
	
	item = get_child(4) as EditItem
	item.label.text = "Arcanists (divination) " + str(wizard_tower.divination_arcanist) 
	
	
	item = get_child(5) as EditItem
	item.label.text = "Arcanists (oneirism) " + str(wizard_tower.oneirism_arcanist)
	
	
	item = get_child(6) as EditItem
	item.label.text = "Arcanists (metamorphosis) " + str(wizard_tower.metamorphosis_arcanist) 
	
	
	item = get_child(7) as EditItem
	item.label.text = "Arcanists (enchantment) " + str(wizard_tower.enchantment_arcanist) 

	
