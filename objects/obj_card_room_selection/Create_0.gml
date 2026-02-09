
// Inherit the parent event
event_inherited()

titleText.location.y = 17
bodyText.location.y = 37

titleText.body = "Room"
bodyText.body = "Select this room to fight in it"

// type struct.dungeonRoom
dungeonRm = {
	roomType: 0,
	reward: 0,
	difficulty: 0
}

width = 140
height = 200
paddingX = 8
paddingY = 20
statSpacing = 14
maxTextWidth = width - (paddingX * 2)

displayLevel = 1

titleText.maxWidth = width - (2 * paddingX)
bodyText.maxWidth = width - (2 * paddingX)

generalFont = font_dogica_s

image_xscale = width / sprite_width
image_yscale = height / sprite_height

onClick = function () {
	obj_run_controller.loadRoom(dungeonRm)
}
