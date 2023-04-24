/// @description Insert description here
// You can write your code in this editor

if (!enabled || game_is_paused())
	return 0
	
if (active) {
	curCd--
	
	if (curCd <= 0) {
		curCd = maxCd
		
		activate()
	}
}
