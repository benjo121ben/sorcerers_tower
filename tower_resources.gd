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

func get_as_dict() -> Dictionary:
    return {
        "tomes": {
            "artifice": tome_artifice,
            "invocation": tome_invocation,
            "thaumaturgy": tome_thaumaturgy,
            "apotropaism": tome_apotropaism,
            "divination": tome_divination,
            "oneirism": tome_oneirism,
            "metamorphosis": tome_metamorphosis,
            "enchantment": tome_enchantment,
        },
        "reagent": {
            "salt": reagent_salt,
            "tin": reagent_tin,
            "lead": reagent_lead,
            "iron": reagent_iron,
            "copper": reagent_copper,
            "mercury": reagent_mercury,
            "silver": reagent_silver,
            "aluminum": reagent_aluminium,
            "sulfur": reagent_sulfur,
            "gold": reagent_gold,
        }
    }

static func from_dict(dict: Dictionary) -> TowerResources:
    var ret := TowerResources.new() 

    ret.tome_artifice = dict["tomes"]["artifice"]
    ret.tome_invocation = dict["tomes"]["invocation"]
    ret.tome_thaumaturgy = dict["tomes"]["thaumaturgy"]
    ret.tome_apotropaism = dict["tomes"]["apotropaism"]
    ret.tome_divination = dict["tomes"]["divination"]
    ret.tome_oneirism = dict["tomes"]["oneirism"]
    ret.tome_metamorphosis = dict["tomes"]["metamorphosis"]
    ret.tome_enchantment = dict["tomes"]["enchantment"]

    ret.reagent_salt = dict["reagent"]["salt"]
    ret.reagent_tin = dict["reagent"]["tin"]
    ret.reagent_lead = dict["reagent"]["lead"]
    ret.reagent_iron = dict["reagent"]["iron"]
    ret.reagent_copper = dict["reagent"]["copper"]
    ret.reagent_mercury = dict["reagent"]["mercury"]
    ret.reagent_silver = dict["reagent"]["silver"]
    ret.reagent_aluminium = dict["reagent"]["aluminum"]
    ret.reagent_sulfur = dict["reagent"]["sulfur"]
    ret.reagent_gold = dict["reagent"]["gold"]

    return ret