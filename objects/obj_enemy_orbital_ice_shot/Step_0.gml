
event_inherited()

if (game_is_paused() || parent == noone) {
	return 0
}

if (!instance_exists(parent)) {
	instance_destroy()

	return 0
}

image_angle += rotation

angleFromParent += revolutionRate
distanceFromParent += expansionRate

offsetX = angle_xvel(angleFromParent) * distanceFromParent
offsetY = angle_yvel(angleFromParent) * distanceFromParent

x = parent.x + offsetX
y = parent.y + offsetY
