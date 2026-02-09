
event_inherited()

name = "Venomleaf"
description = "Dangerous to consume, but far more to harvest."

bonusPoisonDamage = [5, 10, 25]
poisonChance = 0.4
poisonDuration = stf(3)
statsSpecial = ["40% Chance to apply Poison for 3 seconds on hit."]

onWeaponHit = function(_data) {
	var _poisoned = random(1) < poisonChance
	
	if (_poisoned) {
		apply_poison(_data.target, stf(poisonDuration), owner)
	}
}
