///@description					Init

enum uiFocusTypes {
	none,
	inventory,			// managed via obj_backpack
	skillDetails,		// managed via obj_ability_controller
	statDetails,
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

drawDungeonInfo = true
drawUltimateBar = false
drawStatBars = true
drawCurseBar = true
drawPlayerSkills = true


// OTHER INFO IS DRAWN FROM obj_run_controller

///@description					Sets a ui profile type for visibility
///@param {real} _type			Uses enum uiFocusTypes
setUiFocusType = function(_type) {
	focusType = _type
}

///@description					Sets ui focus type based on movement and current state			
///@param {real} _x				X Coordinate
///@param {real} _y				Y Coordinate
getUiFocusFromDirection = function(_x, _y) {
	//create_toaster($"({_x}, {_y}) with focusType {focusType}")
	// INVENTORY GROUP
	if (focusType == uiFocusTypes.inventory) {
		if (_x == -1) {
			focusType = uiFocusTypes.statDetails
		} else if (_y == 1) {
			focusType = uiFocusTypes.skillDetails
		}
	} else if (focusType == uiFocusTypes.statDetails) {
		if (_x == 1) {
			focusType = uiFocusTypes.inventory
		}
	} else if (focusType == uiFocusTypes.skillDetails) {
		if (_y == -1) {
			focusType = uiFocusTypes.inventory
		}
	}
	
	//create_toaster("Focus type ID changed to: " + string(focusType))
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

