///@description   Applies relevant player projectile props to a projectile
///@param {id.Instance} _projectile		Projectile being fired
///@param {id.Instance} _weapon			Weapon using projectiles
function apply_player_weapon_projectile_props(_projectile, _weapon) {
	//with (_wea
	//_projectile.image_angle = _angle
	//_projectile.facingAngle = _angle
	//_projectile.owner = _weapon.owner
	var _angle = get_angle(_projectile.xVel, _projectile.yVel)
	var _mag = point_distance(0, 0, _projectile.xVel, _projectile.yVel)
	
	with (_weapon) {
		_projectile.distanceMax = range * rangeScalar
		_projectile.pierceChance = pierceChance
		_projectile.bonusPoisonDamageScalar = bonusPoisonDamageScalar
		_projectile.bouncesMax = (bounces) ? 10 : 0
		_projectile.bonusDamageOnBounce = bonusDamageOnBounce
		
		_projectile.damageDirect += bonusDamage
		_projectile.damageDirect *= damageScalar
	
		_projectile.knockback += bonusKnockback
		_projectile.knockback *= knockbackScalar
	
		_projectile.critMultiplier += bonusCritMultiplier
					
		set_velocity_from_angle(_projectile, _angle, _mag * velocityScalar)
	}
}