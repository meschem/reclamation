///@description   Description
function get_abilities_for_lvlup(_player) {
	var abilities = []
	
	for (var i = 0; i < instance_number(obj_ability); i++) {
		var ability = instance_find(obj_ability, i)
		
		if (ability.level != 0 && ability.level < ability.maxLevel) {
			array_push(abilities, ability)
		}
	}
	
	return abilities
}