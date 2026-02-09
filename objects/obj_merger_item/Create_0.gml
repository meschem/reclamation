/// @description Init

event_inherited()

outline_init()
outlineColor = c_black

inValidRecipe = false		// modified if found to be in a craftable recipe

bonusStr = 0
bonusDex = 0
bonusInt = 0

cost = 200

mergeLevel = 1
mergeLevelMax = 3

addCharStatBlocks = function() {
	if (bonusStr > 0) {
		array_push(stats, new itemStat(enumItemStats.bonusStr, [bonusStr]))
	}
	
	if (bonusDex > 0) {
		array_push(stats, new itemStat(enumItemStats.bonusDex, [bonusDex]))
	}
	
	if (bonusInt > 0) {
		array_push(stats, new itemStat(enumItemStats.bonusInt, [bonusInt]))
	}
}

addSpecialStats = function() {
	
}
