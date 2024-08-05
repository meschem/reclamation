/// @description Init

event_inherited()

angleSpriteToVelocity = true

//weaponType = playerWeapons.warHammer

targetsMax = 1
knockback = 0

shadowSprite = spr_armor_spike_shadow

if (obj_ability_thorns.runes[enumRunes.magdela].enabled) {
	attach_projectile(id, obj_player)
	rotationSpeed = 5.2
}
