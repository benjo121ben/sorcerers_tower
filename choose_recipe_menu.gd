extends PopupMenu
class_name RecipeMenu

@onready var wizard_tower: WizardsTower = get_node("/root/WizardsTower")
@export var label: Label = null

func _ready() -> void:
	assert(wizard_tower != null, "Popup menu wizard tower is null: " + self.name)
	wizard_tower.choose_recipe.connect(show_menu)

func show_menu():
	self.visible = true
	label.text = "Choose your recipe"
	
func recipe_selected(recipe: Academic.ReagentRecipe):
	wizard_tower.recipe_chosen.emit(recipe)
	self.visible = false
