///@description						Init

event_inherited()

slot = equipmentSlots.weapon

maxCd = 70
curCd = 0

upgrades = []

owner = get_player_target()

///@description						Attacks with the weapon. Set this.
use = function() {
	show_message("weapon use() not set")
}

///@description						Parent function for attacking. Don't overwrite.
attack = function() {
	if (curCd <= 0) {
		use()
		
		curCd = maxCd * (1 / owner.attackSpeedScalar)
	}
}

///@description						Launches a projectile
///@param {asset.GMObject} obj		Object to launch
///@param {struct.vec2} velocity
///@param {struct.vec2} offset
///@return {id.Instance}
launch = function(obj, velocity, offset = new vec2(0, 0)) {
	var inst = instance_create_depth(
		owner.x + offset.x,
		owner.y + offset.y,
		depths.playerProjectile,
		obj
	)
	
	inst.xVel = velocity.x
	inst.yVel = velocity.y
	inst.image_angle = get_angle(velocity.x, velocity.y)
	
	var upgrade, event
	
	for (var i = 0; i < array_length(upgrades); i++) {
		upgrade = upgrades[i]
		
		if (upgrade.active) {
			for (var j = 0; j < array_length(upgrade.lifeCycleEvents); j++) {
				event = upgrade.lifeCycleEvents[j]
				add_lifecycle_event(event.cycleType, event.cycleFunc, inst)
			}
		}
	}

	run_lifecycle_events(enumLifeCycleEvents.create, inst)
	
	return inst
}