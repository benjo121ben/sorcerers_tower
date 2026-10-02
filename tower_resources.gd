extends Resource
class_name TowerResources


@export var tome_artifice := 0
@export var tome_invocation := 0
@export var tome_thaumaturgy := 0
@export var tome_apotropaism := 0
@export var tome_divination := 0
@export var tome_oneirism := 0
@export var tome_metamorphosis := 0
@export var tome_enchantment := 0


@export var reagent_salt := 0
@export var reagent_tin := 0
@export var reagent_lead := 0
@export var reagent_iron := 0
@export var reagent_copper := 0
@export var reagent_mercury := 0
@export var reagent_silver := 0
@export var reagent_aluminium := 0
@export var reagent_sulfur := 0
@export var reagent_gold := 0

func any_tome_exists() -> bool:
    return tome_artifice > 0 or tome_invocation > 0 or tome_thaumaturgy > 0 or tome_apotropaism > 0 or tome_divination > 0 or tome_oneirism > 0 or tome_metamorphosis > 0 or tome_enchantment > 0

