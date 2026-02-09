///@description   Processes a player death

function player_death() {
	var menu = create_menu("You Died")
	
	var restartButton = create_button("Restart", buttonOnClickBehaviors.restartGame)
	add_button_to_menu(menu, restartButton)
	
	var quitButton = create_button("Quit", buttonOnClickBehaviors.quitGame)
	add_button_to_menu(menu, quitButton)
	
	menu.display = true
}
