
event_inherited()

name = "Etherwind"
description = "Increases player Move Speed"
rarity = enumRarity.rare

bonusMoveSpeed = [0.06, 0.12, 0.18, 0.25]

onLevelUp = function() {
	
}

stats = [
	new itemStat(enumItemStats.bonusMoveSpeed, bonusMoveSpeed)
]
