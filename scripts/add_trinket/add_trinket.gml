///@description							Add a trinket to the caller
///@param {asset.GMObject} _trinket		Trinket to add

function add_trinket(_trinket, _owner = noone) {
	var _inst = instance_create_depth(0, 0, 0, _trinket)
	//var _owner = get_player_target()
	
	array_push(_owner.trinkets, _inst)
	
	_inst.onSpawn()
}