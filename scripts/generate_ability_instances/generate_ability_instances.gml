///@description			Should be run after player object is created to create
///						all necessary instances

function generate_ability_instances() {
	var tree

	with (obj_player) {
		for (var i = 0; i < array_length(abilityTrees); i++) {
			tree = create_instance(abilityTrees[0])
			
			for (var j = 0; j < array_length(tree.abilities); j++) {
				//create_instance(tree.abilities[j])
			}
		}
	}
}