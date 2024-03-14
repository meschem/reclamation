///@description			Init
event_inherited()

name = "War Hammer"
description = "Damages in an expanding cone. Deals critical damage to close targets."
spawnDistance = 22
spawnObject = obj_war_hammer_swipe

maxCd = 80

stats = [
	new abilityStat(
		"Damage", "damage",
		[12]
	),
	new abilityStat(
		"Cooldown", "maxCd",
		[80]
	),
	new abilityStat(
		"Range", "range",
		[120], true,
		statUnits.length
	)
]

reverseSwipe = false

upgrades = [
	//create_instance(obj_wupg_wh_mega_hammer),
	//create_instance(obj_wupg_gen_rapid),
]

///@description						Returns an array of all projectile(s)
///									that are created
///@return {array<Id.Instance>}
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
