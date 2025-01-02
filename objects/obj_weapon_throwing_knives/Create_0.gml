///@description			Init
event_inherited()

name = "Throwing Knives"
description = "Throws daggers in an arc. Every 5th dagger deals critical damage."
spawnDistance = 16
baseDamage = 10
spawnObject = obj_dagger
spawnCount = 3
bonusPoisonDamageScalar = 0
bonusDamageOnBounce = 0

pierceChance = 0

spread = 30
spreadScalar = 1

range = 210
rangeScalar = 1

velocity = 5
velocityScalar = 1

bounces = false
poisons = false

maxCd = 50

stats = [
	new weaponStat(enumWeaponStats.damage, id),
	new weaponStat(enumWeaponStats.knockback, id),
	new weaponStat(enumWeaponStats.projectileCount, id),
	new weaponStat(enumWeaponStats.cooldown, id),
	new weaponStat(enumWeaponStats.critDamage, id),
	new weaponStat(enumWeaponStats.projectileSpread, id)
]

upgrades = [
	obj_wupg_gen_sharpened,
	obj_wupg_gen_hefty,
	obj_wupg_gen_hastened,
	obj_wupg_gen_pierced,
	obj_wupg_gen_focused,
	obj_wupg_gen_contoured,
	obj_wupg_gen_multiplied,

	obj_wupg_wh_toxic_cuts,
	obj_wupg_wh_bouncing_mayhem,
	obj_wupg_wh_poison_tipped,
]

processUpgrades()

///@description						Returns an array of all projectile(s)
///									that are created
///@return {array<Id.Instance>}
use = function() {
	var _launcher = create_projectile_launcher(
		spawnObject,
		spawnCount,
		7,
		velocity * velocityScalar,
		velocity * velocityScalar,
		owner,
		launchAngleTypes.staticAngle,
		owner.attackAngle
	)

	_launcher.projectileType = projectileTypes.weapon
	_launcher.launchInstance = owner
	_launcher.weapon = id
	_launcher.launchOffsetVariance = 12
	
	return []
}
