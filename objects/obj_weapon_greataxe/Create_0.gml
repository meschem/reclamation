
event_inherited()

name = "Great Axe"
description = "Big swings in wide arcs. Every third target in a single swing is hit with critical damage."

spawnDistance = 32
spawnObject = obj_greataxe_swipe
maxCd = 50

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
	create_instance(obj_wupg_wh_mega_hammer),
	create_instance(obj_wupg_gen_rapid),
	create_instance(obj_wupg_wh_lit_crits)
]

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
