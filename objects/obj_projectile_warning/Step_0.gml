
if (game_is_paused()) {
	if (image_speed != 0) {
        imageSpeed = image_speed;
        image_speed = 0;
    }
	
	return 0
} else {
    if (image_speed == 0) {
        image_speed = imageSpeed;
    }
}


if (singleCycle && image_index >= image_number - 1) {
    image_index = image_number - 1
    image_speed = 0;                
}

age++

if (lifeSpan >= 0 && age >= lifeSpan) {
	instance_destroy()
}

if (parent != noone && !instance_exists(parent)) {
	instance_destroy()
}
