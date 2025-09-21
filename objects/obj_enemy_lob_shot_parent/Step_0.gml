/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

if (game_is_paused()) {
	return 0
}

if (!drawTargetComplete) {
	drawTargetComplete = true
	
	if (damageRadius > 0) {
		var _inst = instance_create_depth(drawTargetX, drawTargetY, depths.enemyFloorFx, drawTargetObject)
		
		_inst.parent = id
	}
}
