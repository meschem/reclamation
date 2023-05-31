/*
	Runes are used to modify abilties in unique ways vs just stat boosting.
	
	obj_ability objects reference runes for usage, not the other way around.
	Some runes may apply to multiple abilities and function in different ways.
	
	Not sure if I need invididual objects for this. For now, just a parent/w info
*/

enum enumRunes {
	magdela,
	voldan,
	dreygoth
}

name = "Rune of ____"

runeList = [
	{
		name: "Rune of Magdela",
		sprite: spr_rune_blue
	},
	{
		name: "Rune of Voldan",
		sprite: spr_rune_red
	},
	{
		name: "Rune of Dreygoth",
		sprite: spr_rune_green
	}
]
