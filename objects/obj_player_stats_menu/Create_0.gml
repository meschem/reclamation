///@description Init

depth = -500
persistent = true

statObjects = [
	obj_player_stats_stat_item_hp,
	obj_player_stats_stat_item_str,
	obj_player_stats_stat_item_dex,
	obj_player_stats_stat_item_int,
	obj_player_stats_stat_item_pdmg,
	obj_player_stats_stat_item_mdmg,
	obj_player_stats_stat_item_as,
	obj_player_stats_stat_item_crit,
	obj_player_stats_stat_item_critxer,
	obj_player_stats_stat_item_cd,
	obj_player_stats_stat_item_ms,
	obj_player_stats_stat_item_aoe,
	obj_player_stats_stat_item_kb,	
	obj_player_stats_stat_item_proj,
	obj_player_stats_stat_item_pamount,
	obj_player_stats_stat_item_prange,
	obj_player_stats_stat_item_mf,
]

slots = [

]

inputsKeyboard = {
	toggleMerge: vk_enter,
	merge: vk_shift,
	swap: vk_space,
	close: vk_escape
}

inputsController = {
	toggleMerge: XBOX_INPUT_X,
	merge: XBOX_INPUT_A,
	swap: XBOX_INPUT_Y,
	close: XBOX_INPUT_B
}


draw = false
selectedSlot = noone
isOpen = false
focused = false
owner = noone

isSetup = false

x = 8
y = 51

width = 1
height = 1

rows = 1

selectChange = 0
selectedIndex = 0
selectedStat = {}
selector = noone

infobox = noone

bgSprite = spr_backpack_window_main

titleSprite = spr_player_stats_title_backdrop
titleSpriteOffset = new vec2(5, 11)

titleName = "Jonah"
titleNameFont = font_alagard
titleNameOffset = new vec2(11, 13)

titleClass = "Templar Knight"
titleClassFont = font_dogica_s
titleClassOffset = new vec2(68, 34)

statOffsetX = 8
statOffsetY = 56
statWellHeight = 12
statWellColor =  make_color_rgb(47, 33, 117)
statValueOffset = 102
statValue = 0

image_alpha = 0

setup = false

open = function() {
	image_alpha = 1
	isOpen = true
}

close = function() {
	image_alpha = 0
	isOpen = false
    
    onEndFocus()
}

onFocus = function() {
	focused = true
    
	selector = instance_create_depth(-99, -99, depth - 999, obj_player_stat_selector)
	selector.x = x + 3
	infobox = instance_create_depth(-99, -99, depth - 999, obj_player_stat_infobox)
	
	selectedIndex = 0
	
	selectedStat = slots[selectedIndex]
	
	infobox.updateStat(selectedStat)
}

onEndFocus = function() {
	focused = false
	
	if (instance_exists(selector)) {
		instance_destroy(selector)
	}
	
	if (instance_exists(infobox)) {
		instance_destroy(infobox)
	}
}

///@description						Setups up
///@param {id.Instance} _owner		Player owner
setup = function(_owner) {
	owner = _owner
	
	for (var i = 0; i < array_length(statObjects); i++) {
		var _inst = create_instance(statObjects[i])
		
		array_push(slots, _inst)

		_inst.depth = depth - 10
		_inst.owner = owner
		_inst.statName = get_player_stat_name(_inst.stat)
		_inst.statDescription = get_player_stat_description(_inst.stat)
		_inst.statValueReadable = get_player_stat_value_readable(_inst.stat)
		//_inst.getInfo()
	}
	
	width = 166
	height = statOffsetY + (array_length(slots) * statWellHeight) + 12
	
	image_xscale = width / sprite_width
	image_yscale = height / sprite_height
	
	isSetup = true
}

///@description						Get the Y of the stat
///@param {real} _index				Index, defaults to selected index
getStatUiOffsetY = function(_index = selectedIndex) {
	var _y = y + 55 + (statWellHeight * _index)
	
	return _y
}
