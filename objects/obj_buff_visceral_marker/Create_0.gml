/// @description Init

event_inherited();

target = noone
permanent = true
trinket = noone
target = noone
cdCur = 0
cdMax = seconds_to_frames(1)
drawArrowLocation = new vec2()

drawYOffset = 0

onDestroy = function() {
	show_error("asdf", true)
}

drawArrow = false

depth = depths.ui
