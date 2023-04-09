/// @description    Creates a moving text object. Defaults to orange
///	@param {string}	text
/// @param {real}	posX
/// @param {real}	posY
/// @param {real}	movingTextType
/// @return {id.Instance}

function create_moving_text(text, posX, posY, movingTextType = movingTextTypes.parabola) {
	var inst = instance_create_depth(posX, posY, depths.ui, obj_moving_text)

	switch (movingTextType) {
		case movingTextTypes.parabola:
			inst.xVel = random_range(-0.5, 0.5)
		break
		
		case movingTextTypes.floating:
			inst.yVel = -1
		break
	}
	
	inst.fontColor = c_orange
	inst.displayText = text
	
	return inst
}