///@description									Creates instances for a list of objects and returns 
///												their id's in an array
///
///@param {array<asset.GMObject>} abilities		Array of ability objects
///@return {array<id.Instance>}

function create_ability_list(abilities) {
	var ability, instance
	var instances = []
	
	for (var i = 0; i < array_length(abilities); i++) {
		ability = abilities[i]
		
		if (instance_number(ability) == 0) {
			instance = create_instance(ability)
			
			instance.treeLevel = i + 1
			
			array_push(instances, instance)
		} else {
			instance = instance_find(ability, 0)
			
			array_push(instances, instance)
		}
	}
	
	return instances
}