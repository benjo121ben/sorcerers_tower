extends Node
class_name WizardsTower


@export var students := 0
@export var academic_list: Array[Academic] = []
@export var tower_resources: TowerResources = null


var artifice_arcanist := 0
var invocation_arcanist := 0
var thaumaturgy_arcanist := 0
var apotropaism_arcanist := 0
var divination_arcanist := 0
var oneirism_arcanist := 0
var metamorphosis_arcanist := 0
var enchantment_arcanist := 0

signal choose_tome_to_spend(tower_resources:TowerResources)
signal arcana_chosen(arcana: Academic.Arcana)
signal recipe_chosen(arcana: Academic.ReagentRecipe)
signal choose_arcana
signal choose_arcanist
signal choose_recipe
signal updated
signal leftover_knowledge(knowledge: int)

func _ready() -> void:
	load_game()
	updated.connect(save_game)

func create_professor():
	var acad = Academic.new()
	acad.acad_type = Academic.AcademicType.PROFESSOR
	academic_list.push_back(acad)
	updated.emit()

func create_alchemist():
	var acad = Academic.new()
	acad.acad_type = Academic.AcademicType.ALCHEMIST
	choose_recipe.emit()
	var recipe = await recipe_chosen
	acad.reagent = recipe
	academic_list.push_back(acad)
	updated.emit()

func create_librarian():
	var acad = Academic.new()
	acad.acad_type = Academic.AcademicType.LIBRARIAN
	choose_arcana.emit()
	var arcana = await arcana_chosen
	acad.arcana = arcana
	academic_list.push_back(acad)
	updated.emit()

func run_visions_phase(knowledge: int) -> void:

	# students
	knowledge = knowledge + min(knowledge, students)

	# run through all of the academics
	for academic in academic_list:
		match academic.acad_type:
			Academic.AcademicType.PROFESSOR:
				knowledge = handle_professor(knowledge)
			Academic.AcademicType.LIBRARIAN:
				knowledge = handle_librarian(academic.arcana, knowledge)
			Academic.AcademicType.ALCHEMIST:
				knowledge = await handle_alchemist(academic.reagent, knowledge)

	# create new reliable arcanists
	for i in range(knowledge / 5):
		choose_arcanist.emit()
		var response = await arcana_chosen

		match response:
			Academic.Arcana.ARTIFICE:
				artifice_arcanist += 1
			Academic.Arcana.INVOCATION:
				invocation_arcanist += 1
			Academic.Arcana.THAUMATURGY:
				thaumaturgy_arcanist += 1
			Academic.Arcana.APOTROPAISM:
				apotropaism_arcanist += 1
			Academic.Arcana.DIVINATION:
				divination_arcanist += 1
			Academic.Arcana.ONEIRISM:
				oneirism_arcanist += 1
			Academic.Arcana.METAMORPHOSIS:
				metamorphosis_arcanist += 1
			Academic.Arcana.ENCHANTMENT:
				enchantment_arcanist += 1
			_: assert(false, "an invalid tome was chosen to create an arcanist: " + str(response))

	leftover_knowledge.emit(knowledge - knowledge / 5)
	updated.emit()

	

func run_quiet_phase() -> void:
	print("NOTHING HAPPENS YET")
	updated.emit()



func handle_professor(knowledge: int) -> int:
	if knowledge < 2:
		return knowledge

	students += 1
	return knowledge - 2


func handle_librarian(arcana: Academic.Arcana, knowledge: int) -> int:
	if knowledge < 5:
		return knowledge

	match arcana:
		Academic.Arcana.ARTIFICE:
			tower_resources.tome_artifice += 1
		Academic.Arcana.INVOCATION:
			tower_resources.tome_invocation += 1
		Academic.Arcana.THAUMATURGY:
			tower_resources.tome_thaumaturgy += 1
		Academic.Arcana.APOTROPAISM:
			tower_resources.tome_apotropaism += 1
		Academic.Arcana.DIVINATION:
			tower_resources.tome_divination += 1
		Academic.Arcana.ONEIRISM:
			tower_resources.tome_oneirism += 1
		Academic.Arcana.METAMORPHOSIS:
			tower_resources.tome_metamorphosis += 1
		Academic.Arcana.ENCHANTMENT:
			tower_resources.tome_enchantment += 1
		_: assert(false, "an invalid Arcana was chosen for a librarian: " + str(arcana))

	return knowledge - 5
	
	
