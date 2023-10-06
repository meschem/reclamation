// FIXME General: Big offset for initial location
x = -999
y = -999

parentMenu = noone

state = buttonStates.normal
index = 0
enabled = true
subTitleEnabled = false
isFocused = false

if (mouse_check_button(mb_left)) {
	enabled = false
}

viewCamera = view_camera[camera_get_active()]

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

menuOffset = new vec2(0, 0)

ability = noone
trinket = noone
talent = noone

onClick = function() {
	show_message("onClick not set")
}
