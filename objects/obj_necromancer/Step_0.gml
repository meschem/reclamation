
// Inherit the parent event
event_inherited();

if (state == enemyStates.normal) {
	summonCdCur--

	if (summonCdCur <= 0) {
		summonCdCur = random_range(summonCdMin, summonCdMax)
		
		summon_skeletons(summonCount, summonType)
	}
}
