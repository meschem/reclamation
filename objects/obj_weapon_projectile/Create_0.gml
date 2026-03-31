/// @description	Largely defines shape and crit behavior. Stats should be driven by the obj_weapon
///					producing the projectile

event_inherited()

projectileType = projectileTypes.weapon

angleSpriteToVelocity = false
ignoreLifeCycleEvents = false

lifeSpan = -1
age = 0

baseScale = 1
scaleSet = false

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

soundOnHit = snd_thud_impact

var owner = obj_player.id // get_player_target()

critChance = owner.critChance

hitList = []

///@param {id.Instance} _owner                              // must be set after spawn for proper scaling
setScale = function(_owner, _weapon = noone) {
	var _buffScale = obj_buff_controller.getBuffValue(buffValueTypes.bonusAttackArea)
	//var _bonusAoeScale = _owner.bonusWeaponAoeScalar
	var _weaponScale = (_weapon != noone) ? _weapon.projectileScale : 0
	var _scale = baseScale * (_buffScale + _weaponScale)

	image_xscale = _scale
	image_yscale = _scale
    
    //create_toaster($"scale set: {baseScale} * (1 + {_buffScale} + {_weaponScale})")
}

onCollideFx = function()
{
	spawn_fx_small_burst(x, y)
}
