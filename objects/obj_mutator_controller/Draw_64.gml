/// @description Insert description here
// You can write your code in this editor

var _offsetX = 2
var _offsetY = 92

///@FIXME: PERF
with (obj_mutator_parent) {
	if (enabled) {
		draw_sprite(sprite_index, image_index, _offsetX, _offsetY)
	}
	
	_offsetY += 32
}