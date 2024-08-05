///@description						Returns all available trinkets that could be acquired or leveled up
///@param {id.Instance} player		Player to check for 
///@return {array<id.Instance>}

// FIXME General: Assumes trinkets are singleton objects
// FIXME Multiplier: Assumes single obj_player

function get_available_trinkets(player = noone) {
	var availableTrinkets = []
	
	if (player == noone) {
		player = get_first_player()
	}
	
	var validTrinkets = obj_trinket_controller.validTrinkets

	// Get UN-OWNED trinkets
	if (array_length(player.trinkets) < player.maxTrinkets) {
		for (var i = 0; i < array_length(validTrinkets); i++) {
			if (!player_has_trinket(validTrinkets[i].object_index, player)) {
				array_push(availableTrinkets, validTrinkets[i])
			}
		}
	}

	// Get OWNED trinkets
	with (obj_trinket) {		
		if (owner == player && level < maxLevel) {
			array_push(availableTrinkets, id)
		}
	}
	
	return availableTrinkets
}