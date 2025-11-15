// Inherit the parent event
event_inherited()

displayText = "Confirm Destruction"

onClick = buttonOnClickBehaviors.custom

fontType = font_aseprite
buttonHeight = 22
paddingY = 2
offsetY = 0

onClickCustom = function() {
	var _index = menu.destroySlotIndex
	var _owner = menu.backpackOwner
	
	with (obj_backpack) {
		if (owner == _owner) {
			destroyItem(_index)
		}
	}
	
	menu.close()
}
