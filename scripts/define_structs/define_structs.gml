///@description   Defines structs for project

function define_structs() {

}

///@description						Pairing of instance and clearframe to manage hitList arrays
///@param {id.Instance} _instance	Instance to reference
///@param {real} _maxAge			How many frames before the instance is cleared
function hitListEntry(_instance, _maxAge) constructor {
	instance = _instance
	clearFrame = get_current_frame() + _maxAge
}

function keyMouseInput() constructor {
	moveUp = ord("W")
	moveRight = ord("D")
	moveDown = ord("S")
	moveLeft = ord("A")
	
	useWeaponPrimary = mb_left
	useWeaponSecondary = mb_right
	
	useAbility = [
		ord("Q"),
		ord("E"),
		ord("R"),
		ord("T"),
		ord("G")
	]
}

///@param {real} _top
///@param {real} _right
///@param {real} _bottom
///@param {real} _left
function bounds(_top, _right, _bottom, _left) constructor {
	top = _top
	right = _right
	bottom = _bottom
	left = _left
}

///@param {real} _x
///@param {real} _y
function vec2(_x, _y) constructor {
	x = _x
	y = _y
}

///@param {string} _body  
///@param {asset.GMFont}  _font 
///@param {real}  _color
///@param {any} _location 
///@param {bool} _centered 
///@param {real} _maxWidth
function text(_body, _font, _color, _location, _centered = false, _maxWidth = -1) constructor {
	body = _body
	font = _font
	color = _color
	location = _location
	centered = _centered
	maxWidth = _maxWidth
	
	///@param {real} _xOffset
	///@param {real} _yOffset
	static draw = function(_xOffset = 0, _yOffset = 0) {
		draw_text_ext_color(
			location.x + _xOffset,
			location.y + _yOffset,
			body,
			14, 
			maxWidth,
			color, color, color, color,
			1
		)
	}
}

///@param {string} _name
///@param {string} _description
///@param {real} _maxLevel
function abilityStruct(_name, _description, _maxLevel = 3) constructor {
	name = _name
	description = _description
	maxLevel = _maxLevel
	curLevel = 0
}

///@param {string} _name
///@param {string} _description
///@param {asset.GMObject} _hero
///@param {asset.GMSprite} _icon
function abilityTree(_name, _description, _hero, _icon = spr_not_set) constructor {
	name = _name
	description = _description
	hero = _hero
	icon = _icon
	
	abilities = []
}