func handle_alchemist(reagent_recipe: Academic.ReagentRecipe, knowledge: int) -> int:
	match (reagent_recipe):
		Academic.ReagentRecipe.SALT:
			if (knowledge < 2):
				return knowledge
			tower_resources.reagent_salt += 1
			return knowledge - 2
		
		Academic.ReagentRecipe.TIN_LEAD:
			if (tower_resources.reagent_salt < 2):
				return knowledge
			tower_resources.reagent_salt -= 2
			tower_resources.reagent_tin += 1
			tower_resources.reagent_lead += 1

		Academic.ReagentRecipe.IRON:
			if (tower_resources.reagent_tin < 2):
				return knowledge
			tower_resources.reagent_tin -= 2
			tower_resources.reagent_iron += 1

		Academic.ReagentRecipe.COPPER:
			if (tower_resources.reagent_tin < 2):
				return knowledge
			tower_resources.reagent_tin -= 2
			tower_resources.reagent_copper += 1

		Academic.ReagentRecipe.MERCURY:
			if (tower_resources.reagent_tin < 1 or tower_resources.reagent_copper < 1 or tower_resources.reagent_iron < 1):
				return knowledge
			tower_resources.reagent_tin -= 1
			tower_resources.reagent_copper -= 1
			tower_resources.reagent_iron -= 1
			tower_resources.reagent_mercury += 1
		
		Academic.ReagentRecipe.SILVER:
			if (!tower_resources.any_tome_exists() or tower_resources.reagent_tin < 1):
				return knowledge
			choose_tome_to_spend.emit(tower_resources)
			var response = await arcana_chosen
			match response:
				Academic.Arcana.ARTIFICE:
					tower_resources.tome_artifice -= 1
				Academic.Arcana.INVOCATION:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.THAUMATURGY:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.APOTROPAISM:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.DIVINATION:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.ONEIRISM:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.METAMORPHOSIS:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.ENCHANTMENT:
					tower_resources.tome_invocation -= 1
				_: assert(false, "an invalid tome was chosen to craft silver: " + str(response))

			tower_resources.reagent_tin -= 1
			tower_resources.reagent_silver += 1
		
		Academic.ReagentRecipe.ALUMINIUM:
			if (!tower_resources.any_tome_exists() or tower_resources.reagent_copper < 1 or tower_resources.reagent_silver < 1):
				return knowledge
			choose_tome_to_spend.emit(tower_resources)
			var response = await arcana_chosen
			match response:
				Academic.Arcana.ARTIFICE:
					tower_resources.tome_artifice -= 1
				Academic.Arcana.INVOCATION:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.THAUMATURGY:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.APOTROPAISM:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.DIVINATION:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.ONEIRISM:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.METAMORPHOSIS:
					tower_resources.tome_invocation -= 1
				Academic.Arcana.ENCHANTMENT:
					tower_resources.tome_invocation -= 1
				_: assert(false, "an invalid tome was chosen to craft aluminium: " + str(response))

			tower_resources.reagent_copper -= 1
			tower_resources.reagent_silver -= 1
			tower_resources.reagent_aluminium += 1

		Academic.ReagentRecipe.SULFUR:
			if (students < 1  or tower_resources.reagent_lead < 1 or tower_resources.reagent_salt < 1):
				return knowledge
			students -= 1
			tower_resources.reagent_lead -= 1
			tower_resources.reagent_salt -= 1
			tower_resources.reagent_sulfur += 1
		
		Academic.ReagentRecipe.GOLD:
			if (tower_resources.reagent_sulfur < 1 or tower_resources.reagent_aluminium < 1 or tower_resources.reagent_lead < 1 or tower_resources.reagent_silver < 1 or tower_resources.reagent_mercury < 1 or tower_resources.reagent_copper < 1 or tower_resources.reagent_iron < 1 or tower_resources.reagent_tin < 1):
				return knowledge
			tower_resources.reagent_sulfur -= 1
			tower_resources.reagent_aluminium -= 1
			tower_resources.reagent_lead -= 1
			tower_resources.reagent_silver -= 1
			tower_resources.reagent_mercury -= 1
			tower_resources.reagent_copper -= 1
			tower_resources.reagent_iron -= 1
			tower_resources.reagent_tin -= 1
			tower_resources.reagent_gold += 1
		
		_: assert(false, "an invalid Reagent was chosen for an alchemist: " + str(reagent_recipe))


	return knowledge

func get_as_dict() -> Dictionary:
	var export_academics = []
	for academic in academic_list:
		export_academics.push_back(academic.get_as_dict())
	return {
		"students": students,
		"academics": export_academics,
		"arcanist": {
			"artifice": artifice_arcanist,
			"invocation": invocation_arcanist,
			"thaumaturgy": thaumaturgy_arcanist,
			"apotropaism": apotropaism_arcanist,
			"divination": divination_arcanist,
			"oneirism": oneirism_arcanist,
			"metamorphosis": metamorphosis_arcanist,
			"enchantment": enchantment_arcanist,
		},
	}


func save_game():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)

	var tower_dict := self.get_as_dict()
	var resources_dict := tower_resources.get_as_dict()

	# JSON provides a static method to serialized JSON string.
	var json_string = JSON.stringify({"tower": tower_dict, "resources": resources_dict})

	# Store the save dictionary as a new line in the save file.
	save_file.store_line(json_string)


func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	var json = JSON.new()
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var json_result = json.parse(FileAccess.get_file_as_string("user://savegame.save"))

	if json_result == OK:
		var json_data: Dictionary = json.data
		var tower_dict: Dictionary = json_data["tower"]
		var resources_dict: Dictionary = json_data["resources"]

		students = tower_dict["students"]
		var arcanists_dict :Dictionary = tower_dict["arcanist"]
		var academics_list : Array = tower_dict["academics"]

		artifice_arcanist = arcanists_dict["artifice"]
		invocation_arcanist = arcanists_dict["invocation"]
		thaumaturgy_arcanist = arcanists_dict["thaumaturgy"]
		apotropaism_arcanist = arcanists_dict["apotropaism"]
		divination_arcanist = arcanists_dict["divination"]
		oneirism_arcanist = arcanists_dict["oneirism"]
		metamorphosis_arcanist = arcanists_dict["metamorphosis"]
		enchantment_arcanist = arcanists_dict["enchantment"]

		self.academic_list.clear()
		for academic in academics_list:
			self.academic_list.push_back(Academic.from_dict(academic))

		self.tower_resources = TowerResources.from_dict(resources_dict)

		print("done loading")
		updated.emit()

	else: 
		print("couldn't load game")




	
