// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function display_level_talent_prompt() {
	var availableTalentIndexes = get_available_talents()
	var shuffledTalents = array_shuffle(availableTalentIndexes)
	var selectionSize = min(array_length(shuffledTalents), 3)
	var menu = create_menu("Level Up!")	
	var button, displayText, talentIndex

	menu.menuWidth = menuWidths.talents
	
	set_game_pause_state(true)
	
	for (var i = 0; i < selectionSize; i++) {
		talentIndex = shuffledTalents[i]
		displayText = obj_game_controller.talents[talentIndex][talentProps.name]
		
		button = create_button(displayText)
		button.onClick = buttonOnClickBehaviors.addTalent
		button.talentToAdd = talentIndex

		add_button_to_menu(menu, button)
	}
	
	menu.display = true
}
