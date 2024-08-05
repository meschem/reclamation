///@description							Checks if a player has a trinket of a certain type
///@param {asset.GMObject} trinket		Trinket to check for
///@param {id.Instance} player			Player to check for. Defauls to get_player_target()
///@return {id.Instance}				Instance of the requested Trinket

function get_player_trinket(trinket, player = noone) {
	if (player == noone) {
		player = obj_player
	}
	
	for (var i = 0; i < array_length(player.trinkets); i++) {
		if (player.trinkets[i].object_index == trinket) {
			return player.trinkets[i]
		}
	}
	
	return noone
}