/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < array_length(buttons); i++) {
    if (instance_exists(buttons[i])) {
        instance_destroy(buttons[i])
    }
}

var _leveled = check_for_level_up()

if (!_leveled) {
	set_game_pause_state(false)
	set_ui_profile_type(uiProfileTypes.gameplay)
    set_ui_focus_type(uiFocusTypes.none)
}
