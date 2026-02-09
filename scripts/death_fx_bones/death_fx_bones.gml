// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function death_fx_bones() {
	var mag, angle, velocity
	var baseAngleOffset = irandom(90)

	for (var i = 0; i < 4; i++) {
		mag = random(2) + 0.25
		angle = irandom(60) + (i * 90) + baseAngleOffset
		velocity = get_velocity_from_angle(angle, mag)
	
		var particle = instance_create_depth(x, y, depths.enemy, obj_particle_bone)
	
		particle.xVel = velocity[0]
		particle.yVel = velocity[1]
		particle.zVel = random(3) -4
		// particle.zVel = -4
	}
}