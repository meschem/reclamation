///@description		Provides talent selection to player
///@param {id.Instance} player

function display_level_up_prompt(player = noone) {
	if (player == noone) {
		player = get_player_target()
	}
	
	with (obj_game_controller) {
		if (player.level - 1 >= array_length(levelUpRewardTable)) {
			show_message("Player Level exceeds max length of reward table")
			return 0
		}

		switch (levelUpRewardTable[player.level - 2]) {
			case levelUpRewards.abilitySelect:
				display_level_abil_select_prompt()
			break
				
			case levelUpRewards.trinket:
				display_level_trinket_prompt()
			break
				
			case levelUpRewards.rune:
				display_level_rune_prompt()
			break
				
			case levelUpRewards.abilityLevelUp:
				display_level_abil_lvlup_prompt()
			break
			
			case levelUpRewards.heroTalent:
				display_level_talent_prompt()
			break
			
			case levelUpRewards.statPoint:
				show_message("stat point prompt goes here")
			break
			
			case levelUpRewards.weaponUpgrade:
				display_weapon_upgrade_prompt()
			break
		}
	}
}