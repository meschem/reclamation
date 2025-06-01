/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

var _inst = instance_create_depth(x + 3, y - 5, depth - 5, obj_wraith_soul_escape)
_inst.image_xscale = sign(image_xscale)
_inst.sprite_index = spr_devil_soul_fx
