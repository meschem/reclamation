///@description						Returns all available trinkets that could be acquired or leveled up
///@param {id.Instance} player		Player to check for 
///@return {array<id.Instance>}

// FIXME General: Assumes trinkets are singleton objects
// FIXME Multiplier: Assumes single obj_player

function get_available_weapon_upgrades(player = noone) {
	var availableUpgrades = []
	
	if (player == noone) {
		player = get_player_target()
	}
	
	with (obj_weapon_upgrade) {
		if (!false) {
			array_push(availableUpgrades, id)
		}
	}
	
	return availableUpgrades
}