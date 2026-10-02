extends Button
class_name RecipeButton

@export var recipe_menu: RecipeMenu
@export var recipe: Academic.ReagentRecipe = Academic.ReagentRecipe.NULL

func _ready() -> void:
    assert(recipe_menu != null, "recipe_menu is empty: " + name) 
    button_down.connect(func (): recipe_menu.recipe_selected(recipe))
    