
// Inherit the parent event
event_inherited()

// large button setup
width = 154
height = 266
paddingX = 14
paddingY = 24
statSpacing = 14
maxTextWidth = width - (paddingX * 2)
owner = get_first_player()

generalFont = font_pixelmix_s // font_dogica_s
titleFont = font_pixellari
titleTextColor = c_white
titleTextShadowColor = global.colorDarkPurple

subTitleFont = font_pixellari
subTitleTextColor = global.colorOrange

bodyFont = font_pixelmix_s
bodyTextColor = c_white

statTextHighlightColor = global.colorDarkGreen

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	ability.levelUp()
    
    audio_play_sound(snd_casino_selection, 0, false)
    
    var _flourish = instance_create_depth(x + 2, y + 2, depth - 1, obj_card_flash_close_huge)
    _flourish.parentMenu = parentMenu

	close_ability_selection_menu()
}