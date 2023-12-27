
event_inherited()

name = "War Hammer"
spawnDistance = 32
spawnObject = obj_war_hammer_swipe

reverseSwipe = false

maxCd = 80

upgrades = [
	create_instance(obj_wupg_wh_mega_hammer),
	create_instance(obj_wupg_gen_rapid),
]

use = function() {
	//var velocity = get_vec2_from_angle_mag(owner.attackAngle, 4)
	//var inst = launch(obj_war_hammer, velocity)
	
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
}
