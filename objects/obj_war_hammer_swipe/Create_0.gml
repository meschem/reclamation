/// @description Init

event_inherited()

//projectileType = projectileTypes.weapon

//angleSpriteToVelocity = true

distanceMax = 150

damageDirect = 8
targetsMax = -1
targetsMaxPerFrame = -1
damageLostPerTarget = 0
hitsWalls = false
reverseSwipe = false

damageFrameCooldown = 120

// damageFrameCooldown = 60 // not used yet...

knockback = 16

var scale = 1 + obj_buff_controller.getBuffValue(buffValueTypes.bonusAttackArea)

image_xscale = scale
image_yscale = scale

animSpeed = 1

//image_xscale = 2
//image_yscale = 2

//shadowSprite = spr_war_hammer_shadow

///@param {id.Instance} target		Target being hit
onCollideFx = function(target)
{
	//damage_baddies_in_area(40, 15)
	//instance_create_depth(x, y, depths.fx, obj_p_shockwave_circle)
	spawn_fx_small_burst(target.x, target.y)
	
	var snd = irandom(2)
	
	if (snd == 1) audio_play_sound(snd_bottlecap_1, 0, false)
	else if (snd == 2) audio_play_sound(snd_bottlecap_2, 0, false)
	else if (snd == 0) audio_play_sound(snd_bottlecap_3, 0, false)
}
