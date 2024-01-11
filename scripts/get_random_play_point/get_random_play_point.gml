///@description		 Uses obj_play_area objects to get a random point in the play area
///@return {struct.vec2}

function get_random_play_point() {
	var totalArea = 0;
	var areaCount = instance_number(obj_play_area)
	var areas = []
	var areaSize = 0
	var area = obj_none
	var maxRoll = 0
	var curRoll = 0
	var areaWeights = []
	var returnVec = new vec2()
	var i, roll
	
	if (areaCount == 1) {
		area = obj_play_area
		
		returnVec.x = irandom(area.sprite_width) + area.x
		returnVec.y = irandom(area.sprite_height) + area.y
		
		return returnVec
	}
	
	for (i = 0; i < areaCount; i++) {
		area = instance_find(obj_play_area, i)
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
		
		
		// FIXME: ERROR HERE
		roll -= areaWeights[i]
	}
	
	show_error("Error in selecting valid area", true)
}