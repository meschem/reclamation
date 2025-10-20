/// @description					Stuns an enemy for a duration
/// @param {id.Instance} baddie		Targt to push
/// @param {real} lengthSeconds		Length in seconds

function stun_baddie(baddie, lengthSeconds) {
	if (baddie.targetType != targetTypes.baddie) {
		return 0
	}
	
	var stunFrames = lengthSeconds * fps

	with (baddie) {
		if (baddie.stunLength < stunFrames) {
			baddie.stunLength = stunFrames
		}
		
		baddie.state = enemyStates.stunned
	}
}