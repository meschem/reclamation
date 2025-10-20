///@description		Init
event_inherited()

name = "Golden Puzzlebox"
description = "Damages random enemy upon picking up gold. Coin stacks deal critical damage."

maxTargetDistance = 800		//search radius for targets on pickup
launchSpeed = 5
damageDirect = 20
projectile = obj_golden_bolt
statsSpecial = ["Fires damaging projectiles on coin pickups. Each deal 20 damage."]

///@description							Uses Puzzlebox
///@param {id.Instance} _pickup			Instance picked up
onPickup = function(_pickup) {
	if (!object_is_ancestor(_pickup.object_index, obj_coin)) {
		return 0
	}
		
	var _seekTarget = noone 
	var _count = 1
	
	if (_pickup.pickupValue > 100) {
		_count = 5
	} else if (_pickup.pickupValue > 50) {
		_count = 4
	} else if (_pickup.pickupValue > 25) {
		_count = 3
	} else if (_pickup.pickupValue > 10) {
		_count = 2
	}
	
	var _spread = (_count - 1) * 20
	var _angle = 180 + (_spread / 2)
	var _launchAngle = 0
	
	for (var i = 0; i < _count; i++) {
		_seekTarget = get_random_baddie_in_area(maxTargetDistance, owner.x, owner.y)
		
		if (_seekTarget == noone) {
			break
		}
		
		_launchAngle = point_direction(_pickup.x, _pickup.y, _seekTarget.x, _seekTarget.y) + _angle
		_angle -= (_spread / _count)
		
		launch(_seekTarget, _launchAngle)
	}
}

///@description							Launches golden bolt
///@param {id.Instance} _seekTarget
///@param {real} _launchAngle
launch = function(_seekTarget, _launchAngle) {
	var _proj = launch_projectile(projectile, _launchAngle, launchSpeed, owner)
	
	_proj.seekTarget = _seekTarget
	_proj.damageDirect = damageDirect
	//_proj.damageDirect *= owner.bonusDamageScalar
	
	//if (_proj.object_index == obj_coin_stack) {
	//	_proj.critChance = 1
	//}
}