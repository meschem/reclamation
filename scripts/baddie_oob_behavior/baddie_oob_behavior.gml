///@description						Checks and runs wrap-around behavior
///@param {real} _behavior			Uses enum wrapAroundBehaviors
///@param {id.Instance} _baddie		Baddie
function baddie_oob_behavior(_behavior, _baddie = id) {
	var _oobDistanceX = 480
	var _oobDistanceY = 280
	
	var _oobWrapDistanceX = 380
	var _oobWrapDistanceY = 200
	
	if (_behavior == wrapAroundBehaviors.none) {
		return 0
	}
	
	if (_behavior == wrapAroundBehaviors.wrap) {
		if (x > obj_player.x + _oobDistanceX) {
			x = obj_player.x - _oobWrapDistanceX
			move_until_free()
		} else if (x < obj_player.x - _oobDistanceX) {
			x = obj_player.x + _oobWrapDistanceX
			move_until_free()
		} else if (y > obj_player.y + _oobDistanceY) {
			y = obj_player.y - _oobWrapDistanceY
			move_until_free()
		} else if (y < obj_player.y - _oobDistanceY) {
			y = obj_player.y + _oobWrapDistanceY
			move_until_free()
		}
	}
	
	if (_behavior == wrapAroundBehaviors.destroy) {
		if (
			(x > obj_player.x + _oobDistanceX) ||
			(x < obj_player.x - _oobDistanceX) ||
			(y > obj_player.y + _oobDistanceY) ||
			(y < obj_player.y - _oobDistanceY)
		) {
			hp = 0
			killedByBounds = true
		}
	}
}