/// @description	Description
/// @param {real}	ability

function activate_ability(ability) {
	if (ability == -1) {
		show_debug_message("ability Q not set")
	}
	
	switch (ability) {
		case playerAbilities.warStomp:
			activate_war_stomp(1)
			break
			
		case playerAbilities.charge:
			activate_charge(1)
			break
	}
}
