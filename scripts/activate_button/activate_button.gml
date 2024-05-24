///@description						Activates a button
///@param {id.Instance}	button		Button to activate

function activate_button(_button = id) {
	switch (_button.onClick) {
		 case buttonOnClickBehaviors.addTalent:
			add_talent(_button.talentToAdd)
			close_talent_menu()
			set_game_pause_state(false)
			check_for_level_up()
		 break
		 
		 case buttonOnClickBehaviors.restartGame:
			restart_run()
		 break
		 
		 case buttonOnClickBehaviors.quitGame:
			game_end()
		 break
		 
		 case buttonOnClickBehaviors.addAbility:
			
		 break
		 
		 case buttonOnClickBehaviors.custom:
			_button.onClickCustom()
		 break
	}
}
