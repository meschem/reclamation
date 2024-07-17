///@description							Sets up naming for an elite unit. "name" and "description" props
///@param {id.Instance} _baddie			Baddie to apply elite naming too
///@param {array<id.Instance>} _buffs	Buffs to reference for naming
function apply_elite_name(_baddie, _buffs) {
	var _prefix = [
		"Poxsyll",
		"Mog'goth",
		"Henwix",
		"Argwynn",
		"Alidon",
		"Belpox",
		"Urgnon",
		"Odallix",
		"Malmoth",
		"Maldwynn",
		"Hexoth",
		"Tyranth",
		"Ro'Gosh"
	]
	
	var _randomBuff = array_random(_buffs)
	
	switch (_randomBuff.object_index) {
		case obj_elite_buff_fast:
			var _suffix = [
				"Quick",
				"Aggressive",
				"Haunting"
			]
		break
		
		case obj_elite_buff_tough:
			var _suffix = [
				"Unrelenting",
				"Wall",
				"Mighty"
			]
		break
		
		case obj_elite_buff_spawner:
			var _suffix = [
				"Spawning",
				"Multiplying",
				"Teeming"
			]
		break
		
		case obj_elite_buff_shielding:
			var _suffix = [
				"Shield",
				"Bracing",
				"Protector"
			]
		break
		
		default:
			var _suffix = [
				"Unknown"
			]
		break
	}
	
	_baddie.name = array_random(_prefix) + " the " + array_random(_suffix)
	
	for (var i = 0; i < array_length(_buffs); i++) {
		if (i == 0) {
			_baddie.description = _buffs[i].name
		} else {
			_baddie.description += ", " + _buffs[i].name
		}
	}
}