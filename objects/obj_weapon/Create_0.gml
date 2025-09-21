///@description						Init

event_inherited()

slot = equipmentSlots.weapon

maxCd = 70
curCd = 0

// Upgrade props
maxCdScalar = 1

attackSpeedScalar = 0 // used to calc max cd scalar

baseDamage = 15
bonusDamage = 0
damageScalar = 1

baseKnockback = 0
bonusKnockback = 0
knockbackScalar = 1

baseBurningStacks = 0
bonusBurningStacks = 0

bonusAoeScalar = 0

velocityScalar = 1

projectileCount = 1
bonusProjectiles = 0	// handled on a per weapon basis

projectileScale = 1

bonusCritMultiplier = 0
// End upgrade props

level = 1
maxLevel = 10

upgrades = []

upgradesMinor = []
upgradesMajor = []
upgradesEvolution = []

stats = []

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

damageStatBoostStr = 0
damageStatBoostDex = 0
damageStatBoostInt = 0

owner = noone

///@description					Gets damage the projectile should deal
///@return {real}
getDamage = function() {
	var _damage = getBaseDamage()
	
	_damage += bonusDamage
	_damage *= damageScalar
	
	return _damage
}

///@description						Calculates the base damage with any additives
///@return {real}					Returned damage to start calculating with
getBaseDamage = function() {
	var _damage = baseDamage
	
	_damage += damageStatBoostStr * (owner.baseStr + owner.bonusStr)
	_damage += damageStatBoostDex * (owner.baseDex + owner.bonusDex)
	_damage += damageStatBoostInt * (owner.baseInt + owner.bonusInt)
	
	return _damage
}

///@description						Gets knockback for the weapon
///@return {real}
getKnockback = function() {
	var _knockback = baseKnockback + (owner.baseStr + owner.bonusStr)
	
	_knockback += bonusKnockback
	_knockback *= knockbackScalar
	
	return _knockback
}

///@description						Gets burning stacks for a weapon
///@return {real}
getBurningStacks = function() {
	var _selfStacks = baseBurningStacks + bonusBurningStacks
	var _ownerStacks = owner.baseBurningStacks + owner.bonusBurningStacks
	
	return _selfStacks + _ownerStacks
}

///@description					Gets a weapon stat value
///@param {real} _stat			Stat, uses enumWeaponStats
getWeaponStatValue = function(_stat) {
	switch (_stat) {
		case enumWeaponStats.damage:
			return getDamage()
			
		case enumWeaponStats.knockback:
			return getKnockback()
			
		case enumWeaponStats.projectileScale:
			return projectileScale
			
		case enumWeaponStats.projectileCount:
			return projectileCount
			
		case enumWeaponStats.cooldown:
			return maxCd
	}		
}

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

///@description						Parent function for attacking. Don't overwrite. Called by obj_player.
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
			applyStatsToInstance(_projectiles[i])
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
	
	show_message("launch() used")
	
	return inst
}

///@description						Applies base stats to a projectile
///@param {Id.Instance} _inst		Instances to apply upgrades to
applyStatsToInstance = function(_inst) {
	_inst.damageDirect = baseDamage
	_inst.knockback = baseKnockback
}

///@description						Applies upgrade to a projectile
///@param {Id.Instance} _inst		Instances to apply upgrades to
applyUpgradesToInstance = function(_inst) {
	_inst.xVel *= velocityScalar
	_inst.yVel *= velocityScalar
	
	_inst.damageDirect = getDamage()
	_inst.knockback = getKnockback()
	_inst.burningStacks = getBurningStacks()
	_inst.critMultiplier += bonusCritMultiplier
	
	_inst.setScale(owner) // from obj_weapon_projectile
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