///@description					Centers the camera on an instance
///param {id.Instance} inst		Instance to center on
///param {real} xOffset			X offset to add
///param {real} yOffset			Y offset to add

function center_view(inst, xOffset = 0, yOffset = 0) {
	var viewHeight = view_height()
	var viewWidth = view_width()
	
	var xMin = 0
	var xMax = room_width - viewWidth
	
	var yMin = 0
	var yMax = room_height - viewHeight
	
	with (obj_player) {
		camera_set_view_pos(
			view_camera[0],
			round(clamp(x - (viewWidth / 2), xMin, xMax) + xOffset),
			round(clamp(y - (viewHeight / 2), yMin, yMax) + yOffset)
		)
	}
}
