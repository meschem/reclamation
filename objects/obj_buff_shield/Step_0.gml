
event_inherited()

if (hp <= 0) {
	instance_destroy()
	return 0
}

if (damageDelayCdCur > 0) {
	damageDelayCdCur--
}
