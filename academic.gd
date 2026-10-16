extends Resource
class_name Academic


enum AcademicType {
    PROFESSOR,
    LIBRARIAN,
    ALCHEMIST
}

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

enum ReagentRecipe {
    SALT,
    TIN_LEAD,
    IRON,
    COPPER,
    MERCURY,
    SILVER,
    ALUMINIUM,
    SULFUR,
    GOLD,
    NULL
} 

@export var acad_type: AcademicType = AcademicType.PROFESSOR
@export var arcana: Arcana = Arcana.NULL
@export var reagent: ReagentRecipe = ReagentRecipe.NULL


func get_as_dict() -> Dictionary:
    return {
        "type": acad_type,
        "arcana": arcana,
        "reagent": reagent
    }

static func from_dict(dict: Dictionary) -> Academic:
    var ret := Academic.new()
    ret.acad_type = dict["type"]
    ret.arcana = dict["arcana"]
    ret.reagent = dict["reagent"]
    return ret