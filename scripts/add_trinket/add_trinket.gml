///@description							Add a trinket to the caller
///@param {gmasset.Object} _trinket		Trinket to add

function add_trinket(_trinket) {
	var trinket = instance_create_depth(0, 0, 0, _trinket)
	var owner = get_player_target()
	
	array_push(owner.trinkets, trinket)
	
	trinket.onSpawn()
}