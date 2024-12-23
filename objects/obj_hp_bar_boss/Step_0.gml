
if (baddie == noone) {
	return 0
}

if (!instance_exists(baddie)) {
	instance_destroy()
	return 0
}

nameString = baddie.name
descString = baddie.description

hpBarFillScaleX = (hpBarFillWidthMax / sprite_get_width(hpBarFillSprite)) * (baddie.hp / baddie.hpMax)

if (hpBarFillScaleX < 0) {
	hpBarFillScaleX = 0
}
