///@description   Description
///@return {array}
function get_available_runes() {
	var allRunes = []
	var runes = []
	
	for (var i = 0; i < instance_number(obj_ability); i++) {
		var ability = instance_find(obj_ability, i)
		
		if (ability.level > 0) {
			runes = array_concat(runes, ability.getAvailableRunes())
		}
	}
	
	return runes
}