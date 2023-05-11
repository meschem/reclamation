///@description						Adds an on-hit ability for the player
///@param {id.Instance} ability		Object to reference for ability

function add_on_hit_ability_to_player(ability) {
	with (obj_player) {
		onHitAbilities[array_length(onHitAbilities)] = ability
	}
}