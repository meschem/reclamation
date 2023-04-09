/// @description   Description
/// @param talentEnum	{real}	talentEnum
/// @return {Any}

function get_talent_level(talentEnum) {
	return talents[talentEnum][talentProps.curLevel]
}