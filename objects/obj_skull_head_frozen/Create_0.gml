/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Skull Head"

hpMax = baddie_hp_medium
hp = hpMax

crownLost = false

shadowSprite = spr_shadow_med
shadowOffset = 0
floatRange = 2

weight = baddie_weight_med

pushRadius = 10
pushForce = 10

flies = true
collidesWith = baddie_collision_flier
//hpBarDisplay = entityHpBarTypes.small

deathParticles = [
	obj_ptb_skel_skull_blue,
	//obj_ptb_skull_crown
]

onDamaged = function() {
	if (!crownLost && hp < (hpMax * 0.66)) {
		crownLost = true
		
		moveSpeedMax *= 3
		moveAccel *= 1.5
		
		image_index = 1
		
		spawn_fx_bouncers(obj_ptb_skull_crown, random_range(60, 120))
	}
}

beginStep = function() {
	image_xscale = sign(target.x - x)
}