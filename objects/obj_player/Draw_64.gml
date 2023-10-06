
if (inputFocus == enumInputTypes.controller) {
	draw_sprite_ext(
		spr_controller_aiming,
		0,
		uiDrawOffset.x + controllerAimingCursorPos.x,
		uiDrawOffset.y + controllerAimingCursorPos.y,
		1, 1,
		attackAngle,
		c_white,
		1
	)
}