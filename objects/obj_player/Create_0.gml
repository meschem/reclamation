///@description Init

enum playerCharacters {
	jonah
}

enum enumInputTypes {
	none,
	keyboardMouse,
	controller
}

kmInput = new keyMouseInput()
controllerInput = new gamepadInput()
controllerIndex = 0

inputFocus = enumInputTypes.keyboardMouse

depth = depths.player

age = 0

reticles = [
	spr_reticle_arrow_sm,
	spr_reticle_crossbow
]

reticleIndex = 0

baseMaxHp = 50
baseMoveSpeedMax = 1
baseMaxArmor = 0
baseCritChance = 0.1
baseCritMultiplier = 1.5
baseAreaOfEffectScalar = 1
baseAbilityCooldownScalar = 1
baseAttackSpeedScalar = 1
baseKnockbackMultiplier = 1

bonusProjectileCount = 0
bonusDamageScalar = 1
bonusPickupRangeScalar = 1
bonusPickupRewardScalar = 1
bonusWeaponAoeScalar = 1
bonusWeaponKnockbackScalar = 1

totalGold = 0
gold = 0
xp = 0
level = 1
abilityTreeLevel = 1

critChance = baseCritChance
critMultiplier = 1.5
//projectileBonus = baseAbilityProjectileBonus
areaOfEffectScalar = baseAreaOfEffectScalar
abilityCooldownScalar = baseAbilityCooldownScalar
attackSpeedScalar = baseAttackSpeedScalar

autoAttack = false
autoAttackMaxRange = 180
isAttacking = false

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
isCharging = false

xVel = 0
yVel = 0
controllerIndex = 0
invulnFrames = 90
lastHitOn = -1 - invulnFrames

attackAngle = 0

flies = false
phases = false

weaponList = ds_list_create()

//warHammerEquipped = false
//daggerEquipped = false
isAlwaysAttacking = false

auraYOffset = 4

hitWall = false

razorCd = 240
razorMaxCd = 480

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

onHitAbilities = []					// Array of instances that have activateOnHit() functions
onAttackAbilities = []
onStrikeAbilities = []
onHealAbilities = []				// Array of instances that have activateOnHeal() functions

sideArms = []

chargeCurrentFrame = 0
chargeMaxLength = 1
isCharging = false

abilityTrees = []

chargeShockFrames = 0

maxTrinkets = 4
trinkets = []

controllerAimingCursorPos = new vec2()
controllerAimingCursorOffset = 50
uiDrawOffset = new vec2()

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

gamepad_set_axis_deadzone(controllerIndex, 0.2)

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
	
	_inst.owner = id
}

///@description							Equip an item
///@param {id.Instance}	item			Item to equipment
equipItem = function(item) {
	var structKey = getSlotStringFromEnum(item.slot)
	var equippedItem = struct_get(equipment, structKey)
	
	if (equippedItem != noone) {
		equippedItem.equipped = false
	}
	
	item.equip()	
	struct_set(equipment, structKey, item)
	
	process_player_stats()
}

///@description							Removes an item from a slot
///@param {string} structKey			Equipment struct key
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
