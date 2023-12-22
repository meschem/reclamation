/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Thorns"
description = "Returns pointy damage to attackers"
onHitAbility = true
active = true

icon = spr_ability_icon_thorns

treeLevel = 2

maxCd = 900

buffTimeSeconds = 6
activationCdMax = 40

spikeDamage = 30
spikeLifeSpan = 60
spikeCount = 8

spiralRotationSpeed = 3
lightningShockAmount = 180

stats = [
	new abilityStat(
		"Spike Count", "spikeCount", 
		[8, 8, 10, 10, 10]
	),
	new abilityStat(
		"Damage", "spikeDamage", 
		[30, 30, 40, 40, 50]
	),
	new abilityStat(
		"Cooldown", "maxCd", 
		[900, 850, 800, 750, 700]
	)
]

addRune("Spirals", "Spikes spin out in a spiral pattern and increases distance")
addRune("Lightning Tipped", "Spikes deal lightning damage to targets")
addRune("Last Gasp", "Once per run, instead of dying, release a huge burst of spikes")

use = function () {
	buff_player_invuln(buffTimeSeconds)
	activate_spiked_armor()
}

activateOnHit = function() {
	if (canActivate()) {
		activate_spiked_armor()
		activationCdCur = activationCdMax
	}
}

getLifeSpan = function () {
	if (runes[enumRunes.magdela].enabled) {
		return spikeLifeSpan * 1.5
	}
	
	return spikeLifeSpan
}