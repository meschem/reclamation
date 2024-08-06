// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function disable_player_controls() {
	with (obj_player) {
		inputEnabled = false
	}
}

function enable_player_controls() {
	with (obj_player) {
		inputEnabled = true
	}
}