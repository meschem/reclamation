// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_dagger() {
	var proj = instance_create_depth(x, y, depths.playerProjectile, obj_dagger)
	var velocity = get_velocity_from_angle(attackAngle, 6)
				
	proj.xVel = velocity[0]
	proj.yVel = velocity[1]
	proj.distancePerFrame = sqrt(sqr(proj.xVel) + sqr(proj.yVel))

	obj_player.daggerCdCur = obj_player.daggerCdMax
	audio_play_sound(snd_woosh, 1, false)
}