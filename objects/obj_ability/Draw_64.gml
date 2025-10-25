if (!drawGui) {
	return
}

if (enabled) {
	draw_sprite(iconUiBackdrop, 0, iconX, iconY)
	draw_sprite(iconUiBorder, iconColor, iconX + 1, iconY + 1)
	draw_sprite(icon, 0, iconX + 3, iconY + 3)
	draw_sprite_bottom_n(iconUiFill, iconColor, iconX + 1, iconY + 1, iconCdFillRatio * iconFillHeight)
	
	//draw_set_font(font_pxlxxl_m)

	var _yOffset = 32
	var _xOffset = 16
	
	if (active) {
		// Draw Cooldown or Hotkey		
		if (curCd > 0 && curCharges <= 0) {
			
		} else if (ultimate && !owner.canUseUltimate()) {
			
		} else {
			if (owner.inputFocus == enumInputTypes.keyboardMouse) {
				//draw_set_color(c_black)
				//draw_text(iconX + 9, iconY + yOffset + 1, hotkey)
				
				//draw_set_color(c_white)
				//draw_text(iconX + 8, iconY + yOffset, hotkey)
				draw_sprite(kbIcon, 0, iconX + _xOffset, iconY + _yOffset) 
			} else {
				draw_sprite(controllerIcon, 0, iconX + 14, iconY + _yOffset) 
			}			
		}
		
		// Draw Charges
		//if (maxCharges > 1 && curCharges > 0) {
		//	draw_set_color(c_white)
		//	draw_text(iconX + 16, iconY + yOffset + 1, "x" + string(curCharges))
		//}
	}	
}
