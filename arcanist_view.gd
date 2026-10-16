extends Control
@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")

func _ready() -> void:
	wizard_tower.updated.connect(update)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update() -> void:
	for child in get_children():
		child.queue_free()

	for i in range(wizard_tower.artifice_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Artifice)"
		add_child(label)
		
	for i in range(wizard_tower.oneirism_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Oneirism)"
		add_child(label)
		
	for i in range(wizard_tower.divination_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Divination)"
		add_child(label)
		
	for i in range(wizard_tower.invocation_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Invocation)"
		add_child(label)
		
	for i in range(wizard_tower.apotropaism_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Apotropaism)"
		add_child(label)
		
	for i in range(wizard_tower.enchantment_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Enchantment)"
		add_child(label)
		
	for i in range(wizard_tower.thaumaturgy_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Thaumaturgy)"
		add_child(label)
		
	for i in range(wizard_tower.metamorphosis_arcanist):
		var label = Label.new()
		label.text = "Arcanist (Metamorphosis)"
		add_child(label)

	
