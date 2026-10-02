extends PopupMenu
class_name ArcanaMenu

@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")
@export var label: Label = null

signal arcana_visible(arcana: Academic.Arcana)
signal hide_all_options
signal show_all_options


func _ready() -> void:
	assert(wizard_tower != null, "Popup menu wizard tower is null: " + self.name)
	wizard_tower.choose_tome_to_spend.connect(show_tome_options)
	wizard_tower.choose_arcanist.connect(show_arcanist_options)
	wizard_tower.choose_arcana.connect(show_arcana_options)

func show_arcana_options():
	self.visible = true
	label.text = "Which Arcana is needed"
	show_all_options.emit()

func show_arcanist_options():
	self.visible = true
	label.text = "Which Arcana is needed"
	show_all_options.emit()

func show_tome_options(tower_resources: TowerResources):
	label.text = "Choose the tome you expend for crafting"
	self.visible = true
	if (tower_resources.tome_artifice):
		arcana_visible.emit(Academic.Arcana.ARTIFICE)

	if (tower_resources.tome_invocation > 0):
		arcana_visible.emit(Academic.Arcana.INVOCATION)

	if (tower_resources.tome_thaumaturgy > 0):
		arcana_visible.emit(Academic.Arcana.THAUMATURGY)

	if (tower_resources.tome_apotropaism > 0):
		arcana_visible.emit(Academic.Arcana.APOTROPAISM)

	if (tower_resources.tome_divination > 0):
		arcana_visible.emit(Academic.Arcana.DIVINATION)

	if (tower_resources.tome_oneirism > 0):
		arcana_visible.emit(Academic.Arcana.ONEIRISM)

	if (tower_resources.tome_metamorphosis > 0):
		arcana_visible.emit(Academic.Arcana.METAMORPHOSIS)

	if (tower_resources.tome_enchantment > 0):
		arcana_visible.emit(Academic.Arcana.ENCHANTMENT)
	
func arcana_selected(arcana: Academic.Arcana):
	hide_all_options.emit()
	wizard_tower.arcana_chosen.emit(arcana)
	self.visible = false
