extends HBoxContainer
class_name EditItem

@export var label: Label
@export var plusButton: Button
@export var minusButton: Button


func _enter_tree() -> void:
    self.alignment = BoxContainer.ALIGNMENT_CENTER
    label = Label.new()
    add_child(label)

    plusButton = Button.new()
    plusButton.text = "  +  "
    add_child(plusButton)

    minusButton = Button.new()
    minusButton.text = "  -  "
    add_child(minusButton)
