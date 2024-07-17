///@description				Init

event_inherited()

name = "Great Maul"
description = "Big swings in wide arcs. Every third target in a single swing is hit with critical damage."
icon = sprite_index
iconIndex = 0

spawnDistance = 32
spawnObject = obj_greataxe_swipe
maxCd = 72

baseDamage = 15
baseKnockback = 16
projectileCount = 1

stats = [
	new weaponStat(enumWeaponStats.damage, id),
	new weaponStat(enumWeaponStats.knockback, id),
	new weaponStat(enumWeaponStats.projectileCount, id),
	new weaponStat(enumWeaponStats.cooldown, id)
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

owner = get_player_target()

upgrades = [
	obj_wupg_gen_damage,
	obj_wupg_gen_knockback,
	obj_wupg_gen_weapon_size,

	obj_wupg_wh_lit_crits,
	obj_wupg_wh_extra_push,
	obj_wupg_wh_stunning_blow
]

processUpgrades()

use = function(_attackAngle) {
	var spawnPoint = get_vec2_from_angle_mag(_attackAngle, spawnDistance)
	
	var inst = instance_create_depth(
		owner.x + spawnPoint.x,
		owner.y + spawnPoint.y,
		depths.fx,
		spawnObject
	)
	
	inst.image_angle = owner.attackAngle
	inst.facingAngle = owner.attackAngle
	inst.owner = owner
	
	if (reverseSwipe) {
		inst.reverseSwipe = true
	}

	reverseSwipe = !reverseSwipe
	
	audio_play_sound(snd_woosh, 1, false)
	
	return [inst]
}
