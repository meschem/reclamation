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

iconColor = enumAbilityColor.orange

curCd = 0
maxCd = seconds_to_frames(1.5)
maxCdLightningTipped = stf(1)

spikesCurCd = 0
spikesMaxCd = seconds_to_frames(1)

autoCast = true
canAutoCast = true

buffTimeSeconds = 6
activationCdMax = 40

spikeDamage = [15, 20, 25, 30, 30]
spikeCount = [4, 4, 6, 6, 8]
spikeLifeSpan = 90
spikeAngleOffset = 0

spiralRotationSpeed = 3
//lightningShockAmount = 180

projectile = obj_armor_spike
projectileCharged = obj_armor_spike_charged

stats = [
	new abilityStat(
		"Damage", "spikeDamage", 
		spikeDamage
	),
		new abilityStat(
		"Spike Count", "spikeCount", 
		spikeCount
	)
]

statBonusLastGasp = {
	stat: enumCharStats.str,
	active: false,
	amount: 60,
	name: "Last Gasp",
	description: "Upon receiving a fatal blow, heal to full and relase a huge wave of spikes. Single use.",
}

statBonusSpiralikes = {
	stat: enumCharStats.dex,
	active: false,
	amount: 20,
	name: "Spiralikes",
	description: "Spikes spiral outwards with increased range"
}

statBonusLightningTipped = {
	stat: enumCharStats.int,
	active: false,
	amount: 40,
	name: "Lightning Tipped",
	description: "Converts damage to Lightning, lowers base cooldown."
}
	
charStatBonuses = [
	statBonusLastGasp,
	statBonusSpiralikes,
	statBonusLightningTipped
]


//addRune("Spirals", "Spikes spin out in a spiral pattern and increases distance")
//addRune("Lightning Tipped", "Spikes deal lightning damage to targets")
//addRune("Last Gasp", "Upon receiving a fatal blow, heal to full and release spikes. Usable once per run."	)

use = function () {
	activate_spiked_armor(owner)
}

// FIXME: Override on resetCooldown(), dangerous
resetCooldown = function () {
	var _baseCd = (statBonusLightningTipped.active) ? maxCdLightningTipped : maxCd
	_baseCd = max(_baseCd, 0.25)

	curCd = _baseCd * get_player_stat(enumPlayerStats.abilityCooldownScalar)
}

activateOnHit = function(_hitBy) {
	activate_spiked_armor(owner)
	activate_spiked_armor(owner)	

	if (owner.hp <= 0 && lastGaspAvailable && statBonusLastGasp.active) {
		owner.hp = owner.maxHp
		lastGaspAvailable = false
		create_toaster("Last Gasp Activated!!")
	}
}

getLifeSpan = function () {
	//if (runes[enumRunes.magdela].enabled) {
	//	return spikeLifeSpan * 1.5
	//}
	if (statBonusSpiralikes.active) {
		return spikeLifeSpan * 1.5
	}	
	
	return spikeLifeSpan
}
