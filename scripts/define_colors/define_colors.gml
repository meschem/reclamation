///@description   Defines colors and color keyword struct
function define_colors() {
	with (obj_game_controller) {
		color_red = make_color_rgb(230, 40, 106)
		color_orange = make_color_rgb(255, 137, 118)
		color_blue = make_color_rgb(32, 129, 204)
		color_yellow = make_color_rgb(254, 237, 88)
		color_green = make_color_rgb(85, 255, 129)
		color_teal = make_color_rgb(37, 190, 127)
		color_purple = make_color_rgb(159, 118, 255)
		color_aqua = make_color_rgb(85, 213, 255)
		color_black = make_color_rgb(5, 0, 57)
		color_dark_purple = make_color_rgb(88, 66, 177)
		color_light_green = make_color_rgb(110, 255, 150)
	}
	
	global.colorRed = make_color_rgb(230, 40, 106)
	global.colorOrange = make_color_rgb(255, 137, 118)
	global.colorYellow = make_color_rgb(254, 237, 88)
	global.colorGreen = make_color_rgb(85, 255, 129)
	global.colorBlue = make_color_rgb(32, 129, 204)	
	global.colorPurple = make_color_rgb(159, 118, 255)
	
	global.colorTeal = make_color_rgb(37, 190, 127)
	global.colorAqua = make_color_rgb(85, 213, 255)
	global.colorLightGreen = make_color_rgb(110, 255, 150)
	
	global.colorDarkRed = make_color_rgb(231, 42, 127)
	global.colorDarkOrange = make_color_rgb(233, 92, 48)
	global.colorDarkYellow = make_color_rgb(239, 189, 47)
	global.colorDarkGreen = make_color_rgb(47, 206, 141)
	global.colorDarkBlue = make_color_rgb(32, 129, 204)
	global.colorDarkPurple = make_color_rgb(88, 66, 177)
	
	global.colorDark = make_color_rgb(5, 0, 57)
    global.colorGray = make_color_rgb(134, 130, 179)
    global.colorLight = make_color_rgb(216, 216, 244)
	
	global.colorMapStruct = {
		Health: global.colorRed,
		HP: global.colorRed,
		Strength: global.colorOrange,
		Str: global.colorOrange,
		Dexterity: global.colorGreen,
		Dex: global.colorGreen,
		Intelligence: global.colorBlue,
		Int: global.colorBlue,
		Move_Speed: global.colorYellow,
		Crit_Chance: global.colorOrange,
		Crit_Multiplier: global.colorOrange,
		Area_of_Effect: global.colorPurple,
		AOE: global.colorPurple,
		Ability_Cooldown: global.colorBlue,
		Ability_CD: global.colorBlue,
		Active_Ability_Cooldown: global.colorBlue,
		Attack_Speed: global.colorGreen,
		Knockback: global.colorOrange,
		Projectile_Count: global.colorPurple,
		Physical_Damage: global.colorOrange,
		Magic_Damage: global.colorAqua,
		Pickup_Range: global.colorYellow,
		Pickup_Amount: global.colorYellow,
		Pickup_Multiplier: global.colorYellow,
		Luck: global.colorGreen,
		Fire: global.colorRed,
		Ice: global.colorBlue,
		Lightning: global.colorYellow,
		Ultimate_Charge_Rate: global.colorBlue,		
	}
}
