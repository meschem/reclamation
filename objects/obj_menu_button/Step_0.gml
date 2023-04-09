
image_index = state

offsetY = (state == buttonStates.clicked) ? 2 : 0

switch (onClick) {
	case buttonOnClickBehaviors.addTalent:
		var curLevel, maxLevel

		curLevel = obj_game_controller.talents[talentToAdd][talentProps.curLevel] + 1
		maxLevel = obj_game_controller.talents[talentToAdd][talentProps.maxLevel]
	
		endText = string(curLevel) + " / " + string(maxLevel)
	break
	
	case buttonOnClickBehaviors.restartGame:
		//restart_run()
	break
	
	case buttonOnClickBehaviors.quitGame:
		//quit_game()
	break		
}

