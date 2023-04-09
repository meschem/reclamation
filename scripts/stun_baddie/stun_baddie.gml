/// @description			Stuns an enemy for a duration
/// @param {id.object}		baddie
/// @param {real}			lengthSeconds	Length in seconds

function stun_baddie(baddie, lengthSeconds) {
	var stunFrames = lengthSeconds * fps

	with (baddie) {
		if (baddie.stunLength < stunFrames) {
			baddie.stunLength = stunFrames
		}
	}
}