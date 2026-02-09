///@description		Init

// FIXME General: Big offset for initial location
x = -999
y = -999

parentMenu = noone

bgSprite = spr_none
state = buttonStates.normal
index = 0
enabled = true
subTitleEnabled = false
isFocused = false
statTextEnabled = false
topIcon = spr_none
iconOverlay = spr_none

focusOffsetX = 0
focusOffsetY = 0
focusBoostX = 0
focusBoostY = 0

buttonXOffset = 34
buttonYOffset = -13

marginY = 0

age = 0
spawnDelay = 0
spawnDuration = stf(0.3)
spawnOffsetUseY = true		//if false, uses x
drawOffsetY = 0
flashFrame = 0
flashSprite = spr_card_flash_huge

mouseDelayEnable = false

if (mouse_check_button(mb_left)) {
	mouseDelayEnable = true            // If mouse is held when button is spawned, wait until release to allow mouse clicks
}

viewCamera = view_camera[camera_get_active()]

titleBackgroundDraw = false
titleBackgroundWidth = 112
titleBackground = spr_none
titleBackgroundDrawX = 10
titleBackgroundDrawY = 22

titleText = new text(
	"No Title",
	font_pxlxxl_m,
	colors.black,
	new vec2(6, 34),
	true,
	92
)

subTitleText = new text(
	"No Subtitle",
	font_pxlxxl_m,
	colors.black,
	new vec2(6, 46),
	true,
	92
)

bodyText = new text(
	"No body no body no body bn b aiawe fl lorem ipsum statums forgetm",
	font_pxlxxl_s,
	colors.black,
	new vec2(6, 57),
	false,
	92
)

statText = new text(
	"",
	font_pxlxxl_s,
	colors.black,
	new vec2(6, 0),
	false,
	92
)

menuOffset = new vec2(0, 0)

ability = noone
trinket = noone
talent = noone

//statTextList = []

onClick = function() {
	show_message("onClick not set")
}

///@description				Updates stat text
///@param {array<Struct>}
createStatText = function(statTextList) {
	if (array_length(statTextList) == 0) { 
		return 0
	}
	
	statTextEnabled = true

	var txt = ""
		
	for (var i = 0; i < array_length(statTextList); i++) {
		txt += statTextList[i].fullString
		
		if (i != array_length(statTextList) - 1) {
			txt += "\n"
		}
	}
	
	var yOffset = string_height(txt) + 10
	
	statText.location.y = sprite_height - 10 - yOffset
	statText.body = txt
}