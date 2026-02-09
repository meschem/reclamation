///@description						Adds an on-hit ability for the owner. Works with any object, uses activateOnHit()
///@param {id.Instance} _inst		Object to reference for ability
function add_on_hit_ability_to_player(_inst) {
	with (obj_player) {
		array_push(onHitAbilities, _inst)
		//onHitAbilities[array_length(onHitAbilities)] = _inst
	}
}


///@description						Removes on-hit ability for the owner.
///@param {id.Instance} _inst		Object to reference for ability
function remove_on_hit_ability_from_player(_inst) {
	with (obj_player) {
		for (var i = 0; i < array_length(onHitAbilities); i++) {
			if (onHitAbilities[i] == _inst) {
				array_delete(onHitAbilities, i, 1)
				break
			}
		}
	}
}
