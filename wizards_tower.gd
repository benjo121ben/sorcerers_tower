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
	updated.emit()

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
