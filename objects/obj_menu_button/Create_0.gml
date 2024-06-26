/// @description Init

enum menuButtonTypes {
	basic,				// text with onClick effect
	data				// displays data
}

display = true
displayText = "Undefined"
endText = ""

buttonWidth = 120
buttonHeight = 32
clickedOn = -999

fitWidthToMenu = true

centeredY = true
centeredX = true

paddingY = 7
paddingX = 10

marginY = 0
marginX = 0

offsetY = 0
offsetX = 0

enabled = true
menu = -1

state = buttonStates.normal

onClick = buttonOnClickBehaviors.addTalent
talentToAdd = 0

onClickCustom = function() {}

closeParentMenu = function() {
	if (menu != -1) {
		menu.close()
	}
}
