///@description						Init

event_inherited()

slot = equipmentSlots.weapon

maxCd = 70
curCd = 0

// Upgrade props
maxCdScalar = 1

attackSpeedScalar = 0 // used to calc max cd scalar

bonusDamage = 0
damageScalar = 1

bonusKnockback = 0
knockbackScalar = 1

bonusAoeScalar = 0

velocityScalar = 1

bonusCritMultiplier = 0
// End upgrade props

level = 1
maxLevel = 10

upgrades = []

upgradesMinor = []
upgradesMajor = []
upgradesEvolution = []

upgradePath = [
	weaponUpgradeTypes.minor,
	weaponUpgradeTypes.minor,
	weaponUpgradeTypes.major,
	weaponUpgradeTypes.minor,
	weaponUpgradeTypes.minor,
	weaponUpgradeTypes.major,
	weaponUpgradeTypes.minor,
	weaponUpgradeTypes.minor,
	weaponUpgradeTypes.major
]

owner = noone

processUpgrades = function() {
	var i, _inst
	
	for (i = 0; i < array_length(upgrades); i++) {
		_inst = create_instance(upgrades[i])
		_inst.weapon = id
		
		switch (_inst.upgradeType) {
			case weaponUpgradeTypes.minor:
				array_push(upgradesMinor, _inst)
			break
			
			case weaponUpgradeTypes.major:
				array_push(upgradesMajor, _inst)
			break
			
			case weaponUpgradeTypes.evolution:
				array_push(upgradesEvolution, _inst)
			break
		}
	}

}

///@description						Attacks with the weapon. Set this.
///@param {real} _attackAngle		Angle of attack
///@return {array<id.Instance>}
use = function(_attackAngle) {
	show_message("weapon use() not set")
	return []
}

///@description						Parent function for attacking. Don't overwrite.
///@param {real} _attackAngle		Angle to launch attack at
///@param {bool} _bypassCd			Bypass setting cooldown
///@param {bool} _baseAttack		True if caused directly by player, vs an ability or trinket
///@return {bool}					Returns true if attack occurred
attack = function(_attackAngle = 0, _bypassCd = false, _baseAttack = true) {
	if (curCd <= 0 || _bypassCd) {
		with (owner) {
			for (var i = 0; i < array_length(onAttackAbilities); i++) {
				onAttackAbilities[i].activateOnAttack(_baseAttack)
			}
		}
		
		var _projectiles = use(_attackAngle)
			
		for (var i = 0; i < array_length(_projectiles); i++) {
			applyUpgradesToInstance(_projectiles[i])
		}
		
		if (!_bypassCd) {
			var _multiplier = owner.attackSpeedScalar + obj_buff_controller.getBuffValue(buffValueTypes.bonusAttackSpeed) + attackSpeedScalar
			
			curCd = maxCd * (1 / _multiplier)
		}
		
		return true
	}
	
	return false
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
	
	inst.xVel = velocity.x * velocityScalar
	inst.yVel = velocity.y * velocityScalar
	inst.image_angle = get_angle(velocity.x, velocity.y)
	
	inst.damageDirect += bonusDamage
	inst.damageDirect *= damageScalar
	
	inst.knockback += bonusKnockback
	inst.knockback *= knockbackScalar
	
	inst.critMultiplier += bonusCritMultiplier
	
	//run_lifecycle_events(enumLifeCycleEvents.create, inst)
	
	return inst
}

///@description						Applies upgrade to a projectile
///@param {Id.Instance} _inst		Instances to apply upgrades to
applyUpgradesToInstance = function(_inst) {
	_inst.xVel *= velocityScalar
	_inst.yVel *= velocityScalar
	
	_inst.damageDirect += bonusDamage
	_inst.damageDirect *= damageScalar
	
	_inst.knockback += bonusKnockback
	_inst.knockback *= knockbackScalar
	
	_inst.critMultiplier += bonusCritMultiplier
	_inst.setScale(owner)
}

///@description						Creates a weapon upgrade bar
///@param {id.Instance} _menu		Menu to reference to create bar for
createUpgradeBar = function(_menu) {
	var _bar, _node, _nodeType
	
	_bar = create_instance(obj_weapon_upgrade_bar)
	_bar.weapon = id
	_bar.level = level
	_bar.menu = _menu
	
	for (var i = 0; i < array_length(upgradePath); i++) {
		switch (upgradePath[i]) {
			case weaponUpgradeTypes.minor: _nodeType = obj_weapon_upgrade_bar_node_min	break;
			case weaponUpgradeTypes.major: _nodeType = obj_weapon_upgrade_bar_node_maj	break;
			case weaponUpgradeTypes.evolution: _nodeType = obj_weapon_upgrade_bar_node_evo	break;
		}
		
		_node = create_instance(_nodeType)
		_node.upgradeType = upgradePath
		
		if (i < level - 1) {
			_node.state = weaponUpgradeBarNodeStates.active
		}
		
		array_push(_bar.nodes, _node)
	}
	
	_bar.enable()
}