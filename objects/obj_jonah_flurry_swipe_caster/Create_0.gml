//bonusMoveSpeed = obj_ability_flurry.bonusMoveSpeed
//bonusAttackSpeed = obj_ability_flurry.bonusAttackSpeed
lifeSpan = obj_ability_flurry.duration
attackAngle = obj_player.attackAngle

age = 0

owner = get_player_target()

buff = instance_create_depth(
	0, 0, 0,
	obj_buff_flurry_swipe
)

with (owner) {
	equipment.weapon.cdCur = 0
}
