
focused = false
selector = noone
selectedIndex = 0
abilities = []
selectedAbility = noone
infobox = noone
owner = noone

onFocus = function() {
	focused = true
	
	owner = get_first_player() // FIXME: Multiplayer
	
	selector = instance_create_depth(-99, -99, depths.ui, obj_ability_selector)
	infobox = instance_create_depth(-99, -99, depths.ui, obj_ability_infobox)
	abilities = owner.abilities
	
	if (array_length(abilities) == 0) {
		create_toaster("No abilities found on skill UI focus", errorLevels.warning)
		
		return 0
	}
	
	array_sort(abilities, sort_by_icon_x)
	
	selectedIndex = 0
	selectedAbility = abilities[selectedIndex]

	infobox.updateAbility(selectedAbility)
	infobox.show()
	
	selector.sprite_index = selectedAbility.ultimate ? spr_ability_slot_highlight_lg : spr_ability_slot_highlight
}

onEndFocus = function() {
	focused = false
	
	if (instance_exists(selector)) {
		instance_destroy(selector)
	}
	
	if (instance_exists(infobox)) {
		instance_destroy(infobox)
	}
	
	selector = noone
	
	abilities = []
}