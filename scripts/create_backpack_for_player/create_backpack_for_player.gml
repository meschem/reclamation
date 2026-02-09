///@description							Creates a backpack for a player
///@param {id.Instance} _player			Player
///@param {asset.GMObject} _backpack	Backpack type to create for player
///@return {id.Instance}
function create_backpack_for_player(_player = id, _backpack = obj_backpack_standard) {
	var _inst = create_instance(_backpack)
	
	_inst.owner = _player
	_player.backpack = _inst
	
	return _inst
}
