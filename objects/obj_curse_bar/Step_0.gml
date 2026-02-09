
fillDrawHeight = floor(sprite_height * (obj_run_controller.curseAge / obj_run_controller.curseAgeFinal))

skullFullCount = floor(ftm(obj_run_controller.curseAge))

skipDraw = !obj_ui_controller.drawCurseBar

if (showTimeDisplay) {
	with (obj_room_controller) {
		other.timeDisplay = get_time_from_age(age)
	}
}
