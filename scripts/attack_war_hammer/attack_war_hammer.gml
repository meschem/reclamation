///@description									Throws out a hammer
///@param {id.Instance} attacker	Person making attack		
///@param {real} angleModifier					+/- to angle hammer is thrown at
///@return {id.Instance}
function attack_war_hammer(attacker = noone, angleModifier = 0) {
	if (attacker == noone) {
		attacker = get_player_target()
	}

	var proj = instance_create_depth(attacker.x, attacker.y, depths.playerProjectile, obj_war_hammer)
	var velocity = get_velocity_from_angle(attacker.attackAngle + angleModifier, 4)
			
	proj.xVel = velocity[0]
	proj.yVel = velocity[1]
	proj.distancePerFrame = sqrt(sqr(proj.xVel) + sqr(proj.yVel))
				
	proj.distanceMax = 200 // + 40 * obj_game_controller.talents[talentList.increasedRange][talentProps.curLevel]

	// weaponType = playerWeapons.warHammer

	proj.damageDirect = 24 // * obj_game_controller.talents[talentList.damageBoost][talentProps.curLevel]
	proj.knockback = 16 // * obj_game_controller.talents[talentList.heavyHammers][talentProps.curLevel]

	audio_play_sound(snd_woosh, 1, false)
	
	return proj
}