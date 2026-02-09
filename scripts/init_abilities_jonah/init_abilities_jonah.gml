///@description			Must be run on player object

function init_abilities_jonah() {
	abilityTreeAuras = new abilityTree(
		"Auras",
		"Passive auras that effect an area around Jonah",
		heroes.jonah
	)
	
	abilityTreeCombatSkills = new abilityTree(
		"Combat Skills",
		"Skills used to decimate enemies",
		heroes.jonah
	)
	
	abilityTreeWeaponArts = new abilityTree(
		"Weapon Arts",
		"Modifies attacks",
		heroes.jonah
	)
	
	
}