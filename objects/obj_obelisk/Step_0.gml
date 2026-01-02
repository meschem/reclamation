
if (game_is_paused()) {
	return 0
}

age++

depth = depths.player - y

if (
	obj_player.x > x + activationArea.x1 &&
	obj_player.x < x + activationArea.x2 &&
	obj_player.y > y + activationArea.y1 &&
	obj_player.y < y + activationArea.y2 
) {
	charge++
} else {
	charge = charge - max(0, charge)
}

if (floats) {
	set_float_range()
}

drawUiLoc = get_ui_pos(id)
drawUiLoc.y -= 40
drawUiLoc.x -= 15
//drawString = $"{charge} / {chargeMax}"

chargeBarInfo.xPos = round((x - camera_get_view_x(view_camera[0])) - (sprite_width / 2))
chargeBarInfo.yPos = round((y - camera_get_view_y(view_camera[0])) - (sprite_height / 2) + chargeBarInfo.yOffset)

if (charge >= chargeMax) {
	activate()
}
