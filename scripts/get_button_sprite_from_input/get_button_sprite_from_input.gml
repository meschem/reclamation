///@description				Gets a controller button input based on an input
///@param {real} _input		Input

///@return {asset.GMSprite}			
function get_button_sprite_from_input(_input, _controllerType = enumControllerTypes.xbox) {
	switch (_input) {
		case gp_face1:
			return spr_btn_xbox_a
			
		case gp_face2:
			return spr_btn_xbox_b
			
		case gp_face3:
			return spr_btn_xbox_x
			
		case gp_face4:
			return spr_btn_xbox_y
			
		case gp_shoulderr:
			return spr_btn_xbox_rb
			
		case gp_shoulderrb:
			return spr_btn_xbox_rt
			
		case gp_shoulderl:
			return spr_btn_xbox_lb
			
		case gp_shoulderlb:
			return spr_btn_xbox_lt
			
		case gp_stickr:
			return spr_btn_xbox_r3
			
		case gp_stickl:
			return spr_btn_xbox_l3
			
		default:
			return spr_none
	}
}

enum enumControllerTypes {
	xbox,
	playstation,
	switchNes,
}