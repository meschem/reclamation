
image_index = state

if (state == buttonStates.selected && equipment != noone) {
	drawEquipmentInfo = true
	setInfoPanelHeight()
} else {
	drawEquipmentInfo = false
}

if (equipment != noone && equipment.slot == equipmentSlots.weapon) {
	drawWeaponInfo = true
}