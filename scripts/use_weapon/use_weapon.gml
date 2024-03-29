// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function use_weapon(weapon) {
	// Will move weapons to individual scripts
	
	switch (weapon) {
		case playerWeapons.warHammer:
			if (warHammerCdCur <= 0) {
				attack_war_hammer(attackAngle)
				warHammerCdCur = warHammerCdMax * (1 / attackSpeedScalar)
			}
		break
		
		case playerWeapons.dagger:
				attack_dagger()
			if (daggerCdCur <= 0) {
				var proj = instance_create_depth(x, y, depths.playerProjectile, obj_dagger)
				var velocity = get_velocity_from_angle(attackAngle, 6)
				
				proj.xVel = velocity[0]
				proj.yVel = velocity[1]
				proj.distancePerFrame = sqrt(sqr(proj.xVel) + sqr(proj.yVel))

				daggerCdCur = daggerCdMax
				audio_play_sound(snd_woosh, 1, false)
			}
		break
	}
}
