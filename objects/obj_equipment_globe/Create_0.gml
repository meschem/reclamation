event_inherited()

lifeSpan = -1

slots = [
	equipmentSlots.head,
	equipmentSlots.chest,
	equipmentSlots.gloves,
	equipmentSlots.boots
]

rarityMultiplier = 1

shadowSprite = spr_shadow_med
shadowOffset = 6

init_floating(2, 90)

onPickup = function(_player) {
	var _equipment = create_gear_roll(1, rarityMultiplier, slots)
	
	_equipment[0].owner = _player
	_player.equipItem(_equipment[0], false)
	
	instance_destroy()
}
