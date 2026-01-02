///@description			Init
// Inherit the parent event
event_inherited()

// large button setup

enabled = false

stateAge = 0
state = buttonStates.spawning

drawOffsetX = 0
drawOffsetY = 0

slideFromX = true
slideFromY = false

//drawDetails = false		// draws all non-window stuff, delayed for spawn-in fx

food = noone
skipFoodCleanup = false
foodBackdrop = spr_stat_card_food_backdrop
titleBackdrop = spr_ui_title_backdrop_lg
titleBackdropWidth = 160
width = 0
height = 0
owner = get_first_player()

statBlocks = []
selected = false

titleFont = font_alagard
statFont = font_aseprite
fontColor = c_white
fontColorHighlight = global.colorDarkGreen
fontColorLowlight = global.colorDarkRed

statBlockMarginY = 36
statBlockMarginX = 39
statBlockHeight = 30
statBlockLineHeight = 11

focusBoostX = 4	// How many px wider the menu should be when focused
focusBoostY = 4 // How many px taller

drawOffsetX = 0
drawOffsetY = 0

flashSprite = spr_card_flash_med

targetX = 0
targetY = 0

image_xscale = width / sprite_width
image_yscale = height / sprite_height
image_index = buttonStates.normal

enable = function() {

}

onClick = function () {
	skipFoodCleanup = true
	food.x = owner.x
	food.y = owner.y
    
    audio_play_sound(snd_casino_selection, 0, false)
    
    instance_create_depth(x - 5, y - 5, depth - 1, obj_card_flash_close_med)
    
	close_ability_selection_menu()
}

select = function() {	
	if (state == buttonStates.normal) {
		state = buttonStates.selected
	}
}

unselect = function() {
	if (state == buttonStates.selected) {
		state = buttonStates.normal
	}
}

///@description						Attach a food instance to the card
///@param {id.Instance} _food		Food to attach
attachFood = function(_food) {
	food = _food
	
	var _foodStatBlock = {
		x: statBlockMarginX,
		y: 0,
		amount: 1,
		name: "Unnamed",
		current: 5,
		future: 6,
		icon: spr_player_stats_icon_str
	}
	
	//show_message(statBlocks)
	
	if (food.bonusStr > 0) {
		_foodStatBlock.amount = food.bonusStr
		_foodStatBlock.icon = spr_player_stats_icon_str
		_foodStatBlock.name = "Strength"
		_foodStatBlock.current = get_player_stat(enumPlayerStats.str, owner)
		_foodStatBlock.future = _foodStatBlock.current + _foodStatBlock.amount
		
		array_push(statBlocks, variable_clone(_foodStatBlock))
	}
	
	//show_message(statBlocks)
	
	if (food.bonusDex > 0) {
		_foodStatBlock.amount = food.bonusDex
		_foodStatBlock.icon = spr_player_stats_icon_dex
		_foodStatBlock.name = "Dexterity"
		_foodStatBlock.current = get_player_stat(enumPlayerStats.dex, owner)
		_foodStatBlock.future = _foodStatBlock.current + _foodStatBlock.amount
		
		array_push(statBlocks, variable_clone(_foodStatBlock))
	}
	
	//show_message(statBlocks)
	
	if (food.bonusInt > 0) {
		_foodStatBlock.amount = food.bonusInt
		_foodStatBlock.icon = spr_player_stats_icon_int
		_foodStatBlock.name = "Intelligence"
		_foodStatBlock.current = get_player_stat(enumPlayerStats.int, owner)
		_foodStatBlock.future = _foodStatBlock.current + _foodStatBlock.amount
		
		array_push(statBlocks, variable_clone(_foodStatBlock))
	}
	
	//show_message(statBlocks)
	
	if (array_length(statBlocks) == 1) {
		statBlocks[0].y = 46
	}
	
	if (array_length(statBlocks) == 2) {
		statBlocks[0].y = 39
		statBlocks[1].y = 53
	}
	
	if (array_length(statBlocks) == 3) {
		statBlocks[0].y = 35
		statBlocks[1].y = 46
		statBlocks[2].y = 57
	}
}