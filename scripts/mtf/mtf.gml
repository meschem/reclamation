///@param {real} _minutes	Minutes to convert
///@return {real}
function mtf(_minutes) {
	return (stf(_minutes) * 60)
}

///@param {real} _frames	Frames to convert
///@return {real}
function ftm(_frames) {
	return (fts(_frames) / 60)
}
