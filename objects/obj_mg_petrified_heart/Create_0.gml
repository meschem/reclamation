// Inherit the parent event
event_inherited()

name = "Petrified Heart"
description = "The preserved heart of a great beast, still clinging to life."

rarity = enumRarity.magic

bonusHealth = [10, 20]
dropRate = [stf(60), stf(30)]
dropCd = 0

stats = [
    create_custom_item_stat(dropRate, "Cooldown", statUnits.frames)
]

statsSpecial = "Periodically spawns a health orb near you"

onEquip = function() {
	dropCd = 0
}

onStep = function() {
	if (!equipped) {
		return 0
	}
	
	dropCd++
    
    var _index = min(level - 1, array_length(dropRate) - 1)
	
	if (dropCd >= dropRate[_index]) {
		create_pickup_with_lob(obj_health_globe_sm, owner.x, owner.y, get_color(colors.red))
        dropCd = 0
	}	
}
