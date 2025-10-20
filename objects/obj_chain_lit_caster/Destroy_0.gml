
//show_message(damageBounceModifier)

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
	if (canTargetOwner && owner != noone && instance_exists(owner)) {
		var _distance = point_distance(x, y, owner.x, owner.y)
		
		if (_distance < maxJumpDistance) {
			target = owner
			hitList = []
		}		
	}
} else {	
	array_push(hitList, target)

	//damage_baddie(target, damage, false, 2, 0.5)
	damage_baddie_with_type(target, damage, enumDamageTypes.lightning, owner, false, 2, 0.5)
}

if (target == noone) {
	return 0
}

create_chain_lightning_fx(spawnPoint, new vec2(target.x, target.y))

audio_play_sound(
	snd_clicky_zap, 0, false, 0.8, 0, random_range(0.9, 1.1)
)
		
if (bounces > 0) {
	var inst = instance_create_depth(target.x, target.y, depths.fx, obj_chain_lit_caster)
		
	inst.bounces = bounces - 1
	inst.damage = damage * damageBounceModifier
	inst.damageBounceModifier = damageBounceModifier
	inst.hitList = hitList
	inst.canTargetOwner = canTargetOwner
	inst.owner = owner
}