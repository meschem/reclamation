/// @description Init

event_inherited()

distanceMax = 150

damageDirect = 12
targetsMax = -1
targetsMaxPerFrame = -1
damageLostPerTarget = 0
hitsWalls = false
reverseSwipe = false
baseScale = 1.25

damageFrameCooldown = 120

//enemiesPerCrit = 3		// Crits every X enemies struck, randomly selected

knockback = 16

animSpeed = 1

///@description						Marks enemies for crit
///@param {id.DsList} enemyList
preDamage = function(enemyList) {
	var distance
	
	for (var i = 0; i < ds_list_size(enemyList); i++) {
		distance = point_distance(x, y, enemyList[| i].x, enemyList[| i].y)
		
		if (distance < 24 * image_xscale) {
			enemyList[| i].markedForCrit = true
		}
	}
}

///@param {id.Instance} target		Target being hit
onCollideFx = function(target)
{
	//damage_baddies_in_area(40, 15)
	//instance_create_depth(x, y, depths.fx, obj_p_shockwave_circle)
	//spawn_fx_small_burst(target.x, target.y)
	
	var snd = irandom(2)
	
	if (snd == 1) audio_play_sound(snd_bottlecap_1, 0, false)
	else if (snd == 2) audio_play_sound(snd_bottlecap_2, 0, false)
	else if (snd == 0) audio_play_sound(snd_bottlecap_3, 0, false)
}
