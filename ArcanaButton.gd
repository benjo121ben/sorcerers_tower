extends Button
class_name ArcanaButton

@export var arcana_menu: ArcanaMenu = null
@export var arcana: Academic.Arcana = Academic.Arcana.NULL

func _ready() -> void:
    assert(arcana_menu != null, "arcana_menu is empty: " + name) 
    arcana_menu.arcana_visible.connect(check_visibility_signal)
    arcana_menu.hide_all_options.connect(func(): visible = false)
    arcana_menu.show_all_options.connect(func(): visible = true)
    button_down.connect(func (): arcana_menu.arcana_selected(arcana))
    
func check_visibility_signal(signal_arcana: Academic.Arcana): 
    if (self.arcana == signal_arcana): 
        self.visible = true