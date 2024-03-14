
function display_weapon_select_prompt() {
	set_game_pause_state(true)
	var player = get_player_target()
	
	var _menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
	var _weapons = get_available_weapons(player)

	for (var i = 0; i < array_length(_weapons); i++) {
		create_weapon_select_button(_weapons[i], _menu)
	}
}
