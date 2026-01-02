/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Goldleaf"
description = "The Sun-scorched leaf of a Venomfern that has clung on to life, bursting with alchemical properties."

goldDropChance = [0.25, 0.3, 0.35]
goldDropAmountMin = [1, 2, 3]
goldDropAmountMax = [5, 10, 15]
goldDropAmountDisplay = ["1 to 5", "2 to 10", "3 to 15"]
maxLevel = 3

stats = [
    create_custom_item_stat(goldDropAmountDisplay, "Gold", statUnits.none),
    create_custom_item_stat(goldDropChance, "Chance on Hit", statUnits.percent)
]

statsSpecial = "Enemies sometimes drop gold on Weapon hits"

onWeaponHit = function(_data) {
	if (_data.target.targetType == targetTypes.baddie) {
        var _index = min(level - 1, array_length(goldDropChance) - 1)
        
		if (random(1) < goldDropChance[_index]) {
			create_pickup_with_lob(obj_coin, _data.target.x, _data.target.y, get_color(colors.yellow))
		}
	}
}
