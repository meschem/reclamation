// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_spiked_armor() {
	var caster = get_player_target()
	
	var damage = obj_ability_thorns.spikeDamage
	var lifeSpan = obj_ability_thorns.getLifeSpan()
	var spikeCount = obj_ability_thorns.spikeCount
	var vel = 4
	
	spikeCount += caster.bonusProjectileCount
	
	for (var i = 0; i < spikeCount; i++) {
		var proj = instance_create_depth(
			obj_player.x,
			obj_player.y,
			depths.playerProjectile,
			obj_armor_spike
		)
		var angle = (360 / spikeCount) * i
		var velocity = get_velocity_from_angle(angle, vel)
			
		proj.xVel = velocity[0]
		proj.yVel = velocity[1]
		proj.damageDirect = damage
		proj.lifeSpan = lifeSpan
		proj.applyShock = obj_ability_thorns.lightningShockAmount
		
		if (obj_ability_thorns.runes[enumRunes.magdela].enabled) {
			proj.rotationSpeed = obj_ability_thorns.spiralRotationSpeed
		}
	}
}