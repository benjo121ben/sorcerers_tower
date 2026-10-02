extends Resource
class_name TestResources

enum Arcana {
    ARTIFICE,
    INVOCATION,
    THAUMATURGY,
    APOTROPAISM,
    DIVINATION,
    ONEIRISM,
    METAMORPHOSIS,
    ENCHANTMENT,
    NULL
}

enum Reagent {
    SALT,
    TIN,
    LEAD,
    IRON,
    COPPER,
    MERCURY,
    SILVER,
    ALUMINIUM,
    SULFUR,
    GOLD
}

@export var tome_map: Dictionary[Arcana, int] = {
    Arcana.ARTIFICE: 0,
    Arcana.INVOCATION: 0,
    Arcana.THAUMATURGY: 0,
    Arcana.APOTROPAISM: 0,
    Arcana.DIVINATION: 0,
    Arcana.ONEIRISM: 0,
    Arcana.METAMORPHOSIS: 0,
    Arcana.ENCHANTMENT: 0
}

@export var reagent_map: Dictionary[Reagent, int] = {
    Reagent.SALT: 0,
    Reagent.TIN: 0,
    Reagent.LEAD: 0,
    Reagent.IRON: 0,
    Reagent.COPPER: 0,
    Reagent.MERCURY: 0,
    Reagent.SILVER: 0,
    Reagent.ALUMINIUM: 0,
    Reagent.SULFUR: 0,
    Reagent.GOLD: 0
}

func any_tome_exists() -> bool:
    return tome_map.values().any(func(val) : return val > 0)

func get_tomes_of_type(arcana: Arcana) -> int:
    return tome_map[arcana]

func take_tome_of_type(arcana: Arcana) -> bool:
    var val := tome_map[arcana]
    if (val <= 0):
        return false
    
    tome_map[arcana] -= 1
    return true

func add_tome_of_type(arcana: Arcana) -> void:
    tome_map[arcana] += 1

func get_reagent_of_type(reagent: Reagent) -> int:
    return reagent_map[reagent]

func take_reagent_of_type(reagent: Reagent) -> bool:
    var val := reagent_map[reagent]
    if (val <= 0):
        return false
    
    reagent_map[reagent] -= 1
    return true

func add_reagent_of_type(reagent: Reagent) -> void:
    reagent_map[reagent] += 1
