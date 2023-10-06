
if (enabled) {
	draw_sprite(spr_ability_icon_backing, 0, iconX, iconY)
	draw_sprite(icon, 0, iconX, iconY)
	draw_set_font(font_pxlxxl_m)

	var yOffset = 25
	
	var ascii = obj_player.kmInput.useAbility[treeLevel]
	
	if (active) {
		switch (ascii) {
			case 69: 
				hotkey = "Q"
				controllerIcon = spr_btn_xbox_rt
			break
			
			case 82: 
				hotkey = "E"
				controllerIcon = spr_btn_xbox_lt
			break
			
			case 84: 
				hotkey = "R"
				controllerIcon = spr_btn_xbox_rb
			break

			default: 
				hotkey = string(ascii)
			break
		}

		// Draw Cooldown or Hotkey		
		if (curCd > 0 && curCharges <= 0) {
			var drawString = max(ceil(curCd / 60), 0)
	
			draw_set_color(c_black)
			draw_text(iconX + 6, iconY + yOffset + 1, drawString)
	
			draw_set_color(c_orange)
			draw_text(iconX + 5, iconY + yOffset, drawString)
		} else {
			if (owner.inputFocus == enumInputTypes.keyboardMouse) {
				draw_set_color(c_black)
				draw_text(iconX + 9, iconY + yOffset + 1, hotkey)
				
				draw_set_color(c_white)
				draw_text(iconX + 8, iconY + yOffset, hotkey)
			} else {
				draw_sprite(controllerIcon, 0, iconX + 14, iconY + yOffset + 2) 
			}			
		}
		
		// Draw Charges
		if (maxCharges > 1 && curCharges > 0) {
			draw_set_color(c_white)
			draw_text(iconX + 16, iconY + yOffset + 1, "x" + string(curCharges))
		}
	}	
}
