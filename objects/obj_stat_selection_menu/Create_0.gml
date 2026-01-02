/// @description Insert description here
// You can write your code in this editor

titleboard = {
	sprite: spr_backpack_window_popup,
	width: 256,
	height: 64,
	textHeader: "Level Up!",
	textHeaderX: 0,
	textHeaderY: 0,
	headerFont: font_alagard_lg,
	textBody: "Select a stat boost",
	textBodyX: 0,
	textBodyY: 0,
	bodyFont: font_aseprite,
	textCenter: true,
	x: (view_width() / 2) - (256 / 2),
	y: 11,
}

state = enumSelectionMenuStates.normal
stateAge = 0
stateClosingDuration = stf(0.5)

useMouseFocus = false

draw_set_font(titleboard.headerFont)
titleboard.textHeaderX = (view_width() / 2) - (string_width(titleboard.textHeader) / 2)
titleboard.textHeaderY = titleboard.y + 4

draw_set_font(titleboard.bodyFont)
titleboard.textBodyX = (view_width() / 2) - (string_width(titleboard.textBody) / 2)
titleboard.textBodyY = titleboard.y + 36

buttons = []

marginTop = 11
marginButtonFirst = 6
marginButton = 4
buttonHeight = 80
buttonWidth = 212
selectedIndex = -1

focused = true

inputEnabled = false

buttonX = (view_width() / 2) - (buttonWidth / 2)

owner = noone

set_ui_profile_type(uiProfileTypes.statsPurchase)

///@description							Selects a button by index
///@param {real} _index					Index to select
selectButton = function(_index) {
	for (var i = 0; i < array_length(buttons); i++) {
		if (i == _index) {
			buttons[i].select()
		} else {
			buttons[i].unselect()
		}
	}
	
	selectedIndex = _index
	
    audio_play_sound(snd_punchy_pick, 1, 0)
}

///@description							Adds a button to the menu
///@param {id.Instance} _foodItem		Food to attach to the button
createButton = function(_foodItem) {
	var _button = create_instance(obj_card_stat_point_selection)

	array_push(buttons, _button)
	
	var _buttonCount = array_length(buttons)
	var _marginTotalY = marginButton * (_buttonCount - 1)
	var _buttonTotalY = buttonHeight * (_buttonCount - 1)
	
	_button.attachFood(_foodItem)
	_button.y = marginTop + titleboard.height + marginButtonFirst + _marginTotalY + _buttonTotalY
	_button.x = buttonX
	_button.height = buttonHeight
	_button.width = buttonWidth
	_button.menuIndex = array_length(buttons) - 1
	
	_button.state = buttonStates.holding
	_button.spawnDelay = (_buttonCount - 1) * stf(0.25)
    
    _button.depth = depth - 1
}

///@description             Sets whether or not this menu is focused
///@param {bool} _focused   True if this menu is focused
setFocusState = function(_focused) {
    if (focused == _focused) {
        return 0
    }
    
    focused = _focused
    
    if (_focused) {
        set_ui_focus_type(uiFocusTypes.statPurchaseSelection)
        
        for (var i = 0; i < array_length(buttons); i++) {
            if (i == selectedIndex) {
                buttons[i].state = buttonStates.selected
            } else {
                buttons[i].state = buttonStates.normal
            }
        }
    } else { 
        set_ui_focus_type(uiFocusTypes.statDetails)
        
        for (var i = 0; i < array_length(buttons); i++) {
            buttons[i].state = buttonStates.normal
        }
    }
}

close = function() {
    stateAge = 0
    state = enumSelectionMenuStates.closing
}
