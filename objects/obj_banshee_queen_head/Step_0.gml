/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

if (!instance_exists(owner)) {
	instance_destroy()
	
	return 0
}

if (age - hitReactionFrame < hitReactionDuration) {
	var _ratio = (age - hitReactionFrame) / hitReactionDuration
	
	var _curve = animcurve_get(ac_baddie_hit_reaction)
	var _channel = animcurve_get_channel(_curve, 0)
	
	offsetY = animcurve_channel_evaluate(_channel, _ratio) * -1
} else {
	if (owner.bansheeState == bansheeQueenStates.idle) {
		sprite_index = spr_banshee_queen_head_norm
		
		offsetY = 0
	}	
}
