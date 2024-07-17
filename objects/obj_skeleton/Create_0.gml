/// @description Init

event_inherited();

Name = "Skeleton"

hpMax = 20
hp = hpMax

shadowSprite = spr_shadow_med
shadowOffset = -1

hpBarDisplay = baddieHpBarTypes.none

walkAnimType = baddieWalkAnimTypes.curves

deathParticles = [
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_bone_purp,
	obj_ptb_skel_ribs_purp,
	obj_ptb_skel_skull_purp,
]

add_baddie_gold_fodder

//deathFx = function() {
//	spawn_fx_bouncers(deathParticles, lastDamageAngle, lastDamageForce)
//	//var _inst, _angle, _mag, _vec
	
//	//for (var i = 0; i < array_length(deathParticleSprites); i++) {
//	//	_inst = instance_create_depth(x, y, depths.fx, obj_particle_bouncer)
//	//	_angle = lastDamageAngle + random_range(-20, 20)
//	//	_mag = random_range(0.4, 2.4)
//	//	_vec = get_vec2_from_angle_mag(_angle, _mag)
		
//	//	_inst.xVel = _vec.x
//	//	_inst.yVel = _vec.y
//	//	_inst.sprite_index = deathParticleSprites[i]
//	//	_inst.zVel *= random_range(-0.8, 1.2)
//	//}
//}
