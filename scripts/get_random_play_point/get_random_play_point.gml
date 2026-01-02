///@description								Uses obj_play_area objects to get a random point in the play area
///@param {asset.GMObject} _objectFilter	Objects to use for selection
///@return {struct.vec2}

function get_random_play_point(_objectFilter = obj_play_area) {
	var areaCount = instance_number(_objectFilter) 

    var totalArea = 0
	var areas = []
	var areaSize = 0
	var area = obj_none
	var maxRoll = 0
	var curRoll = 0
	var areaWeights = []
	var returnVec = new vec2()
	var i, roll
        
    if (areaCount == 0) {
        returnVec.x = random(view_width()) + camera_get_view_x(view_camera[0])
        returnVec.x = random(view_height()) + camera_get_view_y(view_camera[0])
        
        return returnVec
    } 
	
	if (areaCount == 1) {
		area = _objectFilter
		
		returnVec.x = irandom(area.sprite_width) + area.x
		returnVec.y = irandom(area.sprite_height) + area.y
		
		return returnVec
	}
	
	for (i = 0; i < areaCount; i++) {
		area = instance_find(_objectFilter, i)
		areaSize = area.sprite_width * area.sprite_height
		
		areaWeights[i] = {
			inst: area,
			weight: areaSize
		}

		maxRoll += areaSize
	}
	
	roll = irandom(maxRoll)
	
	for (i = 0; i < array_length(areaWeights); i++) {
		if (roll <= areaWeights[i].weight) {
			area = areaWeights[i].inst
			
			returnVec.x = irandom(area.sprite_width) + area.x
			returnVec.y = irandom(area.sprite_height) + area.y
		
			return returnVec
		}
		
		roll -= areaWeights[i].weight
	}
	
    show_message(areaWeights)
	show_error("Error in selecting valid area", true)
}

///@description						Gets multiple random play points
///@param {real} _count				Amount of points to grab
///@return {array<struct.vec2>}
function get_random_play_points(_count = 4) {
	var _points = []
	var _point = new vec2()
	
	for (var i = 0; i < _count; i++) {
		_point = get_random_play_point()
		
		array_push(_points, _point)
	}
	
	return _points
}