
event_inherited()

name = "Petrified Heart"
description = "Increases Health for the player"

bonusHealth = [10, 20, 30, 50]
bonusHitRecovery = [0.3, 0.4, 0.5, 0.6]

onLevelUp = function() {
	var addHp = bonusHealth[level - 1]
	owner.hp += addHp
}

stats = [
	new itemStat(enumItemStats.bonusHealth, bonusHealth),
	//new itemStat(enumItemStats.custom, bonusHitRecovery, true, {
	//	displayName: "Hit Recovery Time",
	//	unit: statUnits.percent
	//})
]
