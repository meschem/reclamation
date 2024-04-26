/// @description		
event_inherited()

drawArrow = false

drawYOffset = sin(age / 12) * 2

// If has target...
if (target != noone) {
	if (instance_exists(target)) {
		drawArrow = true
		drawArrowLocation.x = target.x
		drawArrowLocation.y = target.y
		

		return 0
	}

	target = noone
	cdCur = 0
}

cdCur++

// find target if no target
if (cdCur >= cdMax) {
	target = get_random_baddie()

	if (target == noone) {
		cdCur = cdMax - seconds_to_frames(1)		
		return 0
	}
	
	array_push(target.onDestroyList, trinket.onBaddieDeath)
	
	cdCur = 0
}
