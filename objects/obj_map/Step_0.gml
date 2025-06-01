poiDrawInfo = []

var _posX = 0
var _posY = 0
var _player = noone

if (keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0, gp_select)) {
	drawStyle++
	
	if (drawStyle == 3) {
		drawStyle = 0
	}
}

if (drawStyle == mapDrawStyles.small) {
	drawLocation = new vec2(2, 245)
	image_alpha = 0.66
	image_xscale = 1
	image_yscale = 1
} else if (drawStyle == mapDrawStyles.large) {
	drawLocation = new vec2(115, 35)
	image_alpha = 0.4
	image_xscale = 3
	image_yscale = 3
}

for (var i = 0; i < instance_number(obj_player); i++) {
	_player = instance_find(obj_player, i)
	
	_posX = (_player.x / room_width) * sprite_width
	_posY = (_player.y / room_height) * sprite_height
	
	array_push(
		poiDrawInfo,
		{
			sprite: _player.mapIcon,
			frame: 0,
			x: _posX,
			y: _posY
		}
	)
} 

for (var i = 0; i < array_length(pois); i++) {
	if (!instance_exists(pois[i])) {
		continue
	}
	
	_posX = (pois[i].x / room_width) * sprite_width
	_posY = (pois[i].y / room_height) * sprite_height
	
	array_push(
		poiDrawInfo,
		{
			sprite: pois[i].mapIcon,
			frame: 0,
			x: _posX,
			y: _posY
		}
	)
}

