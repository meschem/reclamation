///@description				Provides talent selection to player
///@param {id.Instance}		_player

function display_level_up_prompt(_player = noone) {
	if (_player == noone) {
		_player = get_first_player() // get_player_target()
	}
	
	with (obj_game_controller) {
		if (_player.level - 1 >= array_length(levelUpRewardTable)) {
			show_message("Player Level exceeds max length of reward table")
			return 0
		}

		switch (levelUpRewardTable[_player.level - 2]) {
			case levelUpRewards.abilitySelect:
				display_level_abil_select_prompt(_player)
			break
				
			case levelUpRewards.trinket:
				display_level_trinket_prompt(_player)
			break
				
			case levelUpRewards.rune:
				display_level_rune_prompt(_player)
			break
				
			case levelUpRewards.abilityLevelUp:
				display_level_abil_lvlup_prompt(_player)
			break
			
			case levelUpRewards.heroTalent:
				display_level_talent_prompt(_player)
			break
			
			case levelUpRewards.statPoint:
				show_message("stat point prompt goes here")
			break
			
			case levelUpRewards.weaponUpgrade:
				display_weapon_upgrade_prompt(_player)
			break
		}
	}
}