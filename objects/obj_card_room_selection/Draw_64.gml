/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_color(c_black)

var prop = ""
var val = ""
var i = 0

draw_text(
	x + menuOffset.x + paddingX,
	y + menuOffset.y + height - paddingY - (i * statSpacing),
	"Type: "
)

draw_set_color(get_color(colors.red))
	
draw_text(
	x + menuOffset.x + paddingX + string_width("Type: "),
	y + menuOffset.y + height - paddingY - (i * statSpacing),
	get_room_name_from_type(dungeonRm.roomType)
)

i++

draw_set_color(c_black)

draw_text(
	x + menuOffset.x + paddingX,
	y + menuOffset.y + height - paddingY - (i * statSpacing),
	"Reward: "
)

draw_set_color(get_color(colors.red))
	
draw_text(
	x + menuOffset.x + paddingX + string_width("Reward: "),
	y + menuOffset.y + height - paddingY - (i * statSpacing),
	get_room_reward_from_enum(dungeonRm.reward)
)

i++

draw_set_color(c_black)

draw_text(
	x + menuOffset.x + paddingX,
	y + menuOffset.y + height - paddingY - (i * statSpacing),
	"Difficulty: "
)

draw_set_color(get_color(colors.red))
	
draw_text(
	x + menuOffset.x + paddingX + string_width("Difficulty: "),
	y + menuOffset.y + height - paddingY - (i * statSpacing),
	dungeonRm.difficulty
)