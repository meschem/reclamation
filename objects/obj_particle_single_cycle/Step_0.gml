if (game_is_paused()) {
	image_speed = 0
	
	return
} else {
	image_speed = animSpeed
}

if (lifeSpan > 0) {
    age++
    
    if (age >= lifeSpan) {
        instance_destroy()
    }
}

x += xVel
y += yVel