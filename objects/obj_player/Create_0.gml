// Weapons are used on right stick directional input
enum playerWeapons {
	warHammer,
	bow,
	dagger
}

// Sidearms activate periodically
enum playerSideArms {
	razors
}

// Passives are always active
enum playerPassives {
	healthRegen
}

// Abilities are used on ability inputs
enum playerAbilities {
	null,
	fortify,
	warStomp,
	dash,
	charge,
	length
}

enum levelUpRewards {
	abilitySelect,
	weaponUpgrade,
	heroTalent,
	statPoint
}

kmInput = new keyMouseInput()

depth = depths.player

maxHp = 30
hp = maxHp

age = 0
moveSpeedMax = 1.4
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

warHammerEquipped = false
daggerEquipped = false
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

onHitAbilities = []
onAttackAbilities = []
onStrikeAbilities = []

sideArms = []

chargeCurrentFrame = 0
chargeMaxLength = 1
isCharging = false

abilityTrees = [
	obj_abil_tree_jonah_combat,
	obj_abil_tree_jonah_defense,
	obj_abil_tree_jonah_storm
]

add_weapon(playerWeapons.warHammer)
//add_ability(playerAbilities.warStomp)
//add_ability(playerAbilities.charge)

gamepad_set_axis_deadzone(controllerIndex, 0.2)

generate_ability_instances()