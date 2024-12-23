/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

moveBehavior = entityMoveBehaviors.custom
movementType = playerSummonMovementTypes.attacker
walkAnimType = entityWalkAnimTypes.curves

shadowSprite = spr_shadow_lg
shadowOffset = -6

collisionType = entityCollisionTypes.none
moveSpeedMax = 0.8
accel = 0.04
deaccel = 0.1
damage = 10
critChance = 0

lifeSpan = stf(40)

setup_aggressive_wander_mvmt()

swipeCdMax = stf(2)
swipeCdCur = swipeCdMax
owner = noone

beginStep = function() {
	aggressive_wander_movement()
	
	swipeCdCur--
	
	if (swipeCdCur <= 0) {
		_attackAngle = random(360)
		
		if (target != noone) {
			_attackAngle = point_direction(x, y, target.x, target.y)
		}
		
		swipeAttack(_attackAngle)
		
		swipeCdCur = swipeCdMax + irandom_range(-6, 6)
	}	
}

swipeAttack = function(_angle) {
	var _offset = 30
	var _scale = 0.75 * get_player_stat(enumPlayerStats.areaOfEffectScalar, owner)
	
	var _offsetVec = get_vec2_from_angle_mag(_angle, _offset)
	
	var _spawnLoc = new vec2(
		x + _offsetVec.x,
		y + _offsetVec.y
	)
	
	var _inst = instance_create_depth(_spawnLoc.x, _spawnLoc.y, depths.playerProjectile, obj_wolf_swipe)
		
	_inst.image_xscale = _scale
	_inst.image_yscale = _scale
	_inst.image_angle = _angle
	_inst.owner = owner
	
	_inst.damageDirect = damage
	_inst.critChance = critChance
}
