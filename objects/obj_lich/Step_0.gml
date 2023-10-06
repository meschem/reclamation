// Inherit the parent event
event_inherited();

if (state == enemyStates.normal) {
	if (iceBlastSwarmCd > 0) {
		iceBlastSwarmCd--
	} else {
		if (iceBlastSwarmFiringCd > 0) {
			if (iceBlastSwarmFiringCd % iceBlastSwarmFireRate == 0) {
				var angle = irandom(360)
				var mag = 30
				var vector = get_vector_from_angle_mag(angle, mag)
				
				delayed_ice_blast(x + vector[0], y + vector[1])
			}
			
			iceBlastSwarmFiringCd--
		} else {
			iceBlastSwarmFiringCd = iceBlastSwarmFiringCdMax
			iceBlastSwarmCd = iceBlastSwarmCdMax
		}
	}
}
