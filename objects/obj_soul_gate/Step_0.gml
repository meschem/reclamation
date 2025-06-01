
age++

if (age >= lifeSpan) {
	create_toaster($"Soul Gate Destroyed, xpGained: {xpGained}")
	instance_create_depth(x, y, depth, obj_xp_globe_sm)
	instance_destroy()
}

if (age % spawnRate == 0) {
	var _spawn = spawn_baddie(spawnBaddie)
	
	_spawn[0].spawnedBy = id
}

if (drawScale > 1) {
	drawScale *= pulseFrameScale
	
	if (drawScale <= 1.01) {
		drawScale = 1
	}
}

if (floatRange > 0) {
	var length = 60
	var phaseRatio = (age % length) / 60
	var phase = sin(2 * pi * phaseRatio)
		
	floatOffset = phase * floatRange
}

ringDrawScale = min(age / ringDrawFullTime, 1)
ringRadius = activeAreaRadius * ringDrawScale

image_xscale = drawScale
image_yscale = drawScale

