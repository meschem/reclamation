
function display_weapon_upgrade_prompt() {
	set_game_pause_state(true)
	
	var menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu)
	var upgrades = get_available_weapon_upgrades()
	
	var count = min(array_length(upgrades), 3)
	
	for (var i = 0; i < count; i++) {
		create_select_wupg_button(upgrades[i], menu)
	}
}
