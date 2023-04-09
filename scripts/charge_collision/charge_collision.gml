/// @description   Description
/// @param {real}			xPos		Position to create AOE
/// @param {real}			yPos		Position to create AOE
/// @param {real}			angle		Angle of collision
/// @param {id.instance}	target		Target to deal direct damage to

function charge_collision(xPos, yPos, angle, target = noone) {
	var directDamage = 50
	
	spawn_fx_shock_boom(xPos, yPos)

	if (target != noone) {
		knockback_baddie(target, 50, angle)
		damage_baddie(target, 50)
		stun_baddie(target, 4)
	}
}