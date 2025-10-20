///@description						Returns mergers thare valid for a level up selection
///@param {id.Instance} _player		Player to check for 
///@param {real} _count
///@return {array<id.Instance>}

// FIXME General: Assumes trinkets are singleton objects
// FIXME Multiplier: Assumes single obj_player

function get_available_mergers(_player = noone, _count = 3) {
	if (_player == noone) {
		_player = get_first_player()
	}
	
	var _mf = get_player_stat(enumPlayerStats.magicFind, _player)
	var _mergers = obj_merger_item_controller.createItems(_count, _mf)

	// Get OWNED trinkets
	//with (obj_trinket) {		
	//	if (owner == player && level < maxLevel) {
	//		array_push(availableTrinkets, id)
	//	}
	//}
	
	return _mergers
}