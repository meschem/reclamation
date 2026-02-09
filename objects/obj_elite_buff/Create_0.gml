/// @description Init

enum eliteBuffs {
	tough,
	fast,
	spawner,
	shielding,
    protectiveDome,
    immovable,
    physicalResist,
    magicalResist,
    meteoric,
    freezing,
    shocking,
    teleporting,
}

name = "Unnamed"

hpScalar = 1
moveSpeedScalar = 1
weightScalar = 1

owner = noone
minions = []
age = 0

depth = depths.enemyFloorFx

activate = function() {
	// defaults to nothing
}

///@description                 Applies scalar to a minion of an elite
///@param {id.Instance} _inst   Minion to apply buff to
onApplyToMinion = function(_inst) {
    // defaults to nothing
}

///@description                 Applies scalar to a minion of an elite
///@param {id.Instance} _inst   Onwer to apply buff to
onApplyToOwner = function(_inst) {
    // defaults to nothing
}

///@description                 Applies scalar to a minion of an elite
///@param {id.Instance} _inst   Minion to apply buff to
applyScalarsToMinion = function(_inst) {
    _inst.hpMax *= hpScalar
    _inst.moveSpeedMax *= moveSpeedScalar
    _inst.weight *= weightScalar
    
    _inst.hp = _inst.hpMax
    
    onApplyToMinion(_inst)
    
    array_push(minions, _inst)
}

///@description                 Applies all scalars to the elite instancee itself
applyScalarsToOwner = function() {
	if (owner == noone) {
		create_toaster("Owner not set on Elite Buff", errorLevels.error)
		return 0
	}
    
    onApplyToOwner(owner)
	
	owner.hpMax *= hpScalar
	owner.hp = owner.hpMax
}
