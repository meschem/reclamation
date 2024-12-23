///@description		Init
event_inherited()

name = "Golden Puzzlebox"
description = "Damages random enemy upon picking up gold. Coin stacks deal critical damage."
maxLevel = 5
maxTargetDistance = 800		//search radius for targets on pickup

launchSpeed = 5
damageDirect = [10, 15, 20, 25, 30]
coinCount = [1, 1, 1, 1, 2]

stats = [
	new itemStat(enumItemStats.custom, coinCount, true, {
		displayName: "Projectiles",
		unitEnum: statUnits.none,
		prepend: false
	}),
	new itemStat(enumItemStats.custom, damageDirect, true, {
		displayName: "Damage",
		unitEnum: statUnits.none,
		prepend: false
	}),
	
]

///@description							Uses Puzzlebox
///@param {id.Instance} _coin			Instance picked up
use = function(_coin) {
	var _seekTarget = get_random_baddie_in_area(maxTargetDistance, owner.x, owner.y)
	var _proj
	
	if (_seekTarget == noone) {
		return 0
	}
	
	var _launchAngle = point_direction(_coin.x, _coin.y, _seekTarget.x, _seekTarget.y) + 180
	
	if (level != maxLevel) {
		launch(_seekTarget, _launchAngle)
	} else {
		launch(_seekTarget, _launchAngle + 15)
		
		_seekTarget = get_random_baddie_in_area(maxTargetDistance, owner.x, owner.y)
		launch(_seekTarget, _launchAngle - 15)
	}
	
}

///@description							Launches golden bolt
///@param {id.Instance} _seekTarget
///@param {real} _launchAngle
launch = function(_seekTarget, _launchAngle) {
	var _proj = launch_projectile(obj_golden_bolt, _launchAngle, launchSpeed, owner)
	
	_proj.seekTarget = _seekTarget
	_proj.damageDirect = damageDirect[level - 1]
	_proj.damageDirect *= owner.bonusDamageScalar
	
	if (_proj.object_index == obj_coin_stack) {
		_proj.critChance = 1
	}
}