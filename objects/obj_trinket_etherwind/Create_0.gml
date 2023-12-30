
event_inherited()

name = "Etherwind"
description = "Increases player Move Speed"

bonusMoveSpeed = [0.08, 0.14, 0.2, 0.3]

onLevelUp = function() {
	
}

stats = [
	new itemStat(enumItemStats.bonusMoveSpeed, bonusMoveSpeed)
]
