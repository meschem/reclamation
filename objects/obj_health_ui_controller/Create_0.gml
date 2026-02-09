///@description			Init

age = 0

setup = false
pips = []
pipsTotal = 0
pipsFull = 0
healthCurrent = 0
healthMax = 0
playerHealthCur = 0
playerHealthMax = 0

updateRate = 4
updateCd = 0

player = noone
drawStart = new vec2(20, 39)
iconSpacing = 23
healthPerIcon = 10

sprEmpty = spr_ui_heart_empty
sprFull = spr_ui_heart
sprHeal = spr_ui_heart_heal
sprDamage = spr_ui_heart_damage

persistent = true

setup = function(_player) {
	player = _player
	playerHealthMax = _player.maxHp
	playerHealthCur = _player.hp
	
	//healthMax = playerHealthMax
	//healthCurrent = 0	
	
	pipsTotal = playerHealthMax / healthPerIcon
	pipsFull = pipsTotal
	
	setup = true
}

///@description		Damages hearts
damage = function(_amount) {

}

///@description		Heals hearts
heal = function(_amount) {

}

///@description		Destroys all hearts
kill = function() {

}
