/// @description Init

talents = []

activeAbilityControllers = []

init_talents_jonah()
define_colors()
set_available_talents()

// some of these will need to be made global

playerTotalGold = 0
playerGold = 0
playerXp = 0
playerLevel = 1
playerXpLevelTable = [
	250,
	500,
	750,
	1000,
	1250,
	1500,
	2000,
	2500,
	3000,
	3500,
	4000,
	5000,
	6000,
	7000,
	8000,
	9000,
	10000,
	12000,
	14000,
	16000
]

window_set_cursor(cr_none)

cursor_sprite = spr_cursor_aiming

instance_create_depth(
	room_width / 2,
	room_height / 2,
	depths.player,
	obj_jonah
)