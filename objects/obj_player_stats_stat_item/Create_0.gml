///@description			Init

stat = enumPlayerStats.maxHp

statName = "Unset"
statDescription = "Unset Desc"
statValueReadable = "-"

name = ""
bonusVar = ""
playerVar = ""
unitEnum = statUnits.none
prepend = true
total = 0
owner = noone
value = 0

persistent = true

///@description			Sets up initial info.
///@return {string}
getInfo = function() {
	//var _statInfo = get_item_stat_type(stat)
	
	//name = _statInfo.displayName
	//bonusVar = _statInfo.bonusVar
	//playerVar = _statInfo.playerVar
	//unitEnum = _statInfo.unitEnum
	//prepend = _statInfo.prepend
	
	
	
	//setup = true
}

///@description			Updates the total value
///@return {string}
//updateTotal = function() {
//	total = get_player_stat(playerStat)
//}

///@description			Gets the text to draw
///@return {string}
//getText = function() {
//	return string(total)
//}
