width = 202
height = 268

image_speed = 0

image_xscale = width / sprite_width
image_yscale = height / sprite_height

x = (view_width() / 2) - (width / 2)
y = (view_height() / 2) - (height / 2)

titleSprite = spr_menu_title_evil_vanquished
titleSpriteXOffset = (width / 2)
titleSpriteYOffset = 8

statsDrawPaddingX = 29
statsDrawOffsetY = -8
statsDrawLineHeight = 22

statsDrawCdMax = 32
statsDrawCdCur = statsDrawCdMax
statsDrawLines = 0

stats = [
	{
		name: "Kills", value: obj_run_stats_controller.statsKillsTotal,
	},
	{
		name: "Ore", value: obj_run_stats_controller.statsOreGained,
	},
	{
		name: "Runes", value: obj_run_stats_controller.statsRunesGained,
	},
	{
		name: "Gold", value: obj_run_stats_controller.statsGoldGained,
	},
	{
		name: "Experience", value: obj_run_stats_controller.statsXpGained,
	}
]

var _button = instance_create_depth(x + 51, y + height - 84, depth - 20, obj_button)

_button.setText("Return Home", enumAligns.center)
_button.onClick = function() { restart_run() }
