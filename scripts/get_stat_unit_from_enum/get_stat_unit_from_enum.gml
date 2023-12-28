///@description				Returns a stat unit that includes display data for a stat
///@param {real} _enum		statUnit enum to ref
///@return {struct.statUnit}
function get_stat_unit_from_enum(_enum) {
	var _unit
	
	switch (_enum) {
		case statUnits.meters:
			_unit = new statUnit(0.01, " m")
		break
		
		case statUnits.moveSpeed:
			_unit = new statUnit(1, " m/s")
		break
		
		case statUnits.percent:
			_unit = new statUnit(100, "%")
		break
		
		case statUnits.seconds:
			_unit = new statUnit(1, " sec")
		break
		
		case statUnits.frames:
			_unit = new statUnit(frames_to_seconds(1), " sec")
		break
		
		default:
			_unit = new statUnit(1, "")
		break
	}
	
	return _unit
}