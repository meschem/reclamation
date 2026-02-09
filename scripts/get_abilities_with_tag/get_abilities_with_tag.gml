///@description				Gets all abilities with a specified tag
///@param {real} tag
///@return {array<Id.Instance>}
function get_abilities_with_tag(tag) {
	var matches = []
	var abilCount = instance_number(obj_ability)
	var ability
	
	for (var i = 0; i < abilCount; i++) {
		ability = instance_find(obj_ability, i)
		
		if (array_contains(ability.tags, tag)) {
			array_push(matches, ability)
		}
	}
	
	return matches
}