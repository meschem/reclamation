///@description						Gets available weapons for the player. Very temp atm.
///@param {Id.Instance} player		Player to get weapons for
///@return {array<Id.Instance>}
function get_available_weapons(player) {
	
	var _weapons = []
	
	with (player) {
		for (var i = 0; i < array_length(availableWeapons); i++) {
			array_push(_weapons, create_instance(availableWeapons[i]))
		}
	}
	
	return _weapons
}
