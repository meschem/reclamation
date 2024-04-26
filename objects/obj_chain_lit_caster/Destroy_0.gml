
if (target == noone) {
	var baddieList = ds_list_create()
	var closestBaddie = noone
		
	var baddies = collision_circle_list(
		x, y,
		maxJumpDistance,
		obj_baddie,
		false,
		true,
		baddieList,
		false
	)
	
	ds_list_shuffle(baddies)
		
	for (var i = 0; i < ds_list_size(baddieList); i++) {
		if (!array_contains(hitList, baddieList[| i])) {
			target = baddieList[| i]
			break
		}
	}
}

if (target == noone) {
	if (debug) {
		create_toaster("No CL target found.")
	}
		
	return
}
	
array_push(hitList, target)

damage_baddie(target, damage, false)
		
create_chain_lightning_fx(spawnPoint, new vec2(target.x, target.y))

audio_play_sound(
	snd_clicky_zap, 0, false, 0.8, 0, random_range(0.9, 1.1)
)
		
if (bounces > 0) {
	var inst = instance_create_depth(target.x, target.y, depths.fx, obj_chain_lit_caster)
		
	inst.bounces = bounces - 1
	inst.damage = damage * damageBounceModifier
	inst.hitList = hitList
}

