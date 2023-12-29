
event_inherited()

name = "Petrified Heart"
description = "Increases Health for the player"

bonusHealth = [10, 20, 30, 50]

onLevelUp = function() {
	var addHp = bonusHealth[level - 1]
	owner.hp += addHp
}
