
if (game_is_paused()) {
	return 0
}

age++

beginStep()

depth = depths.player - y

if (!poiAdded) {
    if (
    	obj_player.x > x - 800 &&
    	obj_player.x < x + 800 &&
    	obj_player.y > y - 600 &&
    	obj_player.y < y + 600
    ) {
    	add_map_poi(id, mapIcon)
    }
}

if (
	obj_player.x > x + activationArea.x1 &&
	obj_player.x < x + activationArea.x2 &&
	obj_player.y > y + activationArea.y1 &&
	obj_player.y < y + activationArea.y2 
) {
    playerInActiveRange = true
	charge++
} else {
    playerInActiveRange = false
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

if (
    pressToActivate &&
    playerInActiveRange && 
    keyboard_check_pressed(ord("G"))
) {
    activate()
} else if (charge >= chargeMax) {
	activate()
}
