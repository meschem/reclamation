
event_inherited()

name = "Aegis Pendant"
description = "Increases Armor"

bonusArmor = [1, 2, 3, 5]

for (var i = 0; i < array_length(bonusArmor); i++) {
	array_push(statTextList, [
		new itemStatText(
			bonusArmor[i],
			"Bonus Armor"
		)
	])
}

show_message(statTextList)
