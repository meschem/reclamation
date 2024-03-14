
event_inherited()

name = "Great Maul"
description = "Big swings in wide arcs. Every third target in a single swing is hit with critical damage."

spawnDistance = 32
spawnObject = obj_greataxe_swipe
maxCd = 72

stats = [
	new abilityStat(
		"Damage", "damage",
		[15]
	),
	new abilityStat(
		"Cooldown", "maxCd",
		[50]
	),
	new abilityStat(
		"Range", "range",
		[70], true,
		statUnits.length
	)
]

reverseSwipe = false

owner = get_player_target()

upgrades = [
	obj_wupg_gen_damage,
	obj_wupg_gen_knockback,
	obj_wupg_gen_weapon_size,

	obj_wupg_wh_lit_crits,
	obj_wupg_wh_extra_push,
	obj_wupg_wh_stunning_blow
]

processUpgrades()

use = function() {
	var spawnPoint = get_vec2_from_angle_mag(owner.attackAngle, spawnDistance)
	
	var inst = instance_create_depth(
		owner.x + spawnPoint.x,
		owner.y + spawnPoint.y,
		depths.fx,
		spawnObject
	)
	
	inst.image_angle = owner.attackAngle
	inst.facingAngle = owner.attackAngle
	inst.owner = owner
	
	if (reverseSwipe) {
		inst.reverseSwipe = true
	}

	reverseSwipe = !reverseSwipe
	
	audio_play_sound(snd_woosh, 1, false)
	
	return [inst]
}
