///@description Init

enum playerCharacters {
	jonah
}

enum enumInputTypes {
	none,
	keyboardMouse,
	controller
}

// Weapons are used on right stick directional input
//enum playerWeapons {
//	warHammer,
//	bow,
//	dagger
//}

// Sidearms activate periodically
//enum playerSideArms {
//	razors
//}

// Passives are always active
//enum playerPassives {
//	healthRegen
//}

// Abilities are used on ability inputs
//enum playerAbilities {
//	null,
//	fortify,
//	warStomp,
//	dash,
//	charge,
//	length
//}

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
baseMoveSpeedMax = 1.1
baseMaxArmor = 0
baseCritChance = 0.1
baseAreaOfEffectScalar = 1
baseAbilityCooldownScalar = 1
baseAttackSpeedScalar = 1

bonusProjectileCount = 0
bonusDamageScalar = 1
bonusPickupRangeScalar = 1
bonusPickupRewardScalar = 1

totalGold = 0
gold = 0
xp = 0
level = 1
abilityTreeLevel = 1

critChance = baseCritChance
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

sprIdle = spr_jonah
sprWalking = spr_jonah_walking
sprSlam = spr_jonah_slam

animAbilityQueue = function() {}

onHitAbilities = []
onAttackAbilities = []
onStrikeAbilities = []

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

///@description						Adds a weapon to a player object
///@param {asset.GMObject} weapon	Weapon to add of obj_weapon
addWeapon = function(weapon) {
	var inst = create_instance(weapon)
	
	if (!variable_instance_exists(inst, "isEquipment")) {
		show_error("non-equipment weapon added", true)
	}
	
	//ds_list_add(weaponList, inst)
	
	equipment.weapon = inst
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