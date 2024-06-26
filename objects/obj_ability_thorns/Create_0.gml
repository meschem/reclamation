/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Thorns"
description = "Become invulnerable and deal damage on touching enemies."
onHitAbility = true
active = true
selectionIcon = spr_abil_select_icon_thorns

treeLevel = 2

maxCd = seconds_to_frames(15)

autoCast = true
canAutoCast = true

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
		[8, 8, 12, 12, 12]
	),
	new abilityStat(
		"Damage", "spikeDamage", 
		[20, 40, 40, 60, 80]
	),
	new abilityStat(
		"Cooldown", "maxCd", 
		[900, 840, 780, 720, 640]
	)
]

addRune("Spirals", "Spikes spin out in a spiral pattern and increases distance")
addRune("Lightning Tipped", "Spikes deal lightning damage to targets")
addRune("Last Gasp", "Once per run, instead of dying, release a huge burst of spikes")

use = function () {
	buff_player_invuln(buffTimeSeconds)
	activate_spiked_armor(owner)
}

activateOnHit = function() {
	if (canActivate()) {
		activate_spiked_armor(owner)
		activationCdCur = activationCdMax
	}
}

getLifeSpan = function () {
	if (runes[enumRunes.magdela].enabled) {
		return spikeLifeSpan * 1.5
	}
	
	return spikeLifeSpan
}
