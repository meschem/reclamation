/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Skull Head"

hpMax = baddie_hp_high
hp = hpMax

crownLost = false

shadowSprite = spr_shadow_med
shadowOffset = 0
floatRange = 2

weight = baddie_weight_none
moveSpeedMax = baddie_move_speed_fast
pushRadius = baddie_push_radius_small

flies = true
collidesWith = baddie_collision_flier
//hpBarDisplay = entityHpBarTypes.small

deathParticles = [
	obj_ptb_skel_skull_red,
	//obj_ptb_skull_crown
]

onDamaged = function() {
	if (!crownLost && hp < (hpMax * 0.66)) {
		crownLost = true
		
		moveSpeedMax *= 3
		//moveAccel *= 1.5
		
		image_index = 1
		
		spawn_fx_bouncers(obj_ptb_skull_crown, random_range(60, 120))
		spawn_fx_bouncers(obj_ptb_skull_dagger, random_range(60, 120))
	}
}

beginStep = function() {
	image_xscale = sign(target.x - x)
}