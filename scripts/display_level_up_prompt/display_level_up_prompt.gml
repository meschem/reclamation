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
        
        audio_play_sound(snd_level_up_musical, 0, false)

		switch (levelUpRewardTable[_player.level - 2]) {
			case levelUpRewards.abilitySelect:
				var _success = display_level_abil_select_new_prompt(_player)
				
				if (!_success) {
					create_toaster("No abilities found for level up", errorLevels.error)
				}
			break
			
			case levelUpRewards.ultimateSelect:
                // NOT USED
				display_level_abil_select_ultimate(_player)
			break
				
			case levelUpRewards.trinket:
                // NOT USED
				display_level_trinket_prompt(_player)
			break
			
			case levelUpRewards.merger:
				display_level_merger_prompt(_player)
			break
				
			case levelUpRewards.rune:
                // NOT USED
				display_level_rune_prompt(_player)
			break
				
			case levelUpRewards.abilityLevelUp:
                // NOT USED
				display_level_abil_lvlup_prompt(_player)
			break
			
			case levelUpRewards.heroTalent:
                // NOT USED
				display_level_talent_prompt(_player)
			break
			
			case levelUpRewards.statPoint:
				display_level_stat_point_prompt(_player)
			break
			
			case levelUpRewards.weaponUpgrade:
                // NOT USED
				display_weapon_upgrade_prompt(_player)
			break
		}
	}
}