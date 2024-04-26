///@description							Gets the instance of an ability for a player
///@param {id.Instance} _player			Player to find the ability for
///@param {asset.GMObject} _ability		object_index of the ability to find 
///@return {id.Instance}
function get_ability_instance(_player, _ability) {
	with (_ability) {
		if (owner == _player) {
			return id
		}
	}
	
	show_debug_message("get_ability_instanced failed for: " + object_get_name(_ability))
	
	return noone
}
