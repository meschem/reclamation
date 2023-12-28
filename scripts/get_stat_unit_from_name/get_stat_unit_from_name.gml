///@description				Attempts to get a stat unit from a name
///@param {string} _name	Display name of unit
///@return {struct.statUnit}
function get_stat_unit_from_name(_name) {
	var _enum, _statUnit
	
	_name = string_lower(_name)
	
	switch (_name) {
		case "radius": 
			_enum = statUnits.meters
		break
		
		case "move speed":
			_enum = statUnits.moveSpeed
		break
			
		case "stun length":
			_enum = statUnits.seconds
		break
			
		case "attack speed":
		case "pickup radius":
		case "pickup reward":
		case "crit multiplier":
		case "weapon aoe":
		case "ability cooldown":
			_enum = statUnits.percent
		break
		
		case "cooldown":
			_enum = statUnits.frames
		break
			
		default: 
			_enum = statUnits.none
		break
	}
	
	_statUnit = get_stat_unit_from_enum(_enum)
	
	return _statUnit
}
