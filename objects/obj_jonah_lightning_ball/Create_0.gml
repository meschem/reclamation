// Inherit the parent event
event_inherited();

hitsWalls = false

movementType = projMovementTypes.explicit
attachedTo = obj_player
projectileType = projectileTypes.ability

lifeSpan = 480

targetsMax = -1
damageDirect = obj_ability_lightning_ball.projectileDamage
fxRate = 7
shadowSprite = spr_none

// set on obj_ability_lightning_ball.use()
angle = 0
rotationRate = 0
distanceOffset = 0

explodeOnDeath = false

calcVelocity = function () {
	angle += rotationRate
	
	var pos = get_vec2_from_angle_mag(angle, distanceOffset)
	
	xVel = pos.x
	yVel = pos.y
}

onDeathFx = function() {
	if (explodeOnDeath) {
		var radius = obj_ability_lightning_ball.overloadRadius
		var damage = obj_ability_lightning_ball.overloadDamage
		
		damage_baddies_in_area(radius, damage)
		spawn_fx_circle(radius)
	}
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
