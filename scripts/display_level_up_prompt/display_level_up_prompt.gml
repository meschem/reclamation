///@description		Provides talent selection to player

function display_level_up_prompt() {
	with (obj_game_controller) {
		show_debug_message("plvl = " + string(playerLevel))
		
		if (playerLevel - 1 >= array_length(levelUpRewardTable)) {
			show_debug_message("Player Level exceeds max length of reward table")
			return 0
		}

		switch (levelUpRewardTable[playerLevel - 2]) {
			case levelUpRewards.abilitySelect:
				display_level_abil_select_prompt()
				break
			
			case levelUpRewards.heroTalent:
				display_level_talent_prompt()
				break
			
			case levelUpRewards.statPoint:
				show_message("stat point prompt goes here")
				break
			
			case levelUpRewards.weaponUpgrade:
				show_message("weapon upgrade prompt goes here")
				break
		}
	}
}