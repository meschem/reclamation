// Inherit the parent event
event_inherited();

displayText = "Cancel"

onClick = buttonOnClickBehaviors.custom

fontType = font_aseprite
buttonHeight = 22
paddingY = 2
offsetY = 0

onClickCustom = function() {
	menu.close()
}
