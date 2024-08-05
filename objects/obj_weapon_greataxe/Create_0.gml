///@description				Init

event_inherited()

name = "Great Maul"
description = "Big swings in wide arcs. Every third target in a single swing is hit with critical damage."
icon = sprite_index
iconIndex = 0

spawnDistance = 32
spawnObject = obj_greataxe_swipe
maxCd = 72

multiProjSpawnDelay = 10

baseDamage = 15
baseKnockback = 16
projectileCount = 1

stats = [
	new weaponStat(enumWeaponStats.damage, id),
	new weaponStat(enumWeaponStats.knockback, id),
	new weaponStat(enumWeaponStats.projectileCount, id),
	new weaponStat(enumWeaponStats.cooldown, id),
	new weaponStat(enumWeaponStats.critDamage, id)
]

///@description					Gets a weapon stat value
///@param {real} _stat			Stat, uses enumWeaponStats
//getWeaponStatValue = function(_stat) {
//	switch (_stat) {
//		case enumWeaponStats.damage:
//			return (baseDamage + bonusDamage) * damageScalar
			
//		case enumWeaponStats.knockback:
//			return (baseKnockback + bonusKnockback) * knockbackScalar
			
//		case enumWeaponStats.projectileCount:
//			return (projectileCount)
			
//		case enumWeaponStats.cooldown:
//			return (maxCd)
//	}		
//}

reverseSwipe = false

owner = obj_player.id // get_player_target()

upgrades = [
	obj_wupg_gen_reinforced,
	obj_wupg_gen_sharpened,
	obj_wupg_gen_hefty,
	obj_wupg_gen_hastened,
	obj_wupg_gen_rapid_swings,

	obj_wupg_wh_lit_crits,
	obj_wupg_wh_extra_push,
	obj_wupg_wh_stunning_blow
]

processUpgrades()

use = function(_attackAngle) {
	var _projectiles = []
	
	for (var i = 0; i < projectileCount + bonusProjectiles; i++) {
		var spawnPoint = get_vec2_from_angle_mag(_attackAngle, spawnDistance)
	
		var _inst = instance_create_depth(
			owner.x + spawnPoint.x,
			owner.y + spawnPoint.y,
			depths.fx,
			spawnObject
		)
	
		_inst.image_angle = owner.attackAngle
		_inst.facingAngle = owner.attackAngle
		_inst.owner = owner
		_inst.spawnDelay = multiProjSpawnDelay * i
	
		if (reverseSwipe) {
			_inst.reverseSwipe = true
		}

		reverseSwipe = !reverseSwipe
	
		//audio_play_sound(snd_woosh, 1, false)
		
		array_push(_projectiles, _inst)
	}
	
	return _projectiles
}
