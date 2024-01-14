
create_instance(obj_equipment_controller)

enemyScalingHp = 1
enemyScalingMoveSpeed = 1

enemyScalingCdMax = seconds_to_frames(60)
enemyScalingCdCur = enemyScalingCdMax

enemyScalingHpIncrease = 0.1
enemyScalingMoveSpeedIncrease = 0.1

resetRun = function() {
	enemyScalingHp = 1
	enemyScalingMoveSpeed = 1
}
