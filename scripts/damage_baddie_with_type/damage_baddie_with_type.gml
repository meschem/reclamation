///@description						Deals damage to an enemy
///@param {Id.Instance}	_target		Target instance to deal dmg to
///@param {real} _amount			Amount of damage
///@param {real} _damageType		Type of damage dealt. Uses enumDamageType
///@param {Id.Instance} _attacker	Instance dealing damage to get stats from
///@param {bool} _isCrit			If damage is critical (for visuals)
///@param {real} _critMultiplier	Base crit multiplier from damage source
///@param {real} _force				Amount of force applied for knocking units around
///@return {bool}					Returns whether or not the target is killed

function damage_baddie_with_type(_target, _amount, _damageType, _attacker = noone, _isCrit = false, _critMultiplier = 2, _force = 1) {
	if (_attacker == noone) {
		_attacker = get_first_player()
	}

	if (
		_damageType == enumDamageTypes.normal ||
		_damageType == enumDamageTypes.piercing ||
		_damageType == enumDamageTypes.heavy
	) {
		_amount *= get_player_stat(enumPlayerStats.damageScalar)
	} else if (
		_damageType == enumDamageTypes.fire ||
		_damageType == enumDamageTypes.cold ||
		_damageType == enumDamageTypes.lightning
	) {
		_amount *= get_player_stat(enumPlayerStats.abilityDamageScalar)
	}	
	
	if (_target.debuffShockAmount > 0) {
		_critMultiplier += 1
	}
		
	if (_isCrit) {
		_amount *= _critMultiplier
	}
	
	_target.hp -= _amount
		
	with (obj_run_stats_controller) {
		var _name = object_get_name(other.object_index)
		
		if (variable_struct_exists(damageStats, _name)) {
			var _curAmount = struct_get(damageStats, _name)
			var _newAmount = _curAmount + _amount
			struct_set(damageStats, _name, _newAmount)
		} else {
			struct_set(damageStats, _name,  _amount)
		}
	}
	
	// If show dmg numbers is on
	if (true) {
		var displayAmount = round(_amount * 10)
		var damageStyle = damageTextStyles.normal
		
		if (_isCrit) {
			damageStyle = damageTextStyles.crit
		} else {
			switch (_damageType) {
				case enumDamageTypes.normal:
				case enumDamageTypes.piercing:
				case enumDamageTypes.heavy:
					damageStyle = damageTextStyles.normal
				break
				
				case enumDamageTypes.poison:
					damageStyle = damageTextStyles.poison
				break
				
				case enumDamageTypes.lightning:
					damageStyle = damageTextStyles.lightning
				break
				
				case enumDamageTypes.cold:
					damageStyle = damageTextStyles.cold
				break
				
				case enumDamageTypes.fire:
					damageStyle = damageTextStyles.fire
				break
			}
		}
		
		create_damage_text(_target.x, _target.y - 25, _amount, damageStyle)
	}

	if (_target.hp <= 0) {
		_target.lastDamageForce = _force
		_target.lastDamageAngle = point_direction(_attacker.x, _attacker.y, _target.x, _target.y)
		return true
	}
	
	_target.markedForCrit = false
	_target.damagedOn = _target.age
	_target.onDamaged()
	
	return false
}
