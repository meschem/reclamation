
event_inherited()

name = "Beast Blood"
description = "A boiled-down mixture from carefully selected prey."

bonusPoisonDamage = [12, 25]
bonusDex = 4
poisonChance = 0.2
poisonDuration = stf(3)
statsSpecial = ["20% Chance for Weapon to poison target for 3 sec"]

onWeaponHit = function(_data) {
	var _poisoned = random(1) < poisonChance
	
	if (_poisoned) {
		apply_poison(_data.target, stf(poisonDuration), owner)
	}
}