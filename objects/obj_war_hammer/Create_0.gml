/// @description Init

event_inherited()

angleSpriteToVelocity = true

distanceMax = 220

weaponType = playerWeapons.warHammer

damageDirect = 30
targetsMax = 1
targetsHit = 0

// damageFrameCooldown = 60 // not used yet...

knockback = 16

shadowSprite = spr_war_hammer_shadow

onCollideFx = function()
{
	spawn_fx_small_burst(x, y)
}