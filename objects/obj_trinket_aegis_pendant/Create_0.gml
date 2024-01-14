
event_inherited()

name = "Aegis Pendant"
description = "Increases Armor"
rarity = enumRarity.magic

bonusArmor = [1, 2, 3, 5]

stats = [
	new itemStat(enumItemStats.bonusArmor, bonusArmor)
]

//for (var i = 0; i < array_length(bonusArmor); i++) {
//	array_push(statTextList, [
//		new itemStatText(
//			bonusArmor[i],
//			"Bonus Armor"
//		)
//	])
//}

