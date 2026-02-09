///@description						Returns true if the instance is a player
///@param {id.Instance} _instance
///@return {bool}
function is_player_instance(_instance) {
	return (object_is_ancestor(_instance.object_index, obj_player))
}
