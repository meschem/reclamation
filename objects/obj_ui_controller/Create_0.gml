///@description					Init

enum uiFocusTypes {
	none,
	inventory,
	menu,
	shop
}

enum uiProfileTypes {
	gameplay,
	backpack,
	shop,
	minimal,
}

focusType = uiFocusTypes.none
uiProfileType = uiProfileTypes.gameplay

xpRatio = 0
playerHealthPerPip = 10
drawFps = 0
age = 0

skipPlayerUi = false

cameraViewHeight = 1000
cameraViewWidth = 1000

ultimateFillPercent = 0
ultimateBarWidth = 100
ultimateBarHeight = 10

drawDungeonInfo = true

drawUltimateBar = false
drawStatBars = true
drawCurseBar = true
drawPlayerSkills = true

healthPips = []
healthCurrent = 0
healthUpdateRate = 4
healthUpdateCd = 0
healthPerIcon = 10
healthPlayer = noone

// OTHER INFO IS DRAWN FROM obj_run_controller

///@description					Sets a ui profile type for visibility
///@param {real} _type			Uses enum uiFocusTypes
setUiFocusType = function(_type) {
	focusType = _type
}

///@description					Sets a ui profile type for visibility
///@param {real} _type			Uses enum uiProfileTypes
setUiProfileType = function(_type) {
	switch (_type) {
		case uiProfileTypes.gameplay:
			drawStatBars = true
			drawUltimateBar = true
			drawCurseBar = true
			drawPlayerSkills = true
		break
		
		case uiProfileTypes.backpack:
			drawStatBars = true
			drawUltimateBar = true
			drawCurseBar = true
			drawPlayerSkills = false
		break
		
		case uiProfileTypes.shop:
			drawStatBars = false
			drawUltimateBar = false
			drawCurseBar = false
			drawPlayerSkills = false
		break
		
		case uiProfileTypes.minimal:
			drawStatBars = false
			drawUltimateBar = false
			drawCurseBar = false
			drawPlayerSkills = false
		break
	}
}