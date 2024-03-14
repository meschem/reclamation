
function display_weapon_upgrade_prompt() {
	set_game_pause_state(true)
	
	var _player = get_player_target()
	var _weapon = _player.equipment.weapon
	
	if (_weapon == noone) {
		create_toaster("Weapon not equipped", errorLevels.error)
		set_game_pause_state(false)

		return
	}
	
	var _type = _weapon.upgradePath[_weapon.level - 1]
	var _menu = instance_create_depth(0, 0, depths.ui, obj_ability_selection_menu_wide)
	var _upgrades = get_available_weapon_upgrades(_player, _type)
	
	_weapon.createUpgradeBar(_menu)
	
	var count = min(array_length(_upgrades), 3)
	
	for (var i = 0; i < count; i++) {
		create_select_wupg_button(_upgrades[i], _menu)
	}
}
