///@description Init

enum playerStates {
	idle,
	walking,
	charging
}

enum enumInputTypes {
	none,
	keyboardMouse,
	controller
}

name = "Unnamed"
className = "Unskilled"

kmInput = new keyMouseInput()
controllerInput = new gamepadInput()
controllerIndex = 0

inputFocus = enumInputTypes.keyboardMouse

//runStatsController = create_instance(obj_run_stats_controller)
//runStatsController.owner = id

depth = depths.player

age = 0

reticles = [
	spr_reticle_arrow_sm,
	spr_reticle_crossbow
]

//add_player_target(id)

enum enumCharStats {
	str,
	dex,
	int,
}

enum enumPlayerStats {
	maxHp,
	moveSpeedMax,
	maxArmor,
	critChance,
	critDamageMultiplier,
	areaOfEffectScalar,
	abilityCooldownScalar,
	abilityDamageScalar,
	attackSpeedScalar,
	knockbackScalar,
	bonusProjectileCount,
	damageScalar,
	pickupRangeScalar,
	pickupRewardScalar,
	weaponAoeScalar,
	weaponKnockbackScalar,
	magicFind,
	str,
	dex,
	int,
}

reticleIndex = 0

mapIcon = spr_player_icon

baseStr = 5
baseDex = 5
baseInt = 5

bonusStr = 0
bonusDex = 0
bonusInt = 0

baseMaxHp = 50
baseMoveSpeedMax = 1.4
baseMaxArmor = 0
baseCritChance = 0.1
baseCritMultiplier = 1.5
baseAreaOfEffectScalar = 1
baseAbilityDamageScalar = 1
baseAttackSpeedScalar = 1
baseKnockbackMultiplier = 1
basePoisonDamage = 15
baseRecoveryTime = 1.5
baseBurningStacks = 0
baseMagicFind = 0
basePickupRewardScalar = 1
basePickupRangeScalar = 1

bonusProjectileCount = 0
bonusDamageScalar = 1
bonusPickupRangeScalar = 0
bonusPickupRewardScalar = 0
bonusWeaponAoeScalar = 1
bonusWeaponKnockbackScalar = 1
bonusPoisonDamage = 0
bonusMagicFind = 0
bonusRecoveryTime = 0
bonusBurningStacks = 0
bonusAbilityCooldownScalar = 0
bonusAbilityDamageScalar = 0
bonusKnockbackMultiplier = 0
bonusAreaOfEffectScalar = 0
bonusCritChance = 0

totalGold = 0
gold = 0
xp = 0
level = 1
abilityTreeLevel = 1
levelingUp = false

critChance = baseCritChance
critMultiplier = 1.5
//projectileBonus = baseAbilityProjectileBonus
areaOfEffectScalar = baseAreaOfEffectScalar
abilityCooldownScalar = 1		// this is a "% faster" scalar
attackSpeedScalar = baseAttackSpeedScalar

autoAttack = false
autoAttackMaxRange = 180
isAttacking = false
inputEnabled = true

maxHp = baseMaxHp
hp = maxHp

maxArmor = baseMaxArmor
armor = maxArmor

moveSpeedMax = baseMoveSpeedMax
moveAccel = 0.6
moveDeaccel = 0.6
moveAngle = 0
moveSpeed = 0
accelX = 0
accelY = 0

xVel = 0
yVel = 0
controllerIndex = 0
invulnFrames = stf(baseRecoveryTime)
lastHitOn = -1 - invulnFrames

attackAngle = 0

flies = false
phases = false
floats = false

ultimateChargeDelayMax = seconds_to_frames(6)
ultimateChargeDelay = 0
ultimateCharge = 0
ultimateChargeMax = 1000
hasUltimate = false

weaponList = ds_list_create()
defaultWeapon = obj_weapon_greataxe

//warHammerEquipped = false
//daggerEquipped = false
isAlwaysAttacking = false

auraYOffset = 4

alphaScalar = 1

hitWall = false

razorCd = 240
razorMaxCd = 480

activeAbility = noone // default active ability to load for first slot
ultimateAbility = noone // ultimate ability

activeAbilities = [
	noone,
	noone,
	noone,
	noone,
	noone
]

availableWeapons = [
	obj_weapon_greataxe,
	obj_weapon_war_hammer
]

sprIdle = spr_jonah
sprWalking = spr_jonah_walking
sprSlam = spr_jonah_slam

animAbilityQueue = function() {}

