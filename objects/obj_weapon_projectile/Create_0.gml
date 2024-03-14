/// @description Init

event_inherited()

projectileType = projectileTypes.weapon

angleSpriteToVelocity = false

lifeSpan = -1
age = 0

baseScale = 1

distanceMax = 120
distanceTraveled = 0
distancePerFrame = 1

xVel = 0
yVel = 0

knockback = 0

damageDirect = 1
targetsMax = 1
targetsHit = 0

damageFrameCooldown = 60 // not used yet...

shadowSprite = spr_war_hammer_shadow

soundOnHit = snd_clack

var owner = get_player_target()

critChance = owner.critChance

hitList = []

///@param {id.Instance} _owner
setScale = function(_owner, _weapon = noone) {
	var _buffScale = obj_buff_controller.getBuffValue(buffValueTypes.bonusAttackArea)
	var _bonusAoeScale = _owner.bonusWeaponAoeScalar
	var _weaponBonus = (_weapon != noone) ? _weapon.aoeScalar : 0
	var _scale = baseScale * (_buffScale + _bonusAoeScale + _weaponBonus)

	image_xscale = _scale
	image_yscale = _scale
}

onCollideFx = function()
{
	spawn_fx_small_burst(x, y)
}
