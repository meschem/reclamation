/// @description Init

// Inherit the parent event
event_inherited()

name = "Shielding"

depth = depths.fx

///@description                     Applies shielding to minions
///@param {id.Instance} _inst       Instance being affected
onApplyToMinion = function(_inst) {
    _inst.shieldBuffInvuln = true
    _inst.moveSpeedMax *= 0.9
    _inst.hp *= 0.5
    _inst.hpMax = _inst.hp
}

onApplyToOwner = function(_inst) {
    _inst.hp *= 0.5
    _inst.hpMax = _inst.hp
}