/// @description Init

event_inherited()

//projectileType = projectileTypes.weapon

angleSpriteToVelocity = true

distanceMax = 150

damageDirect = 30

targetsHit = 0
targetsMax = 10
damageLostPerTarget = 10

damageFrameCooldown = 120

// damageFrameCooldown = 60 // not used yet...

knockback = 16

shadowSprite = spr_war_hammer_shadow

onCollideFx = function()
{
	//damage_baddies_in_area(40, 15)
	//instance_create_depth(x, y, depths.fx, obj_p_shockwave_circle)
	spawn_fx_small_burst(x, y)
	audio_play_sound(snd_big_slap, 0, false)
}
