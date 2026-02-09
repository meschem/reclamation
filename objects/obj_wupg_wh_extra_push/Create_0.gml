
event_inherited()

name = "Extra Push"
description = "Every 3rd swing triples knockback and deals increased damage"

swipeIndex = 0

screenshakeCdMax = 30
screenshakeCd = screenshakeCdMax
screenshakeOnHit = false

swipeCountMax = 3
knockbackMultiplier = 3
bonusDamage = 20

upgradeType = weaponUpgradeTypes.major

stats = [
	new abilityStat(
		"Knocback Multiplier", "knockbackMultiplier",
		[3, 3.5, 4]
	),
	new abilityStat(
		"Bonus Damage", "bonusDamage",
		[5, 10, 15]
	)
]

addLifeCycleEvent(enumLifeCycleEvents.stepFirst, function(_data) {
	swipeIndex++
	
	if (swipeIndex >= swipeCountMax) {
		swipeIndex = 0

		_data.projectile.knockback *= knockbackMultiplier
		_data.projectile.damageDirect += bonusDamage
		screenshakeOnHit = true
	} else {
		screenshakeOnHit = false
	}
})

addLifeCycleEvent(enumLifeCycleEvents.targetHit, function(_data) {
	if (screenshakeOnHit) {
		obj_camera_controller.applyShake(screenshake_light)
		audio_play_sound(snd_punch_huge_1, 0, false)
	}
})