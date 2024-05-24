// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enums_button_states(){
	enum buttonStyles {
		orange
	}
	
	enum buttonOnClickBehaviors {
		none,
		changeRoom,
		loadSubMenu,
		addTalent,
		quitGame,
		restartGame,
		addAbility,
		closeMenu,
		custom
	}
	
	enum buttonStates {
		normal,
		selected,
		clicked,
		disabled
	}
}