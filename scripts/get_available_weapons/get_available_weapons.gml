///@description				Gets available weapons for the player. Very temp atm.
///@return {array<Id.Instance>}
function get_available_weapons() {
	var _weapons = [
		create_instance(obj_weapon_greataxe),
		create_instance(obj_weapon_war_hammer),
		create_instance(obj_weapon_throwng_knives)
	]
	
	return _weapons
}
