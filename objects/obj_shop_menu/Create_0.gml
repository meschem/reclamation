///@description							Shop menu

title = "Shop Menu"

width = 450
height = 260

image_xscale = width / sprite_width
image_yscale = height / sprite_height

x = (view_width() - width) / 2
y = (view_height() - height) / 2

buttonRowCount = 2
buttonColumnCount = 3
buttonSpacing = 60
display = false

buttonWidth = 60
buttonHeight = 80

curRow = 0
curColumn = 0

padding = 4

buttons = []

// CREATE PANES:
detailsPanel = instance_create_depth(
	x + padding,
	y + (height / 2) + padding,
	depth - 10,
	obj_info_panel_item_details
)

detailsPanel.setDimensions(
	(width / 2) - (padding * 2),
	(height / 2) - (padding * 4)	
)

playerGearPanel = instance_create_depth(
	x + (width / 2) + (padding * 2),	
	y + padding,
	depth - 10,
	obj_info_player_gear_panel
)

playerGearPanel.setDimensions(
	(width / 2) - (padding * 3),
	height - (padding * 4) - 80
)

buttons[0] = create_instance(obj_button)
buttons[0].x = x + 300
buttons[0].y = y + 175
buttons[0].depth = depth - 10
buttons[0].menu = id
buttons[0].setText("Done")
buttons[0].onClick = function() {
	close()
}

set_game_pause_state(true)

///@description							Adds a button to the menu
///@param {asset.GMObject} equipment	Piece of equipment to add
addShopButton = function(equipment) {
	var button = create_instance(obj_shop_menu_button)
	
	button.item = equipment
	button.menu = id
	button.depth = depth - 10
	
	array_push(buttons, button)
}

close = function() {
	array_foreach(buttons, function(button) {
		instance_destroy(button)
	})
	
	instance_destroy(detailsPanel)
	instance_destroy(playerGearPanel)
	
	instance_destroy()
	
	set_game_pause_state(false)
}

setButtonSpacing = function() {
	var i = 1
	
	//Done Button
	
	buttons[i].x = x + padding
	buttons[i].y = y + padding
	i++
	
	buttons[i].x = buttons[i - 1].x + buttonWidth + buttonSpacing
	buttons[i].y = y + padding
	i++
	
	//buttons[i].x = buttons[1].x + buttonWidth + buttonSpacing
	//buttons[i].y = y + 4
	//i++
	
	buttons[i].x = x + padding
	buttons[i].y = y + padding + buttonSpacing
	i++
	
	buttons[i].x = buttons[i - 1].x + buttonWidth + buttonSpacing
	buttons[i].y = y + padding + buttonSpacing
	i++
	
	//buttons[i].x = buttons[5].x + buttonWidth + buttonSpacing
	//buttons[i].y = y + 4 + buttonSpacing
	//i++
	
	for (var i = 0; i < array_length(buttons); i++) {
		//buttons.display = true
	}
}