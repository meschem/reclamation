/// @description Init

event_inherited()

//projectileType = projectileTypes.weapon

angleSpriteToVelocity = true
ignoreLifeCycleEvents = true

distanceMax = 150

damageDirect = 20
damageType = enumDamageTypes.lightning

knockback = 20

shadowSprite = spr_none

onCollideFx = function(_target = noone)
{
	spawn_fx_small_burst(x, y)
}
