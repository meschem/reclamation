// Inherit the parent event
event_inherited();

displayText = "Volume"
endText = string(round(global.masterGain * 100)) + "%"

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	global.masterGain += 0.1
	
	if (global.masterGain > 1) {
		global.masterGain = 0
	}
	
	audio_master_gain(global.masterGain)
	
	endText = getMasterGain()
}

getMasterGain = function() {
	var _txt = string(round(global.masterGain * 100)) + "%"
	
	return _txt
}
