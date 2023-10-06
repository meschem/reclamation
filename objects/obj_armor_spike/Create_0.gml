/// @description Init

event_inherited()

angleSpriteToVelocity = true

//weaponType = playerWeapons.warHammer

targetsMax = 0

// damageFrameCooldown = 60 // not used yet...

knockback = 10

shadowSprite = spr_armor_spike_shadow

if (obj_ability_thorns.runes[enumRunes.magdela].enabled) {
	attach_projectile(id, obj_player)
	rotationSpeed = 5.2
}
