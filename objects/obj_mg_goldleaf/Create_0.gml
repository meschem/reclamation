/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Goldleaf"
description = "With neutralized poison, its alchemical properties are revealed."

rarity = enumRarity.magic

bonusPickupReward = 0.5
bonusPickupRange = 0.5
goldDropChance = 1 // 0.1
goldDropString = string(goldDropChance * 100) + "%" + " Chance for enemies to drop gold on weapon hit"

statsSpecial = [goldDropString]

onWeaponHit = function(_data) {
	if (_data.target.targetType == targetTypes.baddie) {
		if (random(1) < goldDropChance) {
			create_pickup_with_lob(obj_coin, _data.target.x, _data.target.y, get_color(colors.yellow))
		}
	}
}
