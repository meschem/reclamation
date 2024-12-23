/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

collisionDelay = seconds_to_frames(1.5)
shadowSprite = spr_none

onDeathFx = function() {
	var _inst = instance_create_depth(x, y, depth, obj_bear_trap_activated, {
		radius: radius,
		damageSplash: damageSplash
	})
	
	_inst.radius = radius
	_inst.damageSplash = damageSplash
}
