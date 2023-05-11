///@description   Description
function activate_player_on_hit_abilities() {
	with (obj_player) {
		for (var i = 0; i < array_length(onHitAbilities); i++) {
			onHitAbilities[i].activate()
		}
	}
}