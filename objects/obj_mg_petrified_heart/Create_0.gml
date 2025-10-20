// Inherit the parent event
event_inherited()

name = "Petrified Heart"
description = "The preserved heart of a great beast, still clinging to life."

rarity = enumRarity.magic

dropRate = stf(12)
dropCd = 0

onEquip = function() {
	dropCd = 0
}

onStep = function() {
	if (!equipped) {
		return 0
	}
	
	dropCd++
	
	if (dropCd >= dropRate) {
		create_pickup_with_lob(obj_health_globe_sm, owner.x, owner.y, get_color(colors.red))
	}	
}
