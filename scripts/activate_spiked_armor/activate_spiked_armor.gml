// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_spiked_armor(caster, abilObj = id) {
	var damage = abilObj.spikeDamage[abilObj.level - 1]
	var spikeCount = abilObj.spikeCount[abilObj.level - 1]
	
	var lifeSpan = abilObj.getLifeSpan()	
	var initAngle = abilObj.spikeAngleOffset
	var vel = 4
	var projObj = obj_none
	
	if (abilObj.statBonusLightningTipped.active) {
		projObj = abilObj.projectileCharged
	} else {
		projObj = abilObj.projectile
	}
	
	spikeCount += caster.bonusProjectileCount
	
	for (var i = 0; i < spikeCount; i++) {
		var proj = instance_create_depth(
			obj_player.x,
			obj_player.y,
			depths.playerProjectile,
			projObj
		)
		
		var angle = (360 / spikeCount) * i + initAngle
		var velocity = get_velocity_from_angle(angle, vel)
			
		proj.xVel = velocity[0]
		proj.yVel = velocity[1]
		proj.damageDirect = damage
		proj.lifeSpan = lifeSpan
		proj.owner = caster
		
		if (abilObj.statBonusSpiralikes.active) {
			//proj.rotationSpeed = abilObj.spiralRotationSpeed
			attach_projectile(proj, caster)
			proj.rotationSpeed = 5.2
			proj.rotationSpeedDeaccel = 0.1
		}
	}
	
	abilObj.spikeAngleOffset += 45
}