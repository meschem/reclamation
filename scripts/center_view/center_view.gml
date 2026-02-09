///@description					Centers the camera on an instance
///param {id.Instance} inst		Instance to center on
///param {real} xOffset			X offset to add
///param {real} yOffset			Y offset to add

function center_view(inst, xOffset = 0, yOffset = 0, _rate = 0.05) {
	var viewHeight = view_height()
	var viewWidth = view_width()
	var minReposDistance = 0
	var cam = view_camera[0]
	
	var xMin = 0
	var xMax = room_width - viewWidth
	
	var yMin = 0
	var yMax = room_height - viewHeight
	
	var xCur = camera_get_view_x(cam) + (viewWidth / 2)
	var yCur = camera_get_view_y(cam) + (viewHeight / 2)
	var targetX = inst.x
	var targetY = inst.y
	
	var	targetDistance = point_distance(xCur, yCur, targetX, targetY)
	var resultVec = new vec2()
		
	if (targetDistance > minReposDistance) {
		resultVec = get_vec2_between_two_vec2(
			new vec2(xCur, yCur),
			new vec2(targetX, targetY),
			_rate
		)
	} else {
		resultVec = new vec2(targetX, targetY)
	}
	
	camera_set_view_pos(
		cam,
		round(clamp(resultVec.x - (viewWidth / 2), xMin, xMax) + xOffset),
		round(clamp(resultVec.y - (viewHeight / 2), yMin, yMax) + yOffset)
	)
}
