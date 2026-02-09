
if (buffInst != noone && !instance_exists(buffInst)) {
	buffInst = noone
}

if (owner != noone && level > 0 && buffInst == noone) {
	create_toaster("Creating VM")

	buffInst = create_instance(obj_buff_visceral_marker)
	buffInst.trinket = id
	buffInst.cdMax = seconds_to_frames(cooldown[level - 1])
}
