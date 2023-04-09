// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_spiked_armor(level) {
	with (obj_player) {
		var damage = (level <= 2) ? 10 : 20
		var lifeSpan = (level <= 3) ? 30 : 50
		var spikeCount = (level <= 4) ? 8 : 12	
	
		for (var i = 0; i < spikeCount; i++) {
			var proj = instance_create_depth(
				obj_player.x,
				obj_player.y,
				depths.playerProjectile,
				obj_armor_spike
			)
			var angle = (360 / spikeCount) * i
			var velocity = get_velocity_from_angle(angle, 3)
			
			proj.xVel = velocity[0]
			proj.yVel = velocity[1]
			proj.damageDirect = damage
			proj.lifeSpan = lifeSpan
		}
	}
}