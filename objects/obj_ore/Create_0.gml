event_inherited()

//pickupValue = 10

shadowSprite = spr_shadow_med
shadowOffset = 6

lifeSpan = -1

init_floating(2, 90)

onPickup = function(_player) {
	var _weapon = _player.equipment.weapon
	
	audio_play_sound(snd_clang_clang, 0, false)
	
	if (_weapon.level >= _weapon.maxLevel) {
		create_toaster("Weapon at max level. No behavior set", errorLevels.warning)
	}
	
	display_weapon_upgrade_prompt()
	
	instance_destroy()
}
