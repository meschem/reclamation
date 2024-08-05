///@description   Description
function activate_player_on_hit_abilities(_player = noone, _hitBy = noone) {
	if (_player == noone) {
		_player = obj_player
	}
	
	with (_player) {
		for (var i = 0; i < array_length(onHitAbilities); i++) {
			onHitAbilities[i].activateOnHit(_hitBy)
		}
	}
}
