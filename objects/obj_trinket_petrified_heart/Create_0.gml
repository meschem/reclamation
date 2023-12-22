
event_inherited()

name = "Petrified Heart"
description = "Increases Health for the player"

bonusHealth = [10, 20, 30, 50]

onLevelUp = function() {
	var addHp = bonusHealth[level - 1]
	owner.hp += addHp
}

//setupStatTextLists = function() {
//	var statVars = get_bonus_stat_vars()
//	var statName, statValue
//	var levelIndex, statIndex, curVar
	
//	//show_message(statVars)
	
//	for (levelIndex = 0; levelIndex < maxLevel; levelIndex++) {
//		statTextList[levelIndex] = []
		
//		for (statIndex = 0; statIndex < array_length(statVars); statIndex++) {
//			statValue = variable_instance_get(id, statVars[statIndex])
//			statName = get_bonus_stat_name(statVars[statIndex])
			
//			if (array_length(statValue) > 0) {
//				if (levelIndex == 0) {
//					array_push(
//						statTextList[levelIndex], 
//						new itemStatText(
//							statValue[levelIndex],
//							statName
//						)
//					)
//				} else {
//					array_push(
//						statTextList[levelIndex],
//						new itemStatText(
//							statValue[levelIndex],
//							statName,
//							get_bonus_stat_unit(statName),
//							statValue[levelIndex - 1]
//						)
//					)
//				}
//			}
//		}
//	}
//}

setupStatTextLists()


//for (var i = 0; i < array_length(bonusHealth); i++) {
//	if (i == 0) {
//		array_push(statTextList, [
//			new itemStatText(
//				bonusHealth[i],
//				"Bonus Health"
//			)
//		])
//	} else {
//		array_push(statTextList, [
//			new itemStatText(
//				bonusHealth[i],
//				"Bonus Health",
//				enumStatUnits.none,
//				bonusHealth[i - 1]
//			)
//		])
//	}
//}


