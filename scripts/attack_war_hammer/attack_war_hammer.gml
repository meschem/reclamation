// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_war_hammer(){
	var proj = instance_create_depth(x, y, depths.playerProjectile, obj_war_hammer)
	var velocity = get_velocity_from_angle(attackAngle, 4)
			
	proj.xVel = velocity[0]
	proj.yVel = velocity[1]
	proj.distancePerFrame = sqrt(sqr(proj.xVel) + sqr(proj.yVel))
				
	proj.distanceMax = 200 + 40 * obj_game_controller.talents[talentList.increasedRange][talentProps.curLevel]

	// weaponType = playerWeapons.warHammer

	proj.damageDirect = 24 + 8 * obj_game_controller.talents[talentList.damageBoost][talentProps.curLevel]
	//targetsMax = 1
	//targetsHit = 0

	proj.knockback = 16 + 8 * obj_game_controller.talents[talentList.heavyHammers][talentProps.curLevel]
				
	obj_player.warHammerCdCur = obj_player.warHammerCdMax
				
	audio_play_sound(snd_woosh, 1, false)
}