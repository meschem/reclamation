
if (statsDrawLines < array_length(stats)) {
	statsDrawCdCur--

	if (statsDrawCdCur <= 0) {
		statsDrawCdCur = statsDrawCdMax
		statsDrawLines++
	}
}