abilitiesMax = 4
abilities = []
onHitAbilities = []					// Array of instances that have activateOnHit() functions
onAttackAbilities = []				// Array of instances that have activateOnAttak() functions
onStrikeAbilities = []				// Array of instances that have activateOnStrike() functions, when attack lands
onHealAbilities = []				// Array of instances that have activateOnHeal() functions

sideArms = []

chargeCurrentFrame = 0
chargeMaxLength = 1
//isCharging = false

abilityTrees = []

chargeShockFrames = 0

maxTrinkets = 4
trinkets = []

controllerAimingCursorPos = new vec2()
controllerAimingCursorOffset = 50
uiDrawOffset = new vec2()

state = playerStates.idle

healthUiController = create_instance(obj_health_ui_controller)
healthUiController.setup(id)

coinUiController = create_instance(obj_coin_ui_controller)
coinUiController.setup(id)

xpUiController = create_instance(obj_xp_ui_controller)
xpUiController.setup(id)

runStatsController = create_instance(obj_run_stats_controller)
runStatsController.owner = id

statsMenu = create_instance(obj_player_stats_menu)
statsMenu.setup(id)

equipment = {
	head: noone,
	chest: noone,
	weapon: noone,
	//offHand: noone,
	boots: noone,
	gloves: noone,
	neck: noone,
	ringLeft: noone,
	ringRight: noone,
}

backpack = create_backpack_for_player()

keys = []

gamepad_set_axis_deadzone(controllerIndex, 0.2)

stepBegin = function() {}

applyHeal = function(_amount) {
	hp += _amount
	
	if (hp > maxHp) {
		hp = maxHp
	}
}

///@description							Checks if a player has a trinket. Returns 0 if no trinket.
///@param {asset.GMObject} _trinket		Weapon to add of obj_weapon
///@real {real}
getTrinketLevel = function(_trinket) {
	for (var i = 0; i < array_length(trinkets); i++) {
		if (trinkets[i].object_index == _trinket) {
			return trinkets[i].level
		}
	}
	
	return 0
}

///@description							Adds a weapon to a player object
///@param {asset.GMObject} _weapon		Weapon to add of obj_weapon
addWeapon = function(_weapon) {
	var _inst = create_instance(_weapon)
	
	if (!variable_instance_exists(_inst, "isEquipment")) {
		show_error("non-equipment weapon added", true)
	}
	
	//ds_list_add(weaponList, inst)
	
	equipment.weapon = _inst
	_inst.equipped = true
	
	_inst.owner = id
}

///@description							Equip an item
///@param {id.Instance}	item			Item to equipment
///@param {bool} replace				Replaces equipped item in that slot if there is one
equipItem = function(item, replace = true) {
	var structKey = getSlotStringFromEnum(item.slot)
	var equippedItem = struct_get(equipment, structKey)
	
	if (replace) {
		if (equippedItem != noone) {
			equippedItem.equipped = false
		}
	
		item.equip()	
		struct_set(equipment, structKey, item)
	} else {
		if (equippedItem == noone) {
			item.equip()
			struct_set(equipment, structKey, item)
		} else {
			item.unequip()
		}
	}
	
	process_player_stats()
}

///@description							Removes an item from a slot
///@param {string} structKey			Equipment struct key or equipmentSlots enum
removeEquipment = function(structKey) {
	var equippedItem = struct_get(equipment, structKey)
	
	equippedItem.unequip()
	struct_set(equipment, structKey, noone)
	
	process_player_stats()
}

///@description				Gets the string to use for the player's equipment struct
///@param {real} slotEnum	equipmentSlots enum
///@return {string}
getSlotStringFromEnum = function(slotEnum) {
	switch (slotEnum) {
		case equipmentSlots.head: return "head"
		case equipmentSlots.chest: return "chest"
		case equipmentSlots.weapon: return "weapon"
		case equipmentSlots.boots: return "boots"
		case equipmentSlots.gloves: return "gloves"
		case equipmentSlots.neck: return "neck"
		case equipmentSlots.ringLeft: return "ringLeft"
		case equipmentSlots.ringRight: return "ringRight"
	}
}

///@description				Returns whether or not the player can use his ultimate
///@return {bool}
canUseUltimate = function() {
	if (ultimateCharge < ultimateChargeMax)
		return false
	
	return true
}

///@description					Adds to the player's ultimate meter (maxes at 1000)
///@param {real} _amount		Amount to add
addUltimateCharge = function(_amount) {
	if (ultimateChargeDelay > 0) {
		return 0
	}
	
	ultimateCharge = min(ultimateCharge + _amount, ultimateChargeMax)
}
