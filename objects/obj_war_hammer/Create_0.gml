/// @description Init

event_inherited()

//projectileType = projectileTypes.weapon

angleSpriteToVelocity = true

distanceMax = 150

damageDirect = 30

targetsHit = 0
targetsMax = 1
damageLostPerTarget = 10

damageFrameCooldown = 120

// damageFrameCooldown = 60 // not used yet...

create_ribbon(id, obj_ribbon, 18, 6)

knockback = 20

shadowSprite = spr_war_hammer_shadow

onCollideFx = function(_target = noone)
{
	spawn_fx_small_burst(x, y)
    heavy_metal_hit(_target)
}
