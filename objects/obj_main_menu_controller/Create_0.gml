
enum mainMenuStates {
	title,
	menu,
}

create_instance(obj_profile_controller)

state = mainMenuStates.title

ctaText = "Press Enter"
ctaFont = font_alagard
ctaColor = c_white
ctaRate = stf(1)
ctaDelay = 0
ctaDraw = true

draw_set_font(font_alagard)
ctaY = 290
ctaX = 320 - (string_width(ctaText) / 2)