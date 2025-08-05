/// @description Init

event_inherited()

bonusStr = 0
bonusDex = 0
bonusInt = 0

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
