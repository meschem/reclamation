/// @description Insert description here
// You can write your code in this editor

if (sprite_index == spriteSpawn) {
	if (slamming) {
		damage_baddies_in_area(
			obj_ability_shield_wall.slammingRadius,
			obj_ability_shield_wall.slammingDamage
		)
	}

	sprite_index = spriteIdle
}