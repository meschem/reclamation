// Inherit the parent event
event_inherited();

hitsWalls = false

damageType = enumDamageTypes.lightning

movementType = projMovementTypes.explicit
attachedTo = obj_player
projectileType = projectileTypes.ability

lifeSpan = 480

distanceOffsetTarget = -1
distanceOffsetMax = 140
distanceOffsetMin = 50

targetsMax = 999
damageDirect = 1 // obj_ability_lightning_ball.projectileDamage
fxRate = 12
shadowSprite = spr_shadow_enemy_shot_basic
shadowOffsetY = 15

// set on obj_ability_lightning_ball.use()
angle = 0
rotationRate = 0
rotationRateMax = 5
rotationRateMin = 1.5
rotationChangeRate = 0.05
distanceOffset = 0
distanceChangeRate = 1

hasStrongCurrent = false
hasRagingStorm = false

explodeOnDeath = false

owner = obj_player.id // get_player_target()

create_ribbon(id, obj_ribbon_lightning_ball) //, 5, 6) //, global.colorAqua)

stepBegin = function() {
	if (!hasStrongCurrent || owner == noone || !instance_exists(owner)) {
		return 0
	}
	
	if (abs(owner.xVel) > 0.1 || abs(owner.yVel) > 0.1) {
		distanceOffset = min(distanceOffset + distanceChangeRate, distanceOffsetMax)
		
		var _rotationRate = max(abs(rotationRate) - rotationChangeRate, rotationRateMin)
		rotationRate = _rotationRate * sign(rotationRate)
	} else {
		distanceOffset = max(distanceOffset - distanceChangeRate, distanceOffsetMin)
		
		var _rotationRate = min(abs(rotationRate) + rotationChangeRate, rotationRateMax)
		rotationRate = _rotationRate * sign(rotationRate)
	}
}

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
