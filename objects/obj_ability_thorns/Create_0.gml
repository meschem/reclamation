/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Thorns"
description = "Shoots out spikes in all directions. Fires off automatically when taking damage, ignoring cooldown."
onHitAbility = true
active = true
selectionIcon = spr_abil_select_icon_thorns

lastGaspAvailable = true

treeLevel = 2

curCd = 0
maxCd = seconds_to_frames(1.5)

spikesCurCd = 0
spikesMaxCd = seconds_to_frames(1)

autoCast = true
canAutoCast = true

buffTimeSeconds = 6
activationCdMax = 40

spikeDamage = 15
spikeCount = 4
spikeLifeSpan = 90
spikeAngleOffset = 0

spiralRotationSpeed = 3
//lightningShockAmount = 180

projectile = obj_armor_spike
projectileCharged = obj_armor_spike_charged

stats = [
	new abilityStat(
		"Spike Count", "spikeCount", 
		[4, 4, 6, 6, 8, 8]
	),
	new abilityStat(
		"Damage", "spikeDamage", 
		[15, 25, 25, 35, 40]
	)
]

addRune("Spirals", "Spikes spin out in a spiral pattern and increases distance")
addRune("Lightning Tipped", "Spikes deal lightning damage to targets")
addRune("Last Gasp", "Upon receiving a fatal blow, heal to full and release spikes. Usable once per run."	)

use = function () {
	activate_spiked_armor(owner)
	//var _inst = create_instance(obj_buff_thorns_shield)
	
	//_inst.owner = owner
	//_inst.timer = seconds_to_frames(buffTimeSeconds)
	//_inst.hp = owner.maxHp
	//_inst.hpMax = owner.maxHp
}

activateOnHit = function(_hitBy) {
	activate_spiked_armor(owner)

	if (owner.hp <= 0 && lastGaspAvailable && runes[enumRunes.voldan].enabled) {
		owner.hp = owner.maxHp
		lastGaspAvailable = false
		create_toaster("Last Gasp Activated!!")
	}
}

getLifeSpan = function () {
	if (runes[enumRunes.magdela].enabled) {
		return spikeLifeSpan * 1.5
	}
	
	return spikeLifeSpan
}
