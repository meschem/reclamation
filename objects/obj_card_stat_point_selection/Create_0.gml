
// Inherit the parent event
event_inherited()

// large button setup

width = 148
height = 200
paddingX = 8
paddingY = 20
statSpacing = 14
maxTextWidth = width - (paddingX * 2)
owner = get_first_player()

statType = enumCharStats.str
statAmount = irandom_range(1, 3)

stats = []

generalFont = font_pixelmix_s // font_dogica_s

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	if (statType == enumCharStats.str) {
		owner.baseStr += statAmount
	} else if (statType == enumCharStats.dex) {
		owner.baseDex += statAmount
	} else if (statType == enumCharStats.int) {
		owner.baseInt += statAmount
	}
	
	close_ability_selection_menu()
}

setStatBlock = function() {
	
}