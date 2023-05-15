// Inherit the parent event
event_inherited();

movementType = projMovementTypes.explicit
attachedTo = obj_player

lifeSpan = 480

targetsMax = -1
damageDirect = 10
fxRate = 7
shadowSprite = spr_none

// set on obj_ability_lightning_ball.use()
angle = 0
rotationRate = 0
distanceOffset = 0

calcVelocity = function () {
	angle += rotationRate
	
	var pos = get_vec2_from_angle_mag(angle, distanceOffset)
	
	xVel = pos.x
	yVel = pos.y
}

spawnPeriodicFx = function() {
	if (age % fxRate == 0) {
		var inst = instance_create_depth(
			x, y,
			depth - 1,
			obj_particle_single_cycle
		)
		
		inst.sprite_index = spr_particle_lightning_medium
		inst.image_xscale = 0.5
		inst.image_yscale = 0.5
		inst.image_angle = random(360)
	}	
}