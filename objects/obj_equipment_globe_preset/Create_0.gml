event_inherited()

lifeSpan = -1

slots = [
	equipmentSlots.head,
	equipmentSlots.chest,
	equipmentSlots.gloves,
	equipmentSlots.boots
]

homingRadius = 16
pickupDelay = 30

equipment = noone

shadowSprite = spr_shadow_med
shadowOffset = 6

init_floating(2, 90)

image_speed = 0

attachEquipment = function(_equipment) {
	equipment = _equipment
	image_index = _equipment.rarity
}

onPickup = function(_player) {
	audio_play_sound(snd_switch_click, 0, false)
	
	if (equipment == noone) {
		create_toaster("Gear not attached!", errorLevels.error)
		instance_destroy()
		return
	}
		
	equipment.owner = _player
	_player.equipItem(equipment, false)
	
	create_toaster(get_rarity_string(equipment.rarity) + " " + equipment.name + " acquired!")
	
	instance_destroy()
}

beginStep = function() {
	if (equipment == noone) {
		return
	}
	
	var _particle = noone
	
	if (age % 3 == 0) {
		_particle = instance_create_depth(x, y, depth + 1, obj_particle_equipment_pickup_dot)
		_particle.image_index = equipment.rarity
	}
	
	if (equipment.rarity > enumRarity.normal && age % 4 == 0) {
		_particle = instance_create_depth(x, y, depth + 1, obj_particle_equipment_pickup_dot_l2)
		_particle.image_index = equipment.rarity
	}
	
	if (equipment.rarity > enumRarity.magic && age % 12 == 0) {
		_particle = instance_create_depth(x, y, depth + 1, obj_particle_equipment_vert_ray)
		_particle.image_index = equipment.rarity
	}
}